
main();

function main() {

  a = Math.floor(Math.random()*100);
  console.log('Is ' + a + ' odd? ' + isOdd(a));
  console.log('');

  a = Math.floor(Math.random()*100);
  console.log(a + ' plus five is ' + plusFive(a));
  console.log('');

  a = Math.floor(Math.random()*100);
  console.log('Is ' + a + ' a multiple of 3 or 7? ' + threeOrSeven(a));
  console.log('');

  a = 'zippy';
  console.log('I will now say hello to ' + a);
  hello(a);
  console.log('');

  a = 'zippy';
  console.log('Now let\'s yell about ' + a + ': ' + yell(a));
  console.log('');

  a = 'WoW WhAt aBoUt ThIs';
  console.log('Now let\'s whisper this: ' + a + '. Here it is: ' + whisper(a));
  console.log('');

  a = 'Here is a phrase';
  b = 'is a';
  console.log('Is "' + b + '" inside the string "' + a + '"? ' + isSubstring(a,b));
  console.log('');

  a = 'Echo';
  console.log('Let\'s make an echo of "' + a + '" (how original...)');
  console.log(echo(a));
  console.log('');

  a = Math.floor(Math.random()*100);
  console.log('Is ' + a + ' even? ' + isEven(a));
  console.log('');

  a = Math.floor(Math.random()*100);
  b = Math.floor(Math.random()*100);
  c = Math.floor(Math.random()*100);
  d = Math.floor(Math.random()*100);
  console.log('Let\'s average ' + a + ', ' + b + ', ' + c + ', and ' + d + '. Here it is: ' + averageOfFour(a, b, c, d));

  console.log('');
  console.log('');



  console.log('Guess: ' + 6);
  console.log(1 + 1 * 5);
  console.log('');

  console.log('Guess: ' + 10);
  console.log((1 + 1) * 5);
  console.log('');

  console.log('Guess: ' + 1.16666667);
  console.log(1 + 2 - 5 / 6 - 1);
  console.log('');

  console.log('Guess: ' + 12); //this one got me!!
  console.log(5 * 5 % 13);
  console.log('');

  console.log('Guess: ' + (-0.333333333));
  console.log(5/(-1 * (5 - (-10))));
  console.log('');

  console.log('Guess: ' + true);
  console.log(true && true || false);
  console.log('');

  console.log('Guess: ' + true);
  console.log(true && (false || true));
  console.log('');

  console.log('Guess: ' + false);
  console.log((true || false) && (false || false));
  console.log('');

  console.log('Guess: ' + true);
  console.log((true || false) || (false || false));
  console.log('');

}

// Write a function `isOdd` that takes in a number as an argument and returns `true`
// if the number is odd and returns `false` otherwise.
// Write two versions of this function, using conditionals and without using conditionals
//
// Examples:
// isOdd(2);    // => false
// isOdd(5);    // => true
// isOdd(-17);  // => true

function isOdd(num) {
  return (num % 2 == 1);
}


// Write a function `plusFive` that takes in a number as an argument and returns
// the sum of that number and 5.
//
// Examples:
// plusFive(10);  // => 15
// plusFive(2);   // => 7
// plusFive(-8);  // => -3
//

function plusFive(num) {
  return num + 5;
}


// Write a function `threeOrSeven` that takes in a number and returns `true`
// if the number is divisible by either 3 or 7 and `false` otherwise.
// Write two versions of this function, using conditionals and without using conditionals
//
//
// Examples:
// threeOrSeven(3);   // => true
// threeOrSeven(42);  // => true
// threeOrSeven(8);   // => false
//
function threeOrSeven(num) {
  return (num % 3 == 0 || num % 7 == 0);
}

// Write a function `hello` that takes in a string and prints out "Hello, " followed
// by the string. HINT: this function doesn't need to return anything, it should
// just print using console.log
//
// Examples:
// hello("child");    // prints "Hello, child"
// hello("Anthony");  // prints "Hello, Anthony"
//
function hello(str) {
  console.log('Hello, ' + str);
}


// Write a function `yell` that takes in a string and returns a "yelled" version
// of that string.
//
// Examples:
// yell("I want to go to the store"); // => "I WANT TO GO TO THE STORE!!!"
// yell("Time to program"); // => "TIME TO PROGRAM!!!"
//
function yell(string) {
  return string.toUpperCase() + '!!!';
}


// Write a function `whisper` that takes in a string and returns a "whispered" version
// of that string.
//
// Examples:
// whisper("Hey Anthony"); // => "...hey anthony..."
// whisper("YEA! that was fun"); // => "...yea! that was fun..."
function whisper(string) {
  return '...' + string.toLowerCase() + '...';
}


// Write a function `isSubstring` that takes in two strings, `searchString` and
// `subString`. The function should return `true` if `subString` is a part of the
// `searchString`, `false` otherwise.
// Write two versions of this function, using conditionals and without using conditionals
//
// Examples:
// isSubstring("The cat went to the store", "he cat went"); // => true
// isSubstring("Time to program", "time"); // => true
// isSubstring("Jump for joy", "joys"); // => false
//
function isSubstring(searchString, subString) {
  return searchString.indexOf(subString) > -1;
}


// Write a function `echo` that takes in a string and returns that string "echo-ized".
//
// Examples:
// echo("Mom!"); // => "MOM! ... Mom! ... mom!"
// echo("hey"); // => "HEY ... hey ... hey"
// echo("JUMp"); // => "JUMP ... JUMp ... jump"
//
function echo(string) {
  dots = ' ... ';
  return string.toUpperCase() + dots + string + dots + string.toLowerCase();
}


// Write a function `isEven` that takes in a number and returns `true` if the number
// is even, `false` otherwise. Write `isEven` by using the `isOdd` function you
// made previously. HINT: you can call `isOdd` from within `isEven`.
//
// Examples:
// isEven(2); // => true
// isEven(5); // => false
function isEven(num) {
  return num % 2 == 0;
}


// Write a function `averageOfFour(num1, num2, num3, num4)` that takes in four
// numbers. The function should return the average of all of the numbers.
//
// Examples:
//
// averageOfFour(10, 10, 15, 5); // => 10
// averageOfFour(3, 10, 11, 4); // => 7
// averageOfFour(1, 2, 3, 4); // => 2.5
function averageOfFour(num1, num2, num3, num4) {

  return (num1 + num2 + num3 + num4) / 4;

}
