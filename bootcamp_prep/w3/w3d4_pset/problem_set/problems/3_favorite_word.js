/***********************************************************************
Write a function favoriteWord(favoriteLetter, sentence) that takes in a
single letter and a sentence string. The function should return the word
in the sentence that contains `favoriteLetter` the most. If there are
ties, return the word that appears first in the sentence.

Examples

favoriteWord('p', 'sinful caesar sipped his snifter') // => 'sipped'
favoriteWord('a', 'sinful caesar sipped his snifter') //=> 'caesar'
favoriteWord('s', 'sinful caesar sipped his snifter') //=> 'sinful'
favoriteWord('x', 'sinful caesar sipped his snifter') //=> ''
***********************************************************************/

function favoriteWord(favoriteLetter, sentence) {

  var words = sentence.split(' ');
  var highCount = 0;
  var favWord = '';

  for (var i = 0; i < words.length; i++) {

    var curCount = countLetters(favoriteLetter, words[i]);

    if (curCount > highCount) {
      highCount = curCount;
      favWord = words[i];
    }

  }

  return favWord;

}

function countLetters(letter, word) {

  var letters = word.split('');
  var cnt = 0;

  for (var i = 0; i < letters.length; i++) {
    if (letters[i] === letter) cnt++;
  }

  return cnt;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = favoriteWord;
