/******************************************************************************
Write a function reverseString(string) that takes in a hyphenated string and
returns a the hyphenated string reversed.

Examples:

reverseString("Go-to-the-store") => "store-the-to-Go"
reverseString("Jump,-jump-for-joy") => "joy-for-jump-Jump,"
*******************************************************************************/

function reverseString(string) {

  var words = string.split('-');
  var backWords = [];

  for (var i = 0; i < words.length; i++) {
    backWords.push(words[words.length - i - 1]);
  }

  return backWords.join('-');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = reverseString;
