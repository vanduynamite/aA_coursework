//repl stands for Read, Evaluate, Print, Loop

pSet1();
pSet2();
pSet3();

function pSet1() {
  let i = 1;
  let numCorrect = [0,0];

  console.log('');
  console.log(i++);
  actual = 4 + 4 / 2;
  guess = 6;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = (2 + -7) * 3;
  guess = -15;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 101 % 10;
  guess = 1;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 12 - 4 % 3;
  guess = 11;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = true && false;
  guess = false;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = true && !(false || false);
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = !true && !(false || false);
  guess = false;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'cat' + 'dog';
  guess = 'catdog';
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 2 + 'pizza';
  guess = '2pizza';
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 2.5 * 'fish';
  guess = NaN;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 5 >= 11;
  guess = false;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 5 === 5.0;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 7 !== 7.1;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 5 + 5 > 8;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 6 + 6 !== 12;
  guess = false;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 2 > 1 || false;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'true' === true;
  guess = false;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 10 % 2 === 0;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 21 % 2 === 0;
  guess = false;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 21 % 2 !== 0;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 21 % 2 === 1;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 12 % 3 === 0;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 9 % 3 === 0;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 14 % 3 === 0;
  guess = false;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'new york'[0];
  guess = 'n';
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'new york'[1];
  guess = 'e';
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'san francisco'[2 * 3];
  guess = 'a';
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'bootcamp'[3].toUpperCase();
  guess = 'T';
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'bootcamp'.indexOf('T');
  guess = -1;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'bootcamp'.indexOf('camp');
  guess = 4;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'bootcamp'.indexOf('o') > -1;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  console.log('');
  console.log(i++);
  actual = 'science'.indexOf('x') === -1;
  guess = true;
  logAnswer(numCorrect, actual, guess);

  gradeAnswers(numCorrect);
}



function pSet2() {
  let i = 1;
  let numCorrect = [0,0];

  // 1
  var idx = 'abcde'.indexOf('D');
  idx = idx + 11;
  // console.log(idx); // ?
  logAnswer(numCorrect, idx, 10);
  idx * 2;
  // console.log(idx); // tricksie!
  logAnswer(numCorrect, idx, 10);

  // 2
  var num = 33;
  var isEven = num % 2 === 0;
  // console.log(isEven); // ?
  logAnswer(numCorrect, isEven, false);
  // console.log(!isEven); // ?
  logAnswer(numCorrect, !isEven, true);

  // 3
  var str1 = 'marker';
  var num = 'whiteboard'.length - str1.length;
  // console.log(num); // ?
  logAnswer(numCorrect, num, 4);
  var str2 = 'bootcamp';
  // console.log(str2[num].toUpperCase()); // ?
  logAnswer(numCorrect, str2[num].toUpperCase(), 'C');
  var char = str2[num].toLowerCase(); // ?
  // console.log(char + '!'); // ?
  logAnswer(numCorrect, char + '!', 'c!');

  // 4
  var sentence = 'welcome to bootcamp prep';
  var lastChar = sentence[sentence.length - 1];
  // console.log(lastChar); // ?
  logAnswer(numCorrect, lastChar, 'p');
  // console.log(sentence.indexOf(lastChar)); // ?
  logAnswer(numCorrect, sentence.indexOf(lastChar), 18);

  gradeAnswers(numCorrect);
}


function pSet3() {
  let numCorrect = [0,0];

  // 5
  var age = 30; // try different numbers here

  if (age > 30) {
    console.log('older than 30');
    logAnswer(numCorrect, '', 'x');
  } else {
    console.log('younger than 30');
    logAnswer(numCorrect, '', '');
  }



  // 6
  var str = 'pizza'; // try different strings here

  if (str.length > 10) {
    console.log('long string');
    logAnswer(numCorrect, '', 'x');
  } else {
    console.log('short string');
    logAnswer(numCorrect, '', '');
  }

  if (str[0] === 'p') {
    console.log('starts with p');
    logAnswer(numCorrect, '', '');
  }
  // 7
  var num = 15; // try different numbers here

  if (num % 3 === 0) {
    console.log('divisible by 3');
    logAnswer(numCorrect, '', '');

  } else if (num % 5 === 0) {
    console.log('divisible by 5');
    logAnswer(numCorrect, '', 'x');

  }


  // 8
  var num = 15; // try different numbers here

  if (num % 3 === 0) {
    console.log('divisible by 3');
    logAnswer(numCorrect, '', '');
  }
  if (num % 5 === 0) {
    console.log('divisible by 5');
    logAnswer(numCorrect, '', '');
  }
  // 9
  var str = 'App AcademY'; // try different strings here

  if (str[0] === str[0].toUpperCase()) {
    console.log('starts with a capital!');
    logAnswer(numCorrect, '', '');
  }
  if (str[str.length - 1] === str[str.length - 1].toUpperCase()) {
    console.log('ends with a capital!');
    logAnswer(numCorrect, '', '');
  }
  // 10
  var num = -44; // try different numbers here

  if (num > 0) {
    console.log('positive');
    logAnswer(numCorrect, '', 'x');
  } else if (num < 0) {
    console.log('negative');
    logAnswer(numCorrect, '', '');
  } else {
    console.log(0);
  }
  if (num % 2 === 0) {
    console.log('even');
    logAnswer(numCorrect, '', '');
  } else {
    console.log('odd');
    logAnswer(numCorrect, '', 'x');
  }

  gradeAnswers(numCorrect);
}


function logAnswer(correct, actual, guess) {

  if (guess != '') {
    console.log('My guess: ' + guess);
  }

  if (actual != '') {
    console.log('Actual: ' + actual);
  }

  if (actual == guess) {
    correct[0]++;
  } else {
    console.log('****************WRONGWRONGWRONGWRONG!');
    correct[1]++;
  }
}

function gradeAnswers(correct) {
  console.log('You got ' + correct[0] + ' correct and ' + correct[1] + ' incorrect.');
}
