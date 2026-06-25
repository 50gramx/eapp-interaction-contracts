import fs from 'fs';
import path from 'path';
import yaml from 'yaml';

// Helper to convert String to PascalCase for Proto message naming
function toPascalCase(str) {
  if (!str) return 'EmptyMessage';
  return str
    .replace(/[-_]+/g, ' ')
    .replace(/[^\w\s]/g, '')
    .replace(/\w\S*/g, (txt) => txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase())
    .replace(/\s+/g, '');
}

// Map ELVT core types and EAMV custom entity types to Proto3 types
function mapPropertyType(prop) {
  const rawType = prop.type || 'ELVT1007';
  const type = rawType.toUpperCase();
  
  if (/^EAMV\d+$/i.test(type)) {
    return prop.repeated ? `repeated ${type}` : type;
  }
  
  switch (type) {
    case 'ELVT1007': // String
    case 'STRING':
      return prop.repeated ? 'repeated string' : 'string';
    case 'ELVT1006': // Integer
    case 'INT':
    case 'INTEGER':
    case 'INT64':
      return prop.repeated ? 'repeated int64' : 'int64';
    case 'ELVT1002': // Boolean
    case 'BOOL':
    case 'BOOLEAN':
      return prop.repeated ? 'repeated bool' : 'bool';
    case 'ELVT1004': // Double
    case 'DOUBLE':
      return prop.repeated ? 'repeated double' : 'double';
    case 'ELVT1005': // Float
    case 'FLOAT':
      return prop.repeated ? 'repeated float' : 'float';
    case 'ELVT1008': // Bytes
    case 'BYTES':
      return prop.repeated ? 'repeated bytes' : 'bytes';
    default:
      // Check if it looks like a variable/entity type code
      const isTypeCode = /^[A-Z]{4}\d+$/i.test(rawType);
      const mappedType = isTypeCode ? rawType.toUpperCase() : toPascalCase(rawType);
      return prop.repeated ? `repeated ${mappedType}` : mappedType;
  }
}

// Find all files matching a pattern recursively
function findFiles(dir, filename) {
  let results = [];
  const list = fs.readdirSync(dir);
  for (const file of list) {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      results = results.concat(findFiles(filePath, filename));
    } else if (file === filename) {
      results.push(filePath);
    }
  }
  return results;
}

// Command line arguments parsing
const args = process.argv.slice(2);
const contractsRoot = args[args.indexOf('--contracts-root') + 1] || '.';
const systemContractsRoot = args[args.indexOf('--system-contracts-root') + 1] || '../eapp-system-contracts';

console.log(`Starting YAML to Proto compilation.`);
console.log(`Contracts Root: ${contractsRoot}`);
console.log(`System Contracts Root: ${systemContractsRoot}`);

const meshVarFiles = findFiles(path.join(contractsRoot, 'src/main/contracts'), 'ethosapp_mesh_variables.yaml');
const meshCapFiles = findFiles(path.join(contractsRoot, 'src/main/contracts'), 'ethosapp_mesh_capabilities.yaml');

// 1. Parse all variables across apps
const variablesByCode = {};

for (const varFile of meshVarFiles) {
  try {
    const content = fs.readFileSync(varFile, 'utf8');
    const parsed = yaml.parse(content);
    if (Array.isArray(parsed)) {
      for (const v of parsed) {
        if (v && v['name-code']) {
          variablesByCode[v['name-code']] = v;
        }
      }
    }
  } catch (e) {
    console.error(`Error reading variable file: ${varFile}`, e);
  }
}

// Helper to generate a message schema string
function generateMessageProto(varCode) {
  const variable = variablesByCode[varCode];
  if (!variable) {
    return `// Warning: Variable ${varCode} definition missing\nmessage ${varCode} {}`;
  }

  const msgName = varCode;
  
  // Extract explicit properties
  const properties = [];
  if (Array.isArray(variable.properties)) {
    properties.push(...variable.properties);
  }
  
  // Infer properties from default: value map if explicit properties are missing
  if (properties.length === 0 && variable.default && variable.default.value && typeof variable.default.value === 'object') {
    const keys = Object.keys(variable.default.value);
    keys.forEach(key => {
      const val = variable.default.value[key];
      let fieldType = 'string';
      if (typeof val === 'number') {
        fieldType = Number.isInteger(val) ? 'int64' : 'double';
      } else if (typeof val === 'boolean') {
        fieldType = 'bool';
      } else if (Array.isArray(val)) {
        fieldType = 'repeated string';
      }
      properties.push({ name: key, type: fieldType });
    });
  }

  let fieldsStr = '';
  if (properties.length === 0) {
    fieldsStr = '  string value = 1;\n';
  } else {
    properties.forEach((prop, idx) => {
      const fieldType = mapPropertyType(prop);
      const fieldName = (prop['name-code'] || prop.name).toLowerCase();
      fieldsStr += `  ${fieldType} ${fieldName} = ${idx + 1};\n`;
    });
  }

  return `message ${msgName} {\n${fieldsStr}}`;
}

