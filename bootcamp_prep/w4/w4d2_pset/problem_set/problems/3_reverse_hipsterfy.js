/***********************************************************************
Write a function `reverseHipsterfy(sentence)` that takes in a sentence
and removes all vowels, except the last vowels of every word.

Examples:

reverseHipsterfy("proper"); // => 'prper'
reverseHipsterfy("proper tonic panther"); // => 'prper tnic pnther'
reverseHipsterfy("bootcamp prep"); // => 'btcamp prep'
reverseHipsterfy("towel flicker banana"); // => 'twel flcker bnna'
reverseHipsterfy("runner anaconda"); // => 'rnner ncnda'
reverseHipsterfy("turtle cheeseburger fries"); // => 'trtle chsbrger fres'
***********************************************************************/

function reverseHipsterfy(sentence) {

  var words = sentence.split(' ');
  var newSentence = [];

  for (var i = 0; i < words.length; i++) {
    newSentence.push(hipsterfyWord(words[i]));
  }

  return newSentence.join(' ');

}

function hipsterfyWord(word) {

  var firstFound = false;
  var vowels = 'aeiou';
  var newWord = [];

  for (var i = word.length - 1; i >= 0; i--) {

    if (vowels.includes(word[i])) {

      if (!firstFound) {
        firstFound = true;
        newWord.push(word[i]);
      }

    } else {

      newWord.push(word[i]);

    }

  }

  newWord.reverse();

  return newWord.join('');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = reverseHipsterfy;
