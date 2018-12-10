/***********************************************************************
Write a function `lcm(num1, num2)` that returns the lowest number which
is a multiple of both num1 and num2.

Examples:

lcm(2, 3); // => 6
lcm(6, 10); // => 30
lcm(24, 26); // => 312
***********************************************************************/

lcm(3512,14564412);

function lcm(num1, num2) {
  // console.log(num1, num2);
  var startTime = Date.now();

  var num3 = num1;

  while (num3 % num1 !== 0 || num3 % num2 !== 0) {
    num3 += num1;
  }

  // console.log(num3);
  // console.log('Slow way took ' + (Date.now() - startTime) + ' milliseconds');

  fancyLCM(num1, num2);

  return num3;

}

function fancyLCM(num1, num2) {

  var startTime = Date.now();

  var pf1 = primeFactors(num1);
  var pf2 = primeFactors(num2);
  // console.log(pf1, pf2);

  var num3 = 1;

  for (var ind1 = 0; ind1 < pf1.length; ind1++) {

    num3 *= pf1[ind1];

    if (pf2.includes(pf1[ind1])) {
      ind2 = pf2.indexOf(pf1[ind1]);

      pf2 = pf2.slice(0,ind2).concat(pf2.slice(ind2+1));

    }

  }

  for (var ind2 = 0; ind2 < pf2.length; ind2++) {
    num3 *= pf2[ind2];
  }

  // console.log(num3);
  // console.log('Fancy way took ' + (Date.now() - startTime) + ' milliseconds');

}

function primeFactors(num) {

  var pf = [];
  var i = 2;

  while (!isPrime(num)) {

    if (isPrime(i)) {
      while (num % i === 0) {
        num = num / i;
        pf.push(i);
      }
    }

    i++;
  }

  if (num !== 1) pf.push(num);

  return pf;
}

function isPrime(num) {

  for (var i = 2; i <= num ** 0.5; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}


/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = lcm;
