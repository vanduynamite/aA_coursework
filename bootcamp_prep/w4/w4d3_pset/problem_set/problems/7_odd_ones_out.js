/***********************************************************************
Write a function oddOnesOut(array) that takes in an array of strings and
returns a new array array containing only elements that appeared an even
number of times in the input array.

Examples:

var arr1 = ['a', 'b', 'b', 'c', 'd', 'c', 'c', 'd']
oddOnesOut(arr1); // => [ 'b', 'd' ]

var arr2 = ['fish', 'fish', 'dog', 'cat', 'dog', 'dog']
oddOnesOut(arr2); // => [ 'fish' ]
***********************************************************************/

function oddOnesOut(array) {

  var obj = {};

  for (var i = 0; i < array.length; i++) {
    if (obj[array[i]] === undefined) {
      obj[array[i]] = 0;
    }

    obj[array[i]]++;

  }

  var arr = [];

  for (var key in obj) {
    if (obj[key] % 2 === 0) {
      arr.push(key);
    }
  }

  return arr;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = oddOnesOut;
