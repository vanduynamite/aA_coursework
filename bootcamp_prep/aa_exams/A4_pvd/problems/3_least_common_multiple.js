/*******************************************************************************
Write a function `leastCommonMultiple(num1, num2)` that returns the
lowest number which is a multiple of both inputs.

Examples:

leastCommonMultiple(2, 3) => 6
leastCommonMultiple(6, 10) => 30
leastCommonMultiple(24, 26) => 312
*******************************************************************************/

function leastCommonMultiple(num1, num2) {

  var arr1 = getPrimeFactors(num1);
  var arr2 = getPrimeFactors(num2);

  return (multiplyElements(arr1, arr2));


  // // this is probably what you were expecting:
  // var found = false;
  //
  // if (num1 < num2) {
  //   var num = num1;
  // } else {
  //   var num = num2;
  // }
  //
  // while (!found) {
  //
  //   if (num % num1 === 0 && num % num2 === 0) {
  //     found = true;
  //   } else {
  //     num++;
  //   }
  //
  // }
  //
  // return num;

}

function multiplyElements(arr1, arr2) {

  var m = 1;

  for (var i = 0; i < arr1.length; i++) {
    m *= arr1[i];
  }

  var curIndex = 0;

  for (var j = 0; j < arr2.length; j++) {

    if (arr1.indexOf(arr2[j], curIndex) !== -1) {
      curIndex = arr1.indexOf(arr2[j]);
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

  primeFactors.push(n);

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

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = leastCommonMultiple;
