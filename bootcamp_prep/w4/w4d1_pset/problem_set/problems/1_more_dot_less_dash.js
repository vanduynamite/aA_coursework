/***********************************************************************
Write a function `moreDotLessDash(str)` that takes in a string and
returns the true if the string contains more dots ('.') than dashes
('-'), false otherwise.

Examples:

moreDotLessDash('2-D arrays are fun. I think.'); // => true
moreDotLessDash('.-.-.'); // => true
moreDotLessDash('.-'); // => false
moreDotLessDash('..--'); // => false
***********************************************************************/

function moreDotLessDash(str) {

  var numDash = 0;
  var numDot = 0;

  for (var i = 0; i < str.length; i++) {
    
    switch (str[i]) {
      case ".":
        numDot++;
        break;

      case "-":
        numDash++;
        break;

      default:
        break;
    }

  }

  return (numDot > numDash);

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = moreDotLessDash;
