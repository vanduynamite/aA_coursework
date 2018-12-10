// Define a function `logBetween(lowNum, highNum)` that will print every number
// from `lowNum` to `highNum`, inclusive. Inclusive means that the range includes
// `lowNum` and `highNum`. Hint: this function only needs to print using `console.log`,
// it does not need to return.
//
// Examples:
//
// logBetween(-1, 2); // prints
// -1
// 0
// 1
// 2
//
// logBetween(14, 6); // prints nothing
//
// logBetween(4,6); // prints
// 4
// 5
// 6

console.log('logBetween');
logBetween(-1, 2);
console.log('');

function logBetween(lowNum, highNum) {

  for(var i = lowNum; i <= highNum; i++) {
    console.log(i);
  }

}


// Write a function `logBetweenStepper(min, max, step)` that takes in 3 numbers as
// parameters. The function should print out numbers between `min` and `max` at `step`
// intervals. See the following examples.
//
// Examples:
//
// logBetweenStepper(5, 9, 1) // prints
// 5
// 6
// 7
// 8
// 9
//
// logBetweenStepper(-10, 15, 5) // prints
// -10
// -5
// 0
// 5
// 10
// 15

console.log('logBetweenStepper');
logBetweenStepper(-10, 15, 5);
console.log('');

function logBetweenStepper(min, max, step) {

  for (var i = min; i <= max; i += step) {
    console.log(i);
  }

}

// Write a function `printFives(max)` that prints out the multiples of 5 that are
// less than max.
//
// Try to solve this in two ways, using a conditional (if) and without using a
// conditional
//
// Example:
//
// printFives(20) // prints
// 0
// 5
// 10
// 15

console.log('printFives');
printFives(20);
console.log('');

function printFives(max) {

  for (var i = 0; i < max; i += 5) {
    console.log(i);
  }

}


// Write a function `printReverse(min, max)` that print out all numbers from max
// to min (exclusive), in reverse order.
//
// Examples
//
// printReverse(13, 18) // prints
// 17
// 16
// 15
// 14
//
// printReverse(90, 94) // prints
// 93
// 92
// 91

console.log('printReverse');
printReverse(13, 18);
console.log('');

function printReverse(min, max) {

  for (var i = max - 1; i > min; i--) {
    console.log(i);
  }

}


// Write a function `sumNums(max)` that returns the sum of all positive numbers less
// than or equal to max.
//
// Examples:
//
// sumNums(4); // => 10
// sumNums(10); // => 55
// sumNums(365); // => 66795

console.log('sumNums');
console.log(sumNums(365));
console.log('');

function sumNums(max) {

  var sum = 0;

  for (var i = 1; i <= max; i++) {

    sum += i;

  }

  return sum;

}


// Define a function `isFactorOf(number, factor)` that returns `true` if `factor`
// is a factor of `number`. `false` otherwise. A factor is a number that divides
// another number without a leftover remainder.
//
// Examples:
//
// isFactorOf(6,2); // => true
// isFactorOf(-6, 2); // => true
// isFactorOf(5,0); // => false
// isFactorOf(22, 7); // => false

console.log('isFactorOf');
console.log(isFactorOf(5,0));
console.log('');

function isFactorOf(num, divisor) {

  return (num % divisor === 0);

}


// Define a function `fizzBuzz(max)` that takes a number and prints  every number
// from 0 to `max` that is divisible by either 3 or 5, but not both.
//
// Examples:
//
// fizzBuzz(20); // prints
// 3
// 5
// 6
// 9
// 10
// 12
// 18

console.log('fizzBuzz');
fizzBuzz(20);
console.log('');

function fizzBuzz(max) {

  for (var i = 0; i < max; i++) {

    if ((isFactorOf(i, 3) || isFactorOf(i, 5)) && !isFactorOf(i, 15)) {
      console.log(i);
    }

  }

}


// Define a function `isPrime(number)` that returns `true` if `number` is prime.
// Otherwise, false. Assume `number` is a positive integer.
//
// Examples:
//
// isPrime(2); // => true
// isPrime(10); // => false
// isPrime(11); // => true
// isPrime(15485863); // => true
// isPrime(3548563); // => false

console.log('isPrime');
console.log(isPrime(15485863));
console.log('');

function isPrime(num) {

  for (var i = 2; i <= num/2; i++) {

    if (isFactorOf(num, i)) {
      return false;
    }

  }

  return true;

}

console.log('Practice set 1');
console.log('I guess it will print out: "55 bottles of beer on the wall"');

function func1(num) {
  return num + 50;
}

function func2(num) {
  return num + " bottles of beer on the wall";
}

function func3(num) {
  var x = func1(num);
  return func2(x);
}

var result = func3(5);
console.log(result); // What does this print out?
console.log('');


console.log('Practice set 2');
console.log('I guess it will print out: "Dance Anthony, dance! Dance Haseeb, dance! Dance Winnie, dance!  | " ' +
'...but that three times. I\'m not typing it out');

var foo = function(name) {
  return "Dance " + name + ", dance! "
}

var bar = function() {
  var str = "";

  for (var i = 0; i < 3; i += 1) {
    str += foo("Anthony");
    str += foo("Haseeb");
    str += foo("Winnie");
    str += " | ";
  }

  return str;
}

var result = bar();
console.log(result); // What does this print out?
console.log('');
console.log('why are these people dancing so much');
console.log('');



//debug this:
// function sayHiNTimes(n) {
//   var i = 0;
//
//   while (i < n) {
//     console.log("Hi");
//   }
// }

console.log('Debugged version of sayHiNTimes')
sayHiNTimes(5);
console.log('');

function sayHiNTimes(n) {
  var i = 0;

  while (i < n) {
    console.log("Hi");

    i++; //ya, don't forget this
  }
}


//debug this:
// function isFive(n) {
//   if (n = 5) {
//     return true;
//   } else {
//     return false;
//   }
// }

console.log('Debugged version of isFive');
console.log(isFive(50));
console.log('');

function isFive(n) {
  if (n === 5) { //triple equals
    return true;
  } else {
    return false;
  }
}
