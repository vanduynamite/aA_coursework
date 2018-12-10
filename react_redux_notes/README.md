# react-redux

## react

### React Setup Filestructure
webpack.config.js
* This is mostly copypasta from somewhere else
* Make sure to change your entry file to the appropriate file
  * Sometimes `./frontend/component.jsx`
  * Sometimes `./frontend/index.jsx` - I kind of prefer this one, and it's default I think
* And your oupt file:
  * `output: { filename: 'bundle.js' }`

package.json
* Mostly documentation, but does contain all the packages needed to run this app
  * If all packages are defined, bash `npm install` in the root directory to get it up and running
  * If not, bash `npm install <packagename1> <packagename2> etc` and they will automatically be added to package.json
* Make sure you have a `scripts: { "start" : "webpack --mode=development --watch" }` script set up
  * This allows webpack to re-bundle your files every time something is saved
  * You can change `"start"` to whatever you want, but using `"start"` lets the bash command be `npm start`
* Also specify `"main": "./frontend/todo_redux.jsx"`, which is not necessary to make the app run, but is good documentation
  
index.html
* The base level html document. It should have a few things in it:
  * `<script ... src="./wherever_it_is/bundle.js` in the head section, which will point it to the bundled stuff
  * `<main id="root"></main>` in the main body, which will allow react to do its magic
  * Other links to css files, fonts, apis that you will be using
