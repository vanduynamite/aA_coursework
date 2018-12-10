/*******************************************************************************
Write a function highestScore(students) that takes in an array of student objects
as a parameter. It should return a string that corresponds to the student with
the highest score. The string should contain that student's initials
concatenated with their id. Assume the array contains at least 1 student object and
the student with the highest score is unique (there are no ties).
Example:

var students = [
 {name: 'Alvin Zablan', id: 128, score: -42},
 {name: 'Eliot Bradshaw', id: 32, score: 57},
 {name: 'Tommy Duek', id: 2, score: 99},
 {name: 'Fred Sladkey', id: 256, score: 94}
];

highestScore(students); //=> 'TD2'
*******************************************************************************/

function highestScore(students) {

  var highScore = null;
  var highStudent = '';
  var highID = 0;

  for (var i = 0; i < students.length; i++) {

    if (highScore === null || students[i].score > highScore) {
      highStudent = students[i].name;
      highScore = students[i].score;
      highID = students[i].id;
    }

  }

  var fullName = highStudent.split(' ');
  var initials = '';

  for (var i = 0; i < fullName.length; i++) {
    initials += fullName[i][0].toUpperCase();
  }

  return (initials + highID);

}
// Looks good! --DV
/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*************************/
module.exports = highestScore;
