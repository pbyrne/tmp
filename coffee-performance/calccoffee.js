require('coffee-script');
fib = require('./fib.coffee');

// 0 is 'node', 1 is the name of the script, 2 is the first argument
var value = process.argv[2]

if (value != undefined) {
  console.log("The fibonacci value for " + value + " is " + fib.fibonacci(parseInt(value)));
} else {
  console.log("Done loading. No value provided so no calculation");
}
