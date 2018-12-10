/***********************************************************************
Write a function alternateCase(str) that takes in a word and returns the
word where the characters alternate between uppercase and lowercase.

Examples:

alternateCase('BOOTCAMPPREP'); // => 'BoOtCaMpPrEp'
alternateCase('bOotCamPpREP'); // => 'BoOtCaMpPrEp'
alternateCase('hello'); // => 'HeLlO'
***********************************************************************/

function alternateCase(str) {

  for (var i = 0; i < str.length; i++) {

    if (i % 2 === 0) {
      str = str.slice(0,i).concat(str[i].toUpperCase()).concat(str.slice(i + 1));
    } else {
      str = str.slice(0,i).concat(str[i].toLowerCase()).concat(str.slice(i + 1));
    }

  }

  return str;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = alternateCase;
