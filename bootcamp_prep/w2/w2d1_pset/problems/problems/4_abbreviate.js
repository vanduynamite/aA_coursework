/***********************************************************************
Write a function `abbreviate(sentence)` that takes in a sentence string
and returns a new sentence where words longer than 4 characters have
their vowels removed. Assume the sentence has all lowercase characters.
Feel free to use the array below in your solution:

var vowels = ['a', 'e', 'i', 'o', 'u'];

Examples:

abbreviate('bootcamp prep is fun'); // => 'btcmp prep is fun'
abbreviate('programming is fantastic'); // => 'prgrmmng is fntstc'
abbreviate('hello world'); // => 'hll wrld'
abbreviate('how are you'); // => 'how are you'
***********************************************************************/

// console.log(abbreviate('bootcamp prep is fun'));

function abbreviate(sentence) {

  var words = sentence.split(' ');
  var vowels = ['a','e','i','o','u'];

  for (var i = 0; i < words.length; i++) {

    if (words[i].length > 4) {

      word = words[i];
      newWord = '';

      for (var j = 0; j < word.length; j++) {

        letter = word[j];

        if (!vowels.includes(letter)) {
          newWord += letter;
        }

      }

      words[i] = newWord;

    }
  }

  return words.join(' ');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = abbreviate;
