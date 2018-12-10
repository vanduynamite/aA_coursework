// // let dim = let
//
// let a = 3;
// let n = 'World'.toUpperCase();
//
// a++;
// a+=1;
// a*=2;
// a%=3;
//
// console.log(a);
//
// console.log(`Hello ${n}!`);
//
// console.log(n.length);
//
//
// let bracketsMissing = true;
//
// if (bracketsMissing == true) {
// 	console.log('Then the code won\'t run!');
// }
//
// console.log(0 == false);
// console.log('' == false);
// console.log(!'' == false); //use the ! as an inline NOT
//
// for (i = 0; i < n.length; i++) {
// 	console.log('For ' + n[i]);
// }
//
// i = 0;
//
// // while (i < n.length) {
// // 	console.log('While ' + n[i]);
// // 	i++;
// // }
// //
// // i = 0
// //
// // do {
// // 		console.log('Do while ' + n[i]);
// // 		console.log(i);
// // 		i++;
// // } while (i < n.length)
//
//
// let sentence = 'The quick brown fox jumped over the lazy dog.';
//
// console.log(sentence.indexOf('quick'));
// console.log(sentence.indexOf('t'));
// console.log(sentence.indexOf('T'));
//
//


let a = 1;

//console.log a++ will return a before it is incremented
console.log(a);
console.log(a++);
console.log(a);

// ++a happens first though
console.log(a);
console.log(++a);
console.log(a);

//console.log a+=1 will return the incremented value
console.log(a+=1);
console.log(a);

a = 5;
b = 6;
result = 0;

addNums(result, a, b);

console.log(result);

results = [0,0,0,0,0];

mathOperations(results, a, b);

console.log(results[0]);

// result is a by value, not by reference
function addNums(result, a, b) {

	result = a + b;

}

// results is by reference. Arrays must be objects then...
function mathOperations(results, a, b) {

	results[0] = a + b;
	results[1] = a - b;
	results[2] = a * b;
	results[3] = a / b;
	results[4] = a % b;

}

function forLoops() {

	//continue breaks one loop
	for (i = 1; i <= 10; i++) {

		if (i === 5) {
			continue;
		}

		console.log(i);
	}

	//break breaks the entire loop
	for (i = 1; i <= 10; i++) {

		if (i === 5) {
			break;
		}

		console.log(i);
	}

	//return inside will break the loop...and return something!
	for (i = 1; i <= 10; i++) {

		if (i === 5) {
			return i;
		}

		console.log(i);
	}

}


	var array = [];

	array.push('thing');
	console.log(array.length);
	console.log(array);

	curLength = array.push('another');

	var a = ['a', 'b', 'c', 'd'];

	// gets the stuff in between, but not the end index
	a.slice(1,3); // [b, c]

	// chops off the last one
	a.slice(0,-1); // [a, b, c]

	a.join(' '); // will concatenate each element of array with a space between

	var str = "Hey there what's going on?";
	str.split(' '); // will create an array of the string, split on every space
