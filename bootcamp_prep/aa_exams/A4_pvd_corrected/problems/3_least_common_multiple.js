/*******************************************************************************
Write a function `leastCommonMultiple(num1, num2)` that returns the
lowest number which is a multiple of both inputs.

Examples:

leastCommonMultiple(2, 3) => 6
leastCommonMultiple(6, 10) => 30
leastCommonMultiple(24, 26) => 312
*******************************************************************************/

function leastCommonMultipleFast(num1, num2) {

  var arr1 = getPrimeFactors(num1);
  var arr2 = getPrimeFactors(num2);
  // console.log(arr1, arr2);

  return (multiplyElements(arr1, arr2));

}

function leastCommonMultiple(num1, num2) {
  // the NEW much simpler solution :)
  var lcm = num1;

  while (lcm % num2 !== 0) {
    lcm += num1;
  }

  return lcm;
}

function multiplyElements(arr1, arr2) {

  var m = 1;

  for (var i = 0; i < arr1.length; i++) {
    m *= arr1[i];
  }

  var curIndex = 0;

  for (var j = 0; j < arr2.length; j++) {

    if (arr1.indexOf(arr2[j], curIndex) !== -1) {
      //curIndex = arr1.indexOf(arr2[j]);
      curIndex = arr1.indexOf(arr2[j]) + 1;
    } else {
      m *= arr2[j];
    }

  }

  return m;

}

function getPrimeFactors(n) {

  var primeFactors = [];

  for (var i = 2; i <= Math.pow(n, 0.5); i++) {

    if (isPrime(i)) {

      while (n % i === 0) {

        n = n / i;
        primeFactors.push(i);

      }

    }

  }

  if (n !== 1) {
    primeFactors.push(n);
  }

  return primeFactors;

}

function isPrime(n) {

  for (var i = 2; i <= Math.pow(n, 0.5); i++) {

    if (n % i === 0) {

      return false;

    }

  }

  return true;

}


var num1 = 3492145;
var num2 = 931274413;

var startTime = Date.now();
console.log(leastCommonMultiple(num1, num2));
console.log('Slow version took ' + (Date.now() - startTime) + ' milliseconds');


var startTime = Date.now();
console.log(leastCommonMultipleFast(num1, num2));
console.log('Fast version took ' + (Date.now() - startTime) + ' milliseconds');


/* Usually the simplest solution is the best
I was curious about your code so I ran a few test cases
when you run leastCommonMultiple(3, 9) you und up with
the return value being 3 when it should be 9. I think
that your problem is when currIndex is set to 0 when
you find the value in the 0th index of arr2. though I
am not trully sure of the math theory involved --DV*/


/* I just needed to change line 45 by adding '+ 1' as
shown above!

However, I did learn from going over this one in class
about a much nicer solution (besides my wacky prime
factor method of course), so I put that up there too.
The only reason I like this one is because I was using
something similar in an Euler problem. Obviously it's
not actually practical...maybe there is some use somewhere.

Thanks for finding this bug! - PvD */

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = leastCommonMultiple;
