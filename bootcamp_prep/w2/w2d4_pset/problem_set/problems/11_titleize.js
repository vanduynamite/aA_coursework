/***********************************************************************
Write a function `titleize(title, stopWords)` that takes in a string
`title` and an array of strings `stopWords`. Return the `title` where
every word that does not exist in the `stopWords` array is capitalized;
all others lowercase.

Hints: Decompose this problem into helper functions. Perhaps create these,
- removePunctuation(word)
- isStopWord(word, stopWords)

- Test after you write every function of this decomposition!
- First write a function removePunctuation(word) that takes in a single
word and returns that same word without any punctuation at the end. Feel
free to use the punctuation array we've given you below.
- Second, write a function isStopWord(word, stopWords) that takes in a
single word and returns true if it is a stop word. The check will vary
depending on if the word contains punctuation or not, so use your
removePunctuation function before checking.
- Use slice


var punctuation = [";", "!", ".", "?", ",", "-"];

Examples:

titleize("forest gump, the runner", ["the"])
=> "Forest Gump, the Runner"

titleize("MASTER AND COMMANDER", ["and"])
=> "Master and Commander"

titleize("i LOVE; lover of mine", ["love", "of"])
=> "I love; Lover of Mine"

titleize("shall we dance?", ["dance"])
=> "Shall We dance?"
***********************************************************************/

function titleize(title, stopWords) {

  var arr = title.toLowerCase().split(' ');
  var word = '';
  var badWord = '';
  var replace = true;
  var punc = [";", "!", ".", "?", ",", "-"];

  for (var i = 0; i < arr.length; i++) {

    word = arr[i];
    replace = true;

    for (var j = 0; j < stopWords.length; j++) {

      badWord = stopWords[j];

      if (word === badWord ||
         (word.slice(0,-1) === badWord && punc.indexOf(word.slice(-1)) !== -1)) {
           replace = false;
           break;
      }

    }

    if (replace) {
      word = word[0].toUpperCase() + word.slice(1);
    }

    arr[i] = word;

  }

  return arr.join(' ');

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = titleize;
