/***********************************************************************
Write a function `longWordCount(string)` that takes in a string and
returns the number of words longer than 7 characters.

Examples:

longWordCount(""); // => 0
longWordCount("short words only"); // => 0
longWordCount("one reallylong word"); // => 1
longWordCount("two reallylong words inthisstring"); // => 2
longWordCount("allwordword longwordword wordswordword"); // => 3
longWordCount("seventy schfifty five"); // => 1
***********************************************************************/

function longWordCount(sentence) {

  var words = sentence.split(' ');
  var count = 0;

  for (var i = 0; i < words.length; i++) {

    if (words[i].length > 7) {
      count++;
    }

  }

  return count;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = longWordCount;
