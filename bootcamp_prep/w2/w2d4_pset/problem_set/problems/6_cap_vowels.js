/***********************************************************************
Write a function called capVowels(string) that takes in a string and
returns the string where every vowel is capitalized. All other letters
should be lowercased.

Hint: Don't forget that strings are immutable!

Examples:

capVowels('hello world'); // => 'hEllO wOrld'
capVowels('HELLO WORLD'); // => 'hEllO wOrld'
capVowels('boOtCamP PreP'); // => 'bOOtcAmp prEp'
***********************************************************************/

function capVowels(string) {

  var array = string.toLowerCase().split('');
  var vowels = ['a','e','i','o','u'];

  for (var i = 0; i < array.length; i++) {
    var ele = array[i];

    if (vowels.indexOf(ele) !== -1) {
      array[i] = ele.toUpperCase();
    }

  }

  return array.join('');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = capVowels;
