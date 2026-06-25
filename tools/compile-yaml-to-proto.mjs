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

// 2. Parse capabilities and group by target Service
const servicesMap = {};

for (const capFile of meshCapFiles) {
  try {
    const content = fs.readFileSync(capFile, 'utf8');
    const parsed = yaml.parse(content);
    if (Array.isArray(parsed)) {
      // Derive package path relative to contracts directory
      const relativeDir = path.relative(path.join(contractsRoot, 'src/main/contracts'), path.dirname(capFile));
      const derivedPackage = relativeDir.replace(/[\\/]/g, '.');

      for (const cap of parsed) {
        if (cap && cap.mesh) {
          const mesh = cap.mesh;
          const serviceFull = mesh.service; 
          if (!serviceFull) continue;

          const serviceName = serviceFull.split('.').pop(); // e.g. ProfileService
          const packageName = derivedPackage; // e.g. community.apps.gramx.fifty.zero.ethos.mesh_demo

          const serviceKey = packageName + '.' + serviceName;

          if (!servicesMap[serviceKey]) {
            servicesMap[serviceKey] = {
              serviceName,
              packageName,
              methods: [],
              variablesUsed: new Set()
            };
          }

          servicesMap[serviceKey].methods.push({
            name: mesh.method,
            expects: mesh.expects,
            returns: mesh.returns
          });

          if (mesh.expects) servicesMap[serviceKey].variablesUsed.add(mesh.expects);
          if (mesh.returns) servicesMap[serviceKey].variablesUsed.add(mesh.returns);
        }
      }
    }
  } catch (e) {
    console.error(`Error reading capability file: ${capFile}`, e);
  }
}

// 3. Generate and write the .proto files
for (const [serviceKey, serviceInfo] of Object.entries(servicesMap)) {
  const { serviceName, packageName, methods, variablesUsed } = serviceInfo;

  let protoContent = `syntax = "proto3";\n\npackage ${packageName};\n\n`;

  // Write import/options headers if desired
  protoContent += `option go_package = "${packageName.replace(/\./g, '/')};${serviceName.toLowerCase()}";\n\n`;

  // Write all referenced variables/messages
  variablesUsed.forEach(varCode => {
    protoContent += generateMessageProto(varCode) + '\n\n';
  });

  // Write the Service block
  protoContent += `service ${serviceName} {\n`;
  methods.forEach(method => {
    const reqVar = variablesByCode[method.expects];
    const resVar = variablesByCode[method.returns];
    const reqName = reqVar ? reqVar['name-code'] : (method.expects || 'EmptyRequest');
    const resName = resVar ? resVar['name-code'] : (method.returns || 'EmptyResponse');

    protoContent += `  rpc ${method.name} (${reqName}) returns (${resName});\n`;
  });
  protoContent += `}\n`;

  // Write to path in system-contracts (dot mapping to folder path)
  const relativePath = packageName.replace(/\./g, '/');
  const targetDir = path.join(systemContractsRoot, 'src/main/proto', relativePath);
  fs.mkdirSync(targetDir, { recursive: true });

  const targetFile = path.join(targetDir, `${serviceName}.proto`);
  fs.writeFileSync(targetFile, protoContent, 'utf8');
  console.log(`Generated Proto Contract: ${targetFile}`);
}

console.log('YAML to Proto compilation completed successfully.');
