/***********************************************************************
Write a function stopWatch(totalSeconds) that takes in a number of
seconds. The function should return the time string based on that number
of seconds. The time should be formatted in hours (H), minutes (M), and
seconds(S) in the form HH:MM:SS.

Hint: the seconds and minutes count of the time should never
be greater than 59. How can we use modulo % to accomplish this?

Examples:

stopWatch(0); // => '00:00:00'
stopWatch(4); // => '00:00:04'
stopWatch(128); // => '00:02:08'
stopWatch(1234); // => '00:20:34'
stopWatch(3612); // => '01:00:12'
stopWatch(7640); // => '02:07:20'
stopWatch(86400); // => '24:00:00'
stopWatch(86522); // => '24:02:02'
stopWatch(99999); // => '27:46:39'
***********************************************************************/

function stopWatch(totalSeconds) {

  var sec = (totalSeconds % 60);

  var totalMin = (totalSeconds - sec) / 60;
  var min = (totalMin % 60);

  var hr = ((totalMin - min) / 60);

  sec = sec + '';
  min = min + '';
  hr = hr + '';

  if (sec.length === 1) sec = '0' + sec;
  if (min.length === 1) min = '0' + min;
  if (hr.length === 1) hr = '0' + hr;

  return hr + ':' + min + ':' + sec;

}

/**************DO NOT MODIFY ANYTHING UNDER THIS  LINE*****************/
module.exports = stopWatch;
