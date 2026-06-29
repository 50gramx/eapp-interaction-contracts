/**
 * derive-features.mjs
 *
 * Walks every eApp directory under src/main/contracts, reads the local
 * variables + capabilities YAML, derives BDD capability scenarios, and writes
 * .feature + .mapping.json files into the app's features/ directory.
 *
 * Rules:
 *   - Never overwrites open.feature or any file it didn't generate.
 *   - Only writes/updates capability scenario files (one per EALC#### capability).
 *   - A generated file is identified by the header comment "# auto-derived".
 *   - Safe to run repeatedly — idempotent.
 *
 * Usage:
 *   node tools/derive-features.mjs [--contracts-root <path>] [--dry-run]
 */

import fs from 'fs';
import path from 'path';
import yaml from 'yaml';

// ─── CLI args ─────────────────────────────────────────────────────────────────

const args = process.argv.slice(2);
const contractsRootArg = args[indexOf(args, '--contracts-root') + 1];
const dryRun = args.includes('--dry-run');

const contractsRoot = contractsRootArg
  ? path.resolve(contractsRootArg)
  : path.resolve('src/main/contracts');

console.log(`derive-features: scanning ${contractsRoot}${dryRun ? ' [DRY RUN]' : ''}`);

// ─── Helpers ──────────────────────────────────────────────────────────────────

function indexOf(arr, val) {
  const i = arr.indexOf(val);
  return i === -1 ? arr.length - 1 : i; // safe: arr[length] = undefined → +1 = undefined → resolve('.')
}

function loadYaml(filePath) {
  try {
    return yaml.parse(fs.readFileSync(filePath, 'utf8')) ?? [];
  } catch {
    return null;
  }
}

function slug(title) {
  return title.toLowerCase().replace(/[^a-z0-9]+/g, '_').replace(/^_+|_+$/g, '');
}

function isVarCode(s) {
  return typeof s === 'string' && s.startsWith('EAIV');
}

// ─── Step analyser ────────────────────────────────────────────────────────────
// Mirrors ContractScenarioDeriver._CapabilityAnalysis in Dart.

function analyseSteps(steps, variables) {
  const inputs = {};        // varCode → seedValue
  const outputLists = [];   // list-append targets
  const outputScalars = []; // assign-to targets
  const requestMaps = new Set();
  let meshCode = null;

  for (const step of steps) {
    const cmd = step.command;

    if (cmd === 'set-map-value') {
      const tm = step['target-map'];
      const val = step.value;
      if (tm) requestMaps.add(String(tm));
      if (isVarCode(val) && !inputs[val]) {
        inputs[val] = seedValue(variables[val]);
      }

    } else if (cmd === 'mesh-invoke') {
      meshCode = step.capability;
      const a = step['assign-to'];
      if (isVarCode(a) && !outputScalars.includes(a)) outputScalars.push(a);

    } else if (cmd === 'platform-invoke') {
      const a = step['assign-to'];
      if (isVarCode(a)) {
        const v = variables[a];
        const isList = v?.type === 'ELVT1018';
        if (isList && !outputLists.includes(a)) outputLists.push(a);
        else if (!isList && !outputScalars.includes(a)) outputScalars.push(a);
      }

    } else if (cmd === 'list-append') {
      const t = step.target;
      if (isVarCode(t) && !outputLists.includes(t)) outputLists.push(t);

    } else if (cmd === 'set') {
      const t = step.target;
      const v = step.value;
      if (isVarCode(t) && typeof v === 'string' && !v.includes('.') && !isVarCode(v)) {
        if (!outputScalars.includes(t)) outputScalars.push(t);
      }
    }
  }

  // Remove intermediate request map codes from outputs/inputs
  for (const c of requestMaps) {
    delete inputs[c];
    const li = outputLists.indexOf(c); if (li >= 0) outputLists.splice(li, 1);
    const si = outputScalars.indexOf(c); if (si >= 0) outputScalars.splice(si, 1);
  }

  return { inputs, outputLists, outputScalars, meshCode };
}

function seedValue(entry) {
  if (!entry) return 'test-value';
  const name = (entry.name || '').toLowerCase();
  const type = entry.type || 'ELVT1007';
  if (type === 'ELVT1007') {
    if (name.includes('persona')) return 'epn.concierge.v1';
    if (name.includes('text') || name.includes('message') || name.includes('composer'))
      return 'hello from scenario test';
    return 'test-value';
  }
  return 'test-value';
}

// ─── Feature file builder ─────────────────────────────────────────────────────

