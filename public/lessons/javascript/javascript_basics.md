# JavaScript Basics

"In JavaScript, there is a beautiful, elegant, highly expressive language that is buried under a steaming pile of good intentions and blunders."
 - Douglas Crockford, JavaScript: The Good Parts

# Types

(todo: overview of basic types in JS)

# Objects

* JS Object = Hash = Map = Dictionary
* Keys are converted into strings

# Properties

* Properties are values stored on an object
* Accessed two ways:
  1. dot `user.name`
  2. bracket `user['name']`

# Arrays

## Looping over the elements of an array

The normal way:

    for (var i = 0; i<a.length; ++i) { ... }

In old implementations, the above suffers from a performance problem, so you may see the following recommended instead:

    for (var i = 0, n = a.length; i<n; ++i) { ... }

# Equality

* `==` performs **type coercion**
* this leads to some improbable results

    @@@ javascript
    2 == [2] // true

evaluates as

    @@@ javascript
    2 === Number([2].valueOf().toString())

see http://stackoverflow.com/questions/1724255/why-does-2-2-in-javascript

# More equality madness

    @@@ javascript
    ""           ==   "0"           // false
    0            ==   ""            // true
    0            ==   "0"           // true
    false        ==   "false"       // false
    false        ==   "0"           // true
    false        ==   undefined     // false
    false        ==   null          // false
    null         ==   undefined     // true
    " \t\r\n"    ==   0             // true

(from <http://bonsaiden.github.com/JavaScript-Garden/#types.equality>)

## Moral: always use === (triple equal)

# Canvas

* http://dev.w3.org/html5/2dcontext/
* https://developer.mozilla.org/en/canvas_tutorial
* http://www.selfhtml5.org/wp-content/uploads/2010/07/HTML5_Canvas_Cheat_Sheet.png

# Resources

## General JavaScript Resources

* [Mozilla JavaScript Guide](http://developer.mozilla.org/en/JavaScript/Guide)
* <http://jibbering.com/faq/>
* <http://jibbering.com/faq/notes/>
* <http://www.crockford.com/javascript/survey.html>
* [JavaScript Garden](http://bonsaiden.github.com/JavaScript-Garden/) - "a growing collection of documentation about the most quirky parts of the JavaScript programming language. It gives advice to avoid common mistakes, subtle bugs, as well as performance issues and bad practices that non-expert JavaScript programmers may encounter on their endeavours into the depths of the language."


# The Fine Print

> This work is copyright (C) 2010-2012 by Alex Chaffee. All rights reserved. Permission is granted to use this material for non-profit educational purposes, including self-education and open workshops. Use by educational institutions or for-profit classes must be licensed. For permission, please contact Alex Chaffee at alex@stinky.com.
