/***********************************************************************
Write a function `countRepeats(string)` that takes in a string and
returns the number of letters that appear more than once in the string.
You may assume the string contains only lowercase letters. Count the
number of letters that repeat, not the number of times they repeat in
the string.

Examples:

countRepeats('alvin'); //=> 0
countRepeats('aaaalvin'); //=> 1
countRepeats('pops'); //=> 1
countRepeats('mississippi'); //=> 3
countRepeats('hellobootcampprep'); //=> 4
***********************************************************************/

function countRepeats(string) {

  var arr = string.split('');
  var cnt = 0;
  var repeated = 0;

  while (arr.length > 0) {

    cnt = 0;
    letter = arr[0];

    while (arr.includes(letter)) {
      arr.splice(arr.indexOf(letter),1);
      cnt ++;
    }

    if (cnt > 1) {
      repeated++;
    }

  }

  return repeated;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = countRepeats;
