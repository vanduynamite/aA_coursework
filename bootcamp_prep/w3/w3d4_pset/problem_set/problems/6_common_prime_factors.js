/***********************************************************************
Write a function `commonPrimeFactors` that takes in two numbers as
arguments and returns an array of all prime factors that are common
between the two numbers. A factor is a number that divides another
number without resulting in a remainder.

Examples:

commonPrimeFactors(12, 50); // => [ 2 ]
commonPrimeFactors(6, 24); // => [ 2, 3 ]
commonPrimeFactors(11,22); // => [ 11 ]
commonPrimeFactors(45, 60); // => [ 3, 5 ]
***********************************************************************/

function commonPrimeFactors(num1, num2) {

  var factors = [];

  for (var i = 2; i <= num1; i++) {
    if (isPrime(i) && num1 % i === 0 && num2 % i === 0) {
      factors.push(i);
    }
  }

  return factors;

}

function isPrime(n) {

  for (var i = 2; i <= n ** 0.5; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = commonPrimeFactors;
