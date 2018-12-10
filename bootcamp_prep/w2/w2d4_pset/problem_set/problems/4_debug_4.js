// Debug this function below so it passes mocha

// Examples:
//
// isMagicNumer(26) //=> true;
// isMagicNumer(50) //=> false;

function magicify(number) {
  // console.log(number - 34);

  return number - 34;
}

function isMagicNumer(number) {
  var magicNumb = magicify(number);

  if (magicNumb % 13 === 0 || magicNumb < 0) {
    return true;
  }

  return false;
}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = isMagicNumer;
