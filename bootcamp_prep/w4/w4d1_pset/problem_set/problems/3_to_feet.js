/***********************************************************************
Write a function `toFeet(distances)` that takes in an array of distance
strings. The given distances will either be in `feet` or `yards`. The
function should return a new array where all the distances are converted
to feet. There are 3 feet in 1 yard.

Examples:

var arr1 = ['10 feet', '3 yards', '5 yards', '3 feet'];
toFeet(arr1); // => [ '10 feet', '9 feet', '15 feet', '3 feet' ]

var arr2 = ['2 yards', '3 feet', '10 yards'];
toFeet(arr2); // => [ '6 feet', '3 feet', '30 feet' ]
***********************************************************************/

function toFeet(distances) {

  var arr = [];
  var dist = 0;
  var unit = '';

  for (var i = 0; i < distances.length; i++) {
    dist = distances[i].split(' ')[0];
    unit = distances[i].split(' ')[1];

    switch (unit) {
      case 'feet':
        arr.push(distances[i]);
        break;

      case 'yards':
        arr.push(String(dist * 3) + ' feet');
        break;

      default:
        break;
    }

  }

  return arr;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = toFeet;
