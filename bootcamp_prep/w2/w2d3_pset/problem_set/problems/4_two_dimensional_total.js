/***********************************************************************
Write a function `twoDimensionalTotal(array)` that takes in a 2D array
of numbers and returns the total sum of all elements.

var arr1 = [
  [5, 2, 5, 3],
  [12, 13],
];

twoDimensionalTotal(arr1); // => 40

var arr2 = [
  [2],
  [1, 9],
  [1, 1, 1]
]

twoDimensionalTotal(arr2); // => 15
***********************************************************************/

function twoDimensionalTotal(array) {

  var sum = 0;
  var subArr = [];

  for (var i = 0; i < array.length; i++) {

    subArr = array[i];

    for (var j = 0; j < subArr.length; j++) {

      sum += subArr[j];

    }

  }

  return sum;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = twoDimensionalTotal;
