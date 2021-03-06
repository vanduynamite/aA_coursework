/***********************************************************************
Write a function nickname(name) that takes in a name string and returns
a string representing their nickname. A nickname is the name up to the
second vowel repeated twice. See the examples.

Examples:

nickname('manuel'); // => 'MANU-MANU'
nickname('pikachu'); // => 'PIKA-PIKA'
nickname('bootcamp'); // => 'BOO-BOO'
nickname('bob'); // => 'BOB-BOB'
***********************************************************************/

function nickname(name) {

  var vowels = 'aeiouAEIOU';
  var vowelCount = 0;
  var nick = '';

  for (var i = 0; i < name.length; i++) {

    nick += name[i].toUpperCase();

    if (vowels.includes(name[i])) vowelCount++;
    if (vowelCount === 2) break;

  }

  return nick + '-' + nick;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = nickname;
