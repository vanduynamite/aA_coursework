/***********************************************************************
Write a function commonFactors(num1, num2) that returns an array that
contains the common factors between both numbers. A factor is a number
that divides another number with no remainder.

Examples:

commonFactors(12, 50); // => [ 1, 2 ]
commonFactors(6, 24); // => [ 1, 2, 3, 6 ]
commonFactors(11, 22); // => [ 1, 11 ]
commonFactors(45, 60); // => [ 1, 3, 5, 15 ]
***********************************************************************/

function commonFactors(num1, num2) {

  var lowNum = 0;
  var highNum = 0;
  var fac1 = 0;
  var fac2 = 0;
  var factors = [];

  if (num1 > num2) {
    highNum = num1;
    lowNum = num2;
  } else {
    highNum = num2;
    lowNum = num1;
  }

  for (var i = 1; i <= lowNum; i++) {

    if (lowNum % i === 0 && highNum % i === 0) {
      factors.push(i);
    }

  }

  return factors;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = commonFactors;
