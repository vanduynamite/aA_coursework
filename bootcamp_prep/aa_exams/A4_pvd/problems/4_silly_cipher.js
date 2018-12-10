/*******************************************************************************
Write a function sillyCipher(sentence, cipher) that takes in an string (sentence)
and an object (cipher). Return a string where every character is replaced with its
corresponding value in the cipher. If the character doesn't exist in the
cipher, use a dot (.)

Examples:

sillyCipher("apple" , { a : "c", p : "x", l : "r", e : "o"}) //=> 'cxxro'
sillyCipher("apple", { a : "c", p : "x"}) //=> 'cxx..'
sillyCipher("bootcamp prep?", { o : "e", p : "q" , "?" : "!"}) //=> '.ee....q.q..q!'
sillyCipher("twmce", { m : "n", t : "d", w : "a"}) //=> 'dan..''
*******************************************************************************/

function sillyCipher(sentence, cipher){

  var letters = sentence.split('');

  for (var i = 0; i < letters.length; i++) {

    if (cipher[letters[i]] !== undefined) {
      letters[i] = cipher[letters[i]];
    } else {
      letters[i] = '.';
    }

  }

  return letters.join('');
}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = sillyCipher;
