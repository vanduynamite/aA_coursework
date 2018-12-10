/***********************************************************************
Write a function `nextTwoPrimes(num)` that takes in a number `num` and
returns the next two prime numbers greater than `num`.

Examples:
nextTwoPrimes(2); // => [ 3, 5 ]
nextTwoPrimes(3); // => [ 5, 7 ]
nextTwoPrimes(7); // => [ 11, 13 ]
nextTwoPrimes(8); // => [ 11, 13 ]
nextTwoPrimes(20); // => [ 23, 29 ]
nextTwoPrimes(97); // => [ 101, 103 ]
***********************************************************************/

function nextTwoPrimes(num) {

  var arr = [];
  var checkNum = num + 1;

  while (arr.length < 2) {

    if (isPrime(checkNum)) {
      arr.push(checkNum);

    }

    checkNum++;

  }

  return arr;

}

function isPrime(num) {

  for (var i = 2; i <= Math.pow(num, 0.5); i++) {

    if (num % i === 0) {
      return false;
    }

  }

  return true;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = nextTwoPrimes;
