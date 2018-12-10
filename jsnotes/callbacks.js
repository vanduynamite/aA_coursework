

function sayHello() {

  return 'hello';

}

// console.log(sayHello()); // hello
// console.log(sayHello); // [Function: sayHello]
// console.log(String(sayHello)); // the actual code of the function!
// console.log(String(sayHello())); // hello

var myFunc = sayHello;

// console.log(myFunc()); // hello
// console.log(myFunc); // [Function: sayHello]
// console.log(String(myFunc)); // the actual code of the function!
// console.log(String(myFunc())); // hello

function yell(data) {
  return data + '!';
}

function half(num) {
  return num/2;
}

function add(num1, num2, cb) { // use 'cb' to indicate a callback
  var sum = num1 + num2;
  var answer = cb(sum);
  console.log(answer);
}

add(4, 8, yell); // we will yell 12. 12!
add(4, 8, half); // 6

// add(4, 8, yell()); //this won't work because yell() RETURNS something
// so when we pass it to add, add is expecting a FUNCTION, no whatever the heck
// yell() returns.
