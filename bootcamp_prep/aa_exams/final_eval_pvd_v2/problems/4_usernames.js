/**************************************************************************************
Write a function `usernames(names)` that takes in an array of names. The function
should return an array containing the corresponding usernames. See the examples.

Examples:

var names = [
  'Oscar Alvarez',
  'Danny Catalano',
  'Kurstie Ozuna',
  'Matt Haws'
];

usernames(names); // => [ 'oalvarez', 'dcatalano', 'kozuna', 'mhaws' ]

Difficulty: Medium
*************************************************************************************/

function usernames(names) {

  var users = [];

  for (var i = 0; i < names.length; i++) {

    users.push(names[i].slice(0,1).toLowerCase()
      + names[i].slice(names[i].indexOf(' ') + 1).toLowerCase());

  }

  return users;

}

/******************** DO NOT MODIFY ANYTHING UNDER THIS LINE *************************/

module.exports = usernames;
