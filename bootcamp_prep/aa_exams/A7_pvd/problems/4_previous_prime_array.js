/*******************************************************************************
Write a function previousPrimeArray(array) that takes in an array of numbers.
The function should a return a new array where each prime number is replaced
with the prime number that comes before it. For example the prime number that comes
before 7 is 5.

Examples:

previousPrimeArray([10, 12, 11, 7, 16]); // => [ 10, 12, 7, 5, 16 ]
previousPrimeArray([17, 24, 29, 5, 2, 4]); // => [ 13, 24, 23, 3, null, 4 ]
*******************************************************************************/

function previousPrimeArray(array) {

  var newArr = [];

  for (var i = 0; i < array.length; i++) {

    if (isPrime(array[i])) {
      newArr.push(findLastPrime(array[i]));
    } else {
      newArr.push(array[i]);
    }

  }

  return newArr;

}

function findLastPrime(n) {

  for (var i = n - 1; i > 1; i--) {

    if (isPrime(i)) {
      return i;
    }

  }

  return null;

}

function isPrime(n) {

  if (n < 2) {
    return false;
  }

  if (n === 2) {
    return true;
  }

  for (var i = 2; i <= n ** 0.5; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = previousPrimeArray;
