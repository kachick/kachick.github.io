// require('../node_modules/stylelint/lib/cli')(process.argv.slice(2));

// import buildCLI from './node_modules/stylelint/lib/cli.js';
// buildCLI(process.argv.slice(2));


import cli from 'npm:stylelint@14.16.1/lib/cli.js';
cli(Deno.args);
