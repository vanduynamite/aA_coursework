/*******************************************************************************
Write a function `arrayBuilder(count)` that takes in a count object and returns
an array filled with the appropriate numbers of elements. The order of
the elements in the array does not matter, but repeated elements should be
grouped.

Examples:

arrayBuilder({'cats': 2, 'dogs': 1}); //=> ['cats', 'cats', 'dogs']
arrayBuilder({}); //=> []
*******************************************************************************/

function arrayBuilder(count) {

  var arr = [];

  for (var i in count) {

    for (var j = 0; j < count[i]; j++) {

      arr.push(i);

    }

  }

  return arr;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = arrayBuilder;
