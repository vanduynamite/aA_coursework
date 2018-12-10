// Write a function `logEach(array)` that prints every element of the array and its
// index to the console.
//
// Example:
//
// logEach(["Anthony", "John", "Carson"]); // prints
// 0: Anthony
// 1: John
// 2: Carson

logEach(["Anthony", "John", "Carson"]);

function logEach(array) {

  for (var i = 0; i < array.length; i++) {
    console.log(i + ': ' + array[i]);
  }
}

// Write a function range(start, end) that returns an array that contains all
// numbers between 'start' and 'end' in sequential order.
//
// Examples:
//
// range(1,4) => [1,2,3,4]
// range(4,2) => []

console.log(range(1,4));
console.log(range(4,2));

function range(start, end) {

  var array = [];

  for (var i = start; i <= end; i++) {
    array.push(i);
  }

  return array;

}

// Write a function sumArray(array) that takes in an array of numbers are returns the
// total sum of them.
//
//
// Examples:
//
// sumArray([5, 6, 4]); // => 15
// sumArray([7, 3, 9, 11]); // => 30

console.log(sumArray([5, 6, 4]));
console.log(sumArray([7, 3, 9, 11]));

function sumArray(array) {

  var sum = 0;

  for (var i = 0; i < array.length; i++) {
    sum += array[i];
  }

  return sum;
}


// Write a function `capWords(words)` that takes in an array of words and
// returns a new array where every word is capitalized.
//
// Example:
//
// capWords(['hello', 'boOtCaMp', 'PREP!']); // => ['HELLO', 'BOOTCAMP', 'PREP!']

console.log(capWords(['hello', 'boOtCaMp', 'PREP!']));

function capWords(words) {

  for (var i = 0; i < words.length; i++) {
    words[i] = words[i].toUpperCase();
  }

  return words;
}

// Write a function `wordPeriods(sentence)` that takes in a sentence and returns a new
// sentence where every word has period after it.
//
// Examples:
//
// wordPeriods('hello world'); // => 'hello. world.'
// wordPeriods('what is the weather today'); // => 'what. is. the. weather. today.'

console.log(wordPeriods('hello world'));
console.log(wordPeriods('what is the weather today'));

function wordPeriods(sentence) {

  var words = sentence.split(' ');
  var newSentence = '';

  for (var i = 0; i < words.length; i++) {
    newSentence += words[i] + '. ';
  }

  return newSentence;

  // return sentence.split(' ').join('. ') + '.';

}


// Write a function `maxValue(array)` that returns the largest value in `array`.
// Assume `array` is an array of numbers.
//
// Examples:
//
// maxValue([12, 6, 43, 2]); // => 43
// maxValue([]); // => null
// maxValue([-4, -10, 0.43]); // => 0.43

console.log(maxValue([12, 6, 43, 2]));
console.log(maxValue([]));
console.log(maxValue([-4, -10, 0.43]));

function maxValue(array) {

  var curMax = null;

  for (var i = 0; i < array.length; i++) {

    if (array[i] > curMax) {
      curMax = array[i];
    }
  }

  return curMax;

}
