/*******************************************************************************
Write a function longestWord(sentence) that returns the longest word of a sentence.
If there are ties, the function should return the later word.

Examples:

longestWord('app academy is cool'); // => 'academy'
longestWord('hate having hungry hippos'); // => 'hippos'
longestWord('bootcamp'); // => 'bootcamp'
longestWord(''); // => ''
*******************************************************************************/

function longestWord(sentence) {

  var curLength = 0;
  var curLongWord = '';
  var words = sentence.split(' ');

  for (var i = 0; i < words.length; i++) {

    if (words[i].length >= curLength) {

      curLength = words[i].length;
      curLongWord = words[i];

    }

  }

  return curLongWord;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = longestWord;
