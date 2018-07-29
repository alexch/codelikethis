
# Why can't I use my server-side JavaScript files in my client-side HTML pages?

* on a nodejs server, you include JS files using `const Room = require('room.js')` in a JS file, but on the client you include JS files using `<script src='room.js'>` in an HTML file

# Okay, but what if I really want to reuse my code?

* you need to put the `room.js` file somewhere that both the server and the client can see it, which is weird cause usually those two directories are separate (`lib` and `public` respectively)
* also inside room.js you say `module.exports = class Room { ...` which means that *even if* you download `room.js` onto the client, it will break because *there is no global named `module`* in browserland
* so you’d need to add `<script>module = {}</script>` in your HTML, *above* the `<script src='room.js'>`
* you’d also need to make sure that none of your code calls anything in the NodeJS core or in any NPM package

# That sounds complicated. Is it bad?

it’s not a *bad* idea to reuse code between layers, it’s just non-traditional so some things don’t work right

there are also tools like *browserify* that make it easier

http://browserify.org/

but by “easier” i mean “replace one form of complexity with a different form of complexity”
