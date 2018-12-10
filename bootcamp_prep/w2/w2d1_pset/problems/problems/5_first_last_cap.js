/***********************************************************************
Write a function `firstLastCap(sentence)` that takes in a sentence and
returns a new sentence where the first and last letters of each word is
uppercase. All other characters should be lowercase.

Examples:

firstLastCap('hello BOOTCAMP PrEp'); // =>'HellO BootcamP PreP'
firstLastCap('what is on the radio'); // =>'WhaT IS ON ThE RadiO'
***********************************************************************/

function firstLastCap(sentence) {

  var words = sentence.toLowerCase().split(' ');

  for (var i = 0; i < words.length; i++) {

    var word = words[i];

    words[i] = word[0].toUpperCase() + word.slice(1,word.length - 1) + word[word.length - 1].toUpperCase();

  }

  return words.join(' ');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = firstLastCap;
