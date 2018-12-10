/*******************************************************************************
Write a function disemvowel(string) that takes in a string and returns the
string with all vowels removed.

Examples:

disemvowel('bootcamp'); // => 'btcmp'
disemvowel('PREP'); // => 'PRP'
disemvowel('hello world'); // => 'hll wrld'
*******************************************************************************/

function disemvowel(string) {

  var vowels = 'aeiouAEIOU'.split('');
  var letters = string.split('');
  var newLetters = [];

  for (var i = 0; i < letters.length; i++) {

    if (!vowels.includes(letters[i])) {
      newLetters.push(letters[i]);
    }

  }

  return newLetters.join('');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = disemvowel;