// Helper to find target entity variable
function getTargetEntity(mesh) {
  const returns = mesh.returns;
  const expects = mesh.expects;
  if (returns && (returns.startsWith('EAMV') || returns.startsWith('EAIV'))) {
    return returns;
  }
  if (expects && (expects.startsWith('EAMV') || expects.startsWith('EAIV'))) {
    return expects;
  }
  return 'EAMVDefault';
}

// 2. Parse capabilities and group by package and entity
const packagesMap = {};

for (const capFile of meshCapFiles) {
  try {
    const content = fs.readFileSync(capFile, 'utf8');
    const parsed = yaml.parse(content);
    if (Array.isArray(parsed)) {
      // Derive package path relative to contracts directory
      const relativeDir = path.relative(path.join(contractsRoot, 'src/main/contracts'), path.dirname(capFile));
      const packageName = relativeDir.replace(/[\\/]/g, '.');

      if (!packagesMap[packageName]) {
        packagesMap[packageName] = {
          packageName,
          entities: {},
          variablesUsed: new Set()
        };
      }

      const pkgInfo = packagesMap[packageName];

      for (const cap of parsed) {
        if (cap && cap.mesh) {
          const mesh = cap.mesh;
          const targetEntity = getTargetEntity(mesh);
          const context = mesh.context || 'general';
          const capContext = context.charAt(0).toUpperCase() + context.slice(1).toLowerCase();
          const serviceName = `${targetEntity}${capContext}Service`;
          const methodName = cap['name-code'] || mesh.method;

          if (!pkgInfo.entities[targetEntity]) {
            pkgInfo.entities[targetEntity] = {
              services: {},
              variablesUsed: new Set()
            };
          }

          const entityInfo = pkgInfo.entities[targetEntity];
          if (!entityInfo.services[serviceName]) {
            entityInfo.services[serviceName] = [];
          }

          entityInfo.services[serviceName].push({
            name: methodName,
            expects: mesh.expects,
            returns: mesh.returns
          });

          if (mesh.expects) {
            entityInfo.variablesUsed.add(mesh.expects);
            pkgInfo.variablesUsed.add(mesh.expects);
          }
          if (mesh.returns) {
            entityInfo.variablesUsed.add(mesh.returns);
            pkgInfo.variablesUsed.add(mesh.returns);
          }
        }
      }
    }
  } catch (e) {
    console.error(`Error reading capability file: ${capFile}`, e);
  }
}

// 3. Generate and write the .proto files (entities.proto and <entity>_service.proto)
for (const [packageName, pkgInfo] of Object.entries(packagesMap)) {
  const { entities, variablesUsed } = pkgInfo;

  const relativePath = packageName.replace(/\./g, '/');
  const targetDir = path.join(systemContractsRoot, 'src/main/proto', relativePath);
  fs.mkdirSync(targetDir, { recursive: true });

  // Clean up old services.proto if it exists
  const oldServicesFile = path.join(targetDir, 'services.proto');
  if (fs.existsSync(oldServicesFile)) {
    try {
      fs.unlinkSync(oldServicesFile);
      console.log(`Cleaned up old Services file: ${oldServicesFile}`);
    } catch (e) {
      console.warn(`Could not delete old services file: ${oldServicesFile}`, e);
    }
  }

  // Write entities.proto
  if (variablesUsed.size > 0) {
    let entitiesContent = `syntax = "proto3";\n\npackage ${packageName};\n\n`;
    entitiesContent += `option go_package = "${packageName.replace(/\./g, '/')};entities";\n\n`;

    variablesUsed.forEach(varCode => {
      entitiesContent += generateMessageProto(varCode) + '\n\n';
    });

    const entitiesFile = path.join(targetDir, 'entities.proto');
    fs.writeFileSync(entitiesFile, entitiesContent, 'utf8');
    console.log(`Generated Proto Entities: ${entitiesFile}`);
  }

  // Write <entity>_service.proto files
  for (const [entityCode, entityInfo] of Object.entries(entities)) {
    if (Object.keys(entityInfo.services).length > 0) {
      let servicesContent = `syntax = "proto3";\n\npackage ${packageName};\n\n`;

      // Import entities.proto
      if (variablesUsed.size > 0) {
        servicesContent += `import "${packageName.replace(/\./g, '/')}/entities.proto";\n\n`;
      }

      servicesContent += `option go_package = "${packageName.replace(/\./g, '/')};services";\n\n`;

      // Generate services for this entity
      for (const [serviceName, methods] of Object.entries(entityInfo.services)) {
        servicesContent += `service ${serviceName} {\n`;
        methods.forEach(method => {
          const reqVar = variablesByCode[method.expects];
          const resVar = variablesByCode[method.returns];
          const reqName = reqVar ? reqVar['name-code'] : (method.expects || 'EmptyRequest');
          const resName = resVar ? resVar['name-code'] : (method.returns || 'EmptyResponse');

          servicesContent += `  rpc ${method.name} (${reqName}) returns (${resName});\n`;
        });
        servicesContent += `}\n\n`;
      }

      const serviceFile = path.join(targetDir, `${entityCode}_service.proto`);
      fs.writeFileSync(serviceFile, servicesContent, 'utf8');
      console.log(`Generated Proto Service: ${serviceFile}`);
    }
  }
}

console.log('YAML to Proto compilation completed successfully.');
