// This is a debugging code for my history...

// require('../node_modules/stylelint/lib/cli')(process.argv.slice(2));

// import buildCLI from './node_modules/stylelint/lib/cli.js';
// buildCLI(process.argv.slice(2));


// import process from 'node:process';

// console.info(process)


import process from 'https://deno.land/std@0.173.0/node/process.ts'
import cli from 'npm:stylelint@14.16.1/lib/cli.js';
const ret = await cli(Deno.args);
// import process from 'https://deno.land/std@0.173.0/node/process.ts'
// process.exitCode = 42
console.info(process.exitCode)
// console.info(ret)
// Deno.exit(process.exitCode)
// Deno.exit()
process.exit()
