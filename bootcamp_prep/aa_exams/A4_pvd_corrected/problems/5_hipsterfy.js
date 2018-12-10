/*******************************************************************************
Write a function `hipsterfy(sentence)` that takes takes a string containing
several words as input. Remove the last vowel from each word. 'y' is not a vowel.

Examples:

hipsterfy("proper"); // => "propr"
hipsterfy("proper tonic panther"); // => "propr tonc panthr"
hipsterfy("towel flicker banana"); // => "towl flickr banan"
hipsterfy("runner anaconda"); // => "runnr anacond"
hipsterfy("turtle cheeseburger fries"); // => "turtl cheeseburgr fris"
*******************************************************************************/

function hipsterfy(sentence) {

  var vowels = ['a','e','i','o','u'];
  var words = sentence.split(' ');
  var word = [];
  var lastVowel = 0;

  for (var i = 0; i < words.length; i++) {

    word = words[i].split('');
    lastVowel = -1;

    for (var j = 0; j < word.length; j++) {

      if (vowels.indexOf(word[j]) !== -1) {
        lastVowel = j;
      }

    }

    if (lastVowel !== -1) {

      word.splice(lastVowel, 1);

    }

    words[i] = word.join('');

  }

  return words.join(' ');
}
// Code works perfectly --DV
/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = hipsterfy;
