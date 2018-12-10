/***********************************************************************
Write a function `pairProduct(arr, num)` that accepts an array of
numbers (arr) and a target number (num). It should return pairs of
indices whose elements multiply to `num`. No pair should appear twice in
the result.

Use only `while` loops. No `for` loops.

Examples:

pairProduct([1,2,3,4,5], 4); //=> [ [ 0, 3 ] ]
pairProduct([1,2,3,4,5], 8); //=> [ [ 1, 3 ] ]
pairProduct([1, 2, 3, 12, 8], 24); //=> [ [ 1, 3 ], [ 2, 4 ] ]
***********************************************************************/

function pairProduct(arr, num) {

  var arrNew = [];

  var i = 0;
  var j = 0;

  while (i < arr.length) {

    j = i + 1;

    while (j < arr.length) {

      if (arr[i] * arr[j] === num) {

        arrNew.push([i, j]);

      }

      j++;
    }

    i++;
  }


  return arrNew;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = pairProduct;
