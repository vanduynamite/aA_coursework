/***********************************************************************
Write a function `collapseString(str)` that takes in a string as an
argument. The function should return the string where 'streaks' of
consecutive characters are collapsed to a single character.

Examples:

collapseString('apple'); //=> 'aple'
collapseString('AAAaalviiiiin!!!'); //=> 'Aalvin!'
collapseString('hello   app academy'); //=> 'helo ap academy'
***********************************************************************/

function collapseString(str) {

  var letters = str.split('');
  var newLetters = [];

  var lastLetter = '';

  for (var i = 0; i < letters.length; i++) {

    thisLetter = letters[i];

    if (thisLetter !== lastLetter) {
      newLetters.push(thisLetter);
    }

    lastLetter = thisLetter;
  }

  return newLetters.join('');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = collapseString;
