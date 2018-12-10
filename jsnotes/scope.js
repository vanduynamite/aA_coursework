


var a = 'One';

function outer() {
   a = 'Two';
  console.log('2:', a);

  function inner() {
    console.log(a);
    var a = 'Three';
    console.log('3:', a);
  }

  inner();
  console.log('4:', a);

}

console.log('1:',a);
outer();
console.log('5:',a);
