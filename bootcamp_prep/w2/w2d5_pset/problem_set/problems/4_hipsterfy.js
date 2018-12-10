/***********************************************************************
Write a function `hipsterfy(sentence)` that takes takes a string
containing several words as input. Remove the last vowel from each word.
`'y'` is not a vowel.

Examples:

hipsterfy("proper"); // => "propr"
hipsterfy("proper tonic panther"); // => "propr tonc panthr"
hipsterfy("towel flicker banana"); // => "towl flickr banan"
hipsterfy("runner anaconda"); // => "runnr anacond"
hipsterfy("turtle cheeseburger fries"); // => "turtl cheeseburgr fris"
***********************************************************************/

function hipsterfy(sentence) {

  var words = sentence.split(' ');

  for (var i = 0; i < words.length; i++) {
    words[i] = hipsterfyWord(words[i]);
  }

  return words.join(' ');

}

function hipsterfyWord(word) {

  var letters = word.split('').reverse();
  var vowels = ['a','e','i','o','u'];

  for (var i = 0; i < letters.length; i++) {

    if (vowels.includes(letters[i])) {

      letters = letters.slice(0,i).concat(letters.slice(i + 1));

      return letters.reverse().join('');
    }

  }

  return letters.reverse().join('');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = hipsterfy;
