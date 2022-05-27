const a = require('./a');
const module2 = require('./module2');

console.log(a + ' in b.js');
console.log(module2.add(1, 4) + ' m2 - add');
console.log(' m2 - mul %d',module2.multipy(1, 4) );


const nconf = require('nconf');
nconf.env();
console.log('%s', nconf.get('OS'));