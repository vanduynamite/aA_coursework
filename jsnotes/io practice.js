

// readTextFile('file:///C:/Users/paul/repos/project euler/p67 triangle.txt');

try2('file:///C:/Users/paul/repos/project euler/p67 triangle.txt');

function readTextFile(file)
{
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
                var allText = rawFile.responseText;
                alert(allText);
            }
        }
    }
    rawFile.send(null);
}

function try2(file) {
  var txtFile = file;
  var file = new File(txtFile);

  file.open("r"); // open file with read access
  var str = "";
  while (!file.eof) {
  	// read each line of text
  	str += file.readln() + "\n";
  }
}
