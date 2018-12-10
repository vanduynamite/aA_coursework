/***********************************************************************
Write a function `countOfLetter(string, char)` that takes in a string
and a character and returns the number of times that character appears
in the string

Examples:

countOfLetter('mississippi', 's'); // => 4
countOfLetter('MISSISSIPPI', 'p'); // => 2
countOfLetter('BOOTCAMP', 't'); // => 1
***********************************************************************/

function countOfLetter(string, char) {

  var cnt = 0;
  var str = string.toLowerCase()

  for (var i = 0; i < str.length; i++) {

    if (str[i] === char) {
      cnt++;
    }

  }

  return cnt;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = countOfLetter;
