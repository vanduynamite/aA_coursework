/***********************************************************************
Write a function `printObject(obj)` that prints out all key-value pairs
of an object. HINT: use a for loop.

Example:

var bootcamp = {
 name: 'App Academy',
 color: 'Red',
 population: 120,
};

printObject(bootcamp); // prints

`name - App Academy`
`color - Red`
`population - 120`
***********************************************************************/

var bootcamp = {
 name: 'App Academy',
 color: 'Red',
 population: 120,
};

printObject(bootcamp);

function printObject(obj) {

  for (var k in obj) {

    console.log(k + ' - ' + obj[k]);

  }

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = printObject;
