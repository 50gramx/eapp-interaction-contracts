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

// Map YAML properties to Proto3 types
function mapPropertyType(prop) {
  const rawType = prop.type || 'string';
  const type = rawType.toLowerCase();
  switch (type) {
    case 'string':
      return 'string';
    case 'int':
    case 'integer':
    case 'int64':
      return 'int64';
    case 'double':
      return 'double';
    case 'float':
      return 'float';
    case 'bool':
    case 'boolean':
      return 'bool';
    case 'bytes':
      return 'bytes';
    case 'list-entity':
      const nested = prop['nested-entity'] || 'string';
      const isNestedCode = /^[A-Z]{4}\d+$/i.test(nested);
      return `repeated ${isNestedCode ? nested.toUpperCase() : toPascalCase(nested)}`;
    default:
      const isTypeCode = /^[A-Z]{4}\d+$/i.test(rawType);
      return isTypeCode ? rawType.toUpperCase() : toPascalCase(rawType);
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
      fieldsStr += `  ${fieldType} ${prop.name} = ${idx + 1};\n`;
    });
  }

  return `message ${msgName} {\n${fieldsStr}}`;
}

// 2. Parse capabilities and group by package
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
          services: {},
          variablesUsed: new Set()
        };
      }

      const pkgInfo = packagesMap[packageName];

      // Load ethosapp.yaml in the same directory to resolve the stable Service name from app's name-code
      let appServiceDefaultName = null;
      try {
        const ethosappPath = path.join(path.dirname(capFile), 'ethosapp.yaml');
        if (fs.existsSync(ethosappPath)) {
          const ethosappYaml = yaml.parse(fs.readFileSync(ethosappPath, 'utf8'));
          if (ethosappYaml && ethosappYaml['name-code']) {
            appServiceDefaultName = toPascalCase(ethosappYaml['name-code']) + 'Service';
          }
        }
      } catch (err) {
        console.warn(`Could not read ethosapp.yaml in ${path.dirname(capFile)}`, err);
      }

      for (const cap of parsed) {
        if (cap && cap.mesh) {
          const mesh = cap.mesh;
          const serviceFull = mesh.service; 
          if (!serviceFull) continue;

          // Use resolved stable service name from ethosapp.yaml, or fallback to the parsed service name
          const serviceName = appServiceDefaultName || serviceFull.split('.').pop();
          // RPC method name: use capability name-code, or fallback to capability method name
          const methodName = cap['name-code'] || mesh.method;

          if (!pkgInfo.services[serviceName]) {
            pkgInfo.services[serviceName] = [];
          }

          pkgInfo.services[serviceName].push({
            name: methodName,
            expects: mesh.expects,
            returns: mesh.returns
          });

          if (mesh.expects) pkgInfo.variablesUsed.add(mesh.expects);
          if (mesh.returns) pkgInfo.variablesUsed.add(mesh.returns);
        }
      }
    }
  } catch (e) {
    console.error(`Error reading capability file: ${capFile}`, e);
  }
}

// 3. Generate and write the .proto files (entities.proto and services.proto)
for (const [packageName, pkgInfo] of Object.entries(packagesMap)) {
  const { services, variablesUsed } = pkgInfo;

  const relativePath = packageName.replace(/\./g, '/');
  const targetDir = path.join(systemContractsRoot, 'src/main/proto', relativePath);
  fs.mkdirSync(targetDir, { recursive: true });

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

  // Write services.proto
  if (Object.keys(services).length > 0) {
    let servicesContent = `syntax = "proto3";\n\npackage ${packageName};\n\n`;

    // Import entities.proto
    if (variablesUsed.size > 0) {
      servicesContent += `import "${packageName.replace(/\./g, '/')}/entities.proto";\n\n`;
    }

    servicesContent += `option go_package = "${packageName.replace(/\./g, '/')};services";\n\n`;

    // Generate services
    for (const [serviceName, methods] of Object.entries(services)) {
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

    const servicesFile = path.join(targetDir, 'services.proto');
    fs.writeFileSync(servicesFile, servicesContent, 'utf8');
    console.log(`Generated Proto Services: ${servicesFile}`);
  }
}

console.log('YAML to Proto compilation completed successfully.');