function buildFeatureFile(appName, cap, variables, analysis) {
  const { inputs, outputLists, outputScalars, meshCode } = analysis;

  const givenLines = Object.entries(inputs).map(([code, val]) => {
    const name = variables[code]?.name ?? code;
    return `Given ${code} (${name}) is set to "${val}"`;
  });

  const givenLine = givenLines.length > 0
    ? givenLines[0]
    : `Given the ${appName} eApp is open`;
  const andLines = givenLines.slice(1).map(l => l.replace(/^Given /, 'And '));

  const whenLine = `When capability ${cap.code} (${cap.name}) is invoked`;

  const thenLines = [
    ...outputLists.map(c => `Then ${c} (${variables[c]?.name ?? c}) has at least 1 item`),
    ...outputScalars.map(c => `Then ${c} (${variables[c]?.name ?? c}) is not empty`),
  ];
  if (meshCode && thenLines.length === 0) {
    thenLines.push('Then the capability completes without error');
  }

  const title = `${cap.name} capability executes`;
  const allRelated = [cap.code, ...Object.keys(inputs), ...outputLists, ...outputScalars];

  const lines = [
    '# auto-derived — do not edit by hand. Re-generated on every contract change.',
    `Feature: ${appName}`,
    `  # As a user, I want ${cap.name} to work so I can use ${appName}.`,
    '',
    `  @${allRelated.join(' @')}`,
    `  Scenario: ${title}`,
    `    ${givenLine}`,
    ...andLines.map(l => `    ${l}`),
    `    ${whenLine}`,
    ...thenLines.map(l => `    ${l}`),
    '',
  ];

  return { title, featureText: lines.join('\n'), givenLine, andLines, whenLine, thenLines, allRelated };
}

function buildMappingJson({ appCode, org, community, cap, title, inputs, outputLists, outputScalars, variables, givenLine, andLines, whenLine, thenLines }) {
  const steps = [];
  for (const [code, val] of Object.entries(inputs)) {
    steps.push({ type: 'given', variable: code, value: val });
  }
  steps.push({ type: 'when', capability: cap.code });
  for (const c of outputLists) {
    steps.push({ type: 'then', assert: 'list-length-gte', variable: c, expected: 1 });
  }
  for (const c of outputScalars) {
    steps.push({ type: 'then', assert: 'not-empty', variable: c });
  }

  const textToCode = {};
  if (givenLine) textToCode[givenLine] = Object.keys(inputs)[0] ?? cap.code;
  for (const l of andLines) {
    const match = l.match(/^And (EAIV\w+)/);
    if (match) textToCode[l] = match[1];
  }
  textToCode[whenLine] = cap.code;
  for (const t of thenLines) {
    const match = t.match(/^Then (EAIV\w+)/);
    if (match) textToCode[t] = match[1];
  }

  return {
    schema: 'epn.scenario.mapping/1',
    scenario_id: `${appCode}_${slug(title)}`,
    app: appCode,
    org,
    community,
    scenario: title,
    capability: cap.code,
    inputs: Object.fromEntries(Object.entries(inputs)),
    expected: {
      outputs: [...outputLists, ...outputScalars],
    },
    conformance: {
      behavioral: outputLists.map(c => `${c} list grows by at least 1 item`).join('; ') ||
                  outputScalars.map(c => `${c} is populated`).join('; ') ||
                  'capability completes without error',
      state: outputScalars.length > 0 ? outputScalars.map(c => `${c} populated`).join(', ') : 'n/a',
      visual: 'n/a',
      structural: 'n/a',
      experience: 'n/a',
    },
    textToCodeMapping: textToCode,
    steps,
  };
}

// ─── eApp discovery ───────────────────────────────────────────────────────────

function findEAppDirs(root) {
  const apps = [];
  function walk(dir, depth) {
    if (depth > 8) return;
    let entries;
    try { entries = fs.readdirSync(dir, { withFileTypes: true }); } catch { return; }
    for (const e of entries) {
      if (!e.isDirectory()) continue;
      const full = path.join(dir, e.name);
      if (fs.existsSync(path.join(full, 'ethosapp.yaml'))) {
        apps.push(full);
      } else {
        walk(full, depth + 1);
      }
    }
  }
  walk(root, 0);
  return apps;
}

// ─── Per-eApp processing ──────────────────────────────────────────────────────

