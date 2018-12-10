/*******************************************************************************
Write a function isPalindrome(sentence) that returns true if the characters of the
sentence string form a palindrome, false otherwise. A palindrome is a word or
phrase that is that is the same forwards and backwards.

Examples:

isPalindrome('rats live on no evil star'); // => true
isPalindrome('stella won no wallets'); // => true
isPalindrome('racecar'); // => true
isPalindrome('hello world'); // => false
*******************************************************************************/

function isPalindrome(sentence) {

  var letters = sentence.split(' ').join('');

  // letters / 2 is fine
  // for odd number of letters, the middle letter is not touched, and
  // also doesn't matter
  for (var i = 0; i < letters.length / 2; i++) {

    if (letters[i] !== letters[letters.length - 1 - i]) {
      return false;
    }

  }

  return true;

}
// Looks good! --DV
/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = isPalindrome;
