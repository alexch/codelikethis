
# Client Side JS vs. Server Side JS

Client side JavaScript operates in your browser's environment, while server side JavaScript operates in a Node environment. As we discovered when working with front end (a.k.a. client side) JavaScript there are some differences in what options you have available to you, and the syntax you use.

* In Node you can import files by using `require` or `import`. In the browser you import files by having a `<script>` tag with a `src` attribute equal to the file's name

* In a node environment we have access to npm modules, which we can include by doing an `npm install <module name>` through the terminal. We cannot use node modules in client side JavaScript

This means that you will generally want to write seperate JavaScript files for server side, and client side applications.

# But what if I really want to use my code in both places?

* you need to put the `room.js` file somewhere that both the server and the client can see it
  * This is weird because usually those two directories are separate (`lib` and `public` respectively)
* also inside room.js you say `module.exports = class Room { ...`
  * This means that *even if* you download `room.js` onto the client, it will break because *there is no global named `module`* in your browser
* so you’d need to add `<script>module = {}</script>` in your HTML, *above* the `<script src='room.js'>`
  * you’ll also need to make sure that none of your code calls anything in the NodeJS core or in any NPM package

# That sounds complicated. Is it bad?

it’s not necessarily a *bad* idea to reuse code between layers, it’s just non-traditional so some things don’t work like you expect them to.

There are also tools like *browserify* that make it "easier"

http://browserify.org/

# Is there a special syntax for server side JS?

The short answer is "no." We started by writing JavaScript in a Node environment. We ran our command line applications in a NodeJS environment, and NodeJS operates the same way on a server as it does on your local machine.

However there are libraries that make writing the server itself a bit easier since setting up a server can get a little complicated useing just standard JavaScript. The library we will be using is called ["express"](https://expressjs.com/)
