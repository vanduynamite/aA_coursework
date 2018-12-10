/***********************************************************************
Write a function `uncompressString(str)` that takes in a "compressed"
string and returns the "uncompressed" version of the string. In the
input `str`, every letter is followed by a single digit number that
specifies how many times that character is repeated.

HINT: Use the built-in `Number` function to turn the string
representation of a number into a number
Number('42'); // => 42;

Examples:

uncompressString('a2b4c1'); // => 'aabbbbc'
uncompressString('b1o2t1'); // => 'boot'
uncompressString('x3y1x2z4'); // => 'xxxyxxzzzz'
***********************************************************************/

function uncompressString(str) {

  var newStr = '';
  var letter = '';
  var num = 0;

  // b1o2t1
  for (var i = 0; i < str.length; i += 2) {
    letter = str[i];
    num = str[i+1];
    //b, o, t
    //1, 2, 1

    for (var j = 0; j < num; j++) {
      //0
      //0, 1
      //0
      newStr += letter;
      //b
      //bo, boo
      //boot
    }

  }

  return newStr;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = uncompressString;
