/*******************************************************************************
Write a function longestBigram(sentence) that takes in a sentence string and returns
the longest bigram in the sentence. A bigram is a pair of consecutive words.
When returning the bigram, include the space between the words.
Assume there will be no punctuation. In the case of a tie, return the earlier bigram.

Examples:

longestBigram('measure twice cut once'); // => 'measure twice'
longestBigram("One must have a mind of winter"); // => 'must have'
longestBigram("go home to eat"); // => 'go home'
longestBigram("his last assessment is fun"); // => 'last assessment'
*******************************************************************************/

function longestBigram(sentence) {

  var words = sentence.split(' ');
  var bigrams = [];
  var longestIndex = 0;
  var longestBigram = 0;

  for (var i = 0; i < words.length - 1; i++) {
    bigrams.push(words[i] + ' ' + words[i + 1]);

    if (bigrams[i].length > longestBigram) {
      longestIndex = i;
      longestBigram = bigrams[i].length;
    }

  }

  return bigrams[longestIndex];

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = longestBigram;
