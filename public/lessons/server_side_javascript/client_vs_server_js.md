
# How can I use JavaScript files in client-side HTML pages?

In a NodeJS environment (server side), you include JS files using `const Room = require('room.js')` in a different JS file.

On the client you include JS files using `<script src='room.js'>` in an HTML file

# But what if I really want to use my code in both places?

* you need to put the `room.js` file somewhere that both the server and the client can see it
  * This is weird because usually those two directories are separate (`lib` and `public` respectively)
* also inside room.js you say `module.exports = class Room { ...`
  * This means that *even if* you download `room.js` onto the client, it will break because *there is no global named `module`* in your browser
* so you’d need to add `<script>module = {}</script>` in your HTML, *above* the `<script src='room.js'>`
  * you’ll also need to make sure that none of your code calls anything in the NodeJS core or in any NPM package

# That sounds complicated. Is it bad?

it’s not a *bad* idea to reuse code between layers, it’s just non-traditional so some things don’t work like you expect them to.

There are also tools like *browserify* that make it "easier"

http://browserify.org/

but by “easier” I mean “replace one form of complexity with a different form of complexity”