function processApp(appDir) {
  const ethosapp = loadYaml(path.join(appDir, 'ethosapp.yaml'));
  if (!ethosapp) return { skipped: true, reason: 'no ethosapp.yaml' };

  const appCode = ethosapp['name-code'] ?? path.basename(appDir);
  const appName = ethosapp.name ?? appCode;
  const org = ethosapp.org ?? 'epn';

  // Resolve community code from directory path (fifty/zero → 50, etc.)
  const community = resolveCommunity(appDir);

  const variablesRaw = loadYaml(path.join(appDir, 'ethosapp_local_variables.yaml')) ?? [];
  const capabilitiesRaw = loadYaml(path.join(appDir, 'ethosapp_local_capabilities.yaml')) ?? [];

  if (!Array.isArray(variablesRaw) || !Array.isArray(capabilitiesRaw)) {
    return { appCode, skipped: true, reason: 'malformed YAML' };
  }

  // Index variables by code
  const variables = {};
  for (const v of variablesRaw) {
    if (v?.['name-code']) variables[v['name-code']] = v;
  }

  const featuresDir = path.join(appDir, 'features');
  if (!fs.existsSync(featuresDir)) {
    if (!dryRun) fs.mkdirSync(featuresDir, { recursive: true });
  }

  const written = [];
  const skippedFiles = [];

  for (const capRaw of capabilitiesRaw) {
    if (!capRaw?.['name-code'] || !capRaw?.name) continue;

    const cap = {
      code: capRaw['name-code'],
      name: capRaw.name,
      steps: (capRaw.context?.steps ?? []).map(s => {
        if (typeof s !== 'object') return null;
        const { command, ...rest } = s;
        return { command, ...rest };
      }).filter(Boolean),
    };

    if (cap.steps.length === 0) continue;

    const analysis = analyseSteps(cap.steps, variables);
    if (!analysis.meshCode && analysis.outputLists.length === 0 && analysis.outputScalars.length === 0) continue;

    const { title, featureText, givenLine, andLines, whenLine, thenLines, allRelated } =
      buildFeatureFile(appName, cap, variables, analysis);

    const filename = `${slug(title)}.feature`;
    const mappingFilename = `${slug(title)}.mapping.json`;
    const featurePath = path.join(featuresDir, filename);
    const mappingPath = path.join(featuresDir, mappingFilename);

    // Never overwrite a file that wasn't auto-derived
    if (fs.existsSync(featurePath)) {
      const existing = fs.readFileSync(featurePath, 'utf8');
      if (!existing.startsWith('# auto-derived')) {
        skippedFiles.push(filename);
        continue;
      }
    }

    if (!dryRun) {
      fs.writeFileSync(featurePath, featureText, 'utf8');
      fs.writeFileSync(
        mappingPath,
        JSON.stringify(
          buildMappingJson({ appCode, org, community, cap, title, ...analysis, variables, givenLine, andLines, whenLine, thenLines }),
          null, 2
        ) + '\n',
        'utf8'
      );
    }

    written.push(filename);
  }

  return { appCode, appName, written, skippedFiles };
}

function resolveCommunity(appDir) {
  const parts = appDir.replace(/\\/g, '/').split('/');
  const tensWords = { ten: 10, twenty: 20, thirty: 30, forty: 40, fifty: 50, sixty: 60, seventy: 70, eighty: 80, ninety: 90 };
  const onesWords = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 };
  for (let i = 0; i < parts.length - 1; i++) {
    const tens = tensWords[parts[i]];
    const ones = onesWords[parts[i + 1]];
    if (tens !== undefined && ones !== undefined) return tens + ones;
  }
  return 50;
}

// ─── Main ─────────────────────────────────────────────────────────────────────

const appDirs = findEAppDirs(contractsRoot);
console.log(`Found ${appDirs.length} eApp(s).\n`);

let totalWritten = 0;
let totalSkipped = 0;

for (const appDir of appDirs) {
  const result = processApp(appDir);
  if (result.skipped) {
    console.log(`  SKIP  ${path.basename(appDir)} — ${result.reason}`);
    continue;
  }
  if (result.written.length > 0) {
    console.log(`  ${result.appCode} (${result.appName}): wrote ${result.written.length} feature file(s)`);
    for (const f of result.written) console.log(`    + ${f}`);
    totalWritten += result.written.length;
  }
  if (result.skippedFiles.length > 0) {
    console.log(`  ${result.appCode}: preserved ${result.skippedFiles.length} manual file(s)`);
    for (const f of result.skippedFiles) console.log(`    ~ ${f} (manual — not overwritten)`);
    totalSkipped += result.skippedFiles.length;
  }
  if (result.written.length === 0 && result.skippedFiles.length === 0) {
    console.log(`  ${result.appCode}: no capability scenarios to derive`);
  }
}

console.log(`\nDone. ${totalWritten} file(s) written, ${totalSkipped} manual file(s) preserved.`);
if (dryRun) console.log('(dry run — no files written)');
