/***********************************************************************
Write a function fibonacci(n) that takes in a number that represents the
length of a sequence. The function should should return the first `n`
numbers in the fibonacci sequence.

The first two numbers of the fibonacci sequence are 1 and 1. The next
number in the sequence can be found by adding the last two numbers in
the sequence.

Solve this without recursion.
If you don't know what recursion is, we'll see it tomorrow!

Examples:

fibonacci(0); // => []
fibonacci(1); // => [ 1 ]
fibonacci(2); // => [ 1, 1 ]
fibonacci(3); // => [ 1, 1, 2 ]
fibonacci(5); // => [ 1, 1, 2, 3, 5 ]
fibonacci(10); // => [ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 ]
***********************************************************************/

function fibonacci(n, arr = []) {

  if (n === 0) {
    return arr;
  } else {

    if (arr.length < 2) {
      a = 0;
      b = 1;
    } else {
      a = arr[arr.length - 2];
      b = arr[arr.length - 1];
    }

    return fibonacci(n - 1, arr.concat(a + b));
  }



}


/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = fibonacci;
