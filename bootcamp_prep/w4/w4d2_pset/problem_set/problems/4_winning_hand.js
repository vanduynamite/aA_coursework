/***********************************************************************
Write a function winningHand(hand1, hand2) that takes in two strings
representing a hand of 4 cards. Return the string of the hand with the
higher total score. If there is a tie, return 'DRAW'. Possible cards are
J, Q, K.

J = 1 point
Q = 2 points
K = 3 points

Examples:

winningHand('JQKJ', 'QQJJ'); // => 'JQKJ'
winningHand('KJKJ', 'QQQK'); // => 'QQQK'
winningHand('JKJJ', 'QQJJ'); // => 'DRAW'
winningHand('KJKJ', 'QQQQ'); // => 'DRAW'
***********************************************************************/

function winningHand(hand1, hand2) {

  // console.log(hand1);

  var score1 = scoreHand(hand1);
  var score2 = scoreHand(hand2);

  // console.log(score1);

  if (score1 > score2) {
    return hand1;
  } else if (score2 > score1) {
    return hand2;
  }

  return 'DRAW';

}

function scoreHand(hand) {

  var score = 0;
  var scores = {'J':1, 'Q':2, 'K':3};

  for (var i = 0; i < hand.length; i++) {
    // console.log(hand[i]);
    score += scores[hand[i]];
  }

  return score;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = winningHand;
