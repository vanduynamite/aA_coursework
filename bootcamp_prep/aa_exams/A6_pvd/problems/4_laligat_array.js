/*******************************************************************************
Write a function laligatArray(array) that takes in an array of numbers and returns
a new array where each number is replaced with its laligat sum.

A number's laligat sum is the the sum of all the prime numbers less than or equal
to that number.

For example, the laligat sum of 10 is: 2 + 3 + 5 + 7 = 17

Examples:
laligatArray([10, 11, 20, 15]); // => [ 17, 28, 77, 41 ]
laligatArray([1, 2, 3, 4, 5]); // => [ 0, 2, 5, 5, 10 ]
*******************************************************************************/

function laligatArray(pArray) {

  // I do this so it doesn't mess with the original passed array
  // It'll mess with it because it's a complex object it's passed byref
  var array = pArray;

  for (var i = 0; i < array.length; i++) {
    array[i] = laligat(array[i]);
  }

  return array;

}

function laligat(num) {

  var sum = 0;

  for (var i = 2; i <= num; i++) {

    if (isPrime(i)) {
      sum += i;
    }

  }

  return sum;

}

function isPrime(num) {

  if (num === 2) {
    return true;
  }

  for (var i = 2; i <= num ** 0.5; i++) {

    if (num % i === 0) {
      return false;
    }

  }

  return true;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = laligatArray;
