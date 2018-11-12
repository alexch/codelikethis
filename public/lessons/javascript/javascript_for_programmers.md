# JavaScript Basics

"In JavaScript, there is a beautiful, elegant, highly expressive language that is buried under a steaming pile of good intentions and blunders." - Douglas Crockford, *JavaScript: The Good Parts*

# Types

JavaScript has seven data types; six are called *primitives*:

* `Boolean`
* `Null`
* `Undefined`
* `Number`
* `String`
* `Symbol` (new in ECMAScript 6)

Object (sometimes called "hash") comprises all other types, including

* `RegExp`
* `Function`
* `Date`
* `Map`
* etc.

[MDN: JS Data Structures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)

# Objects

* JS Object acts as a Hash (aka Map or Dictionary)
* Keys are converted into strings
* Values can be any type

# Properties

* Properties are values stored on an object
* Accessed two ways:
  1. dot `user.name`
  2. bracket `user['name']`

# Arrays

## Looping over the elements of an array

The normal way:

```js
for (var i = 0; i<a.length; ++i) { ... }
```

In old JavaScript implementations, the above suffers from a performance problem, so you may see the following recommended instead:

```js
    for (var i = 0, n = a.length; i<n; ++i) { ... }
```

# Equality

* `==` performs **type coercion**
* this leads to some improbable results

```js
2 == [2] // true
```

The above evaluates as if it were expanded thus:

```js
2 === Number([2].valueOf().toString())
```

see also [Why does 2 == [2] in JavaScript?
](http://stackoverflow.com/questions/1724255/why-does-2-2-in-javascript)

# More equality madness

```js
""           ==   "0"           // false
0            ==   ""            // true
0            ==   "0"           // true
false        ==   "false"       // false
false        ==   "0"           // true
false        ==   undefined     // false
false        ==   null          // false
null         ==   undefined     // true
" \t\r\n"    ==   0             // true
```

(from <http://bonsaiden.github.com/JavaScript-Garden/#types.equality>)

## Moral: always use === (triple equal)

# Resources

## General JavaScript Resources

* [Mozilla JavaScript Guide](http://developer.mozilla.org/en/JavaScript/Guide)
* <http://jibbering.com/faq/>
* <http://jibbering.com/faq/notes/>
* <http://www.crockford.com/javascript/survey.html>
* [JavaScript Garden](http://bonsaiden.github.com/JavaScript-Garden/) - "a growing collection of documentation about the most quirky parts of the JavaScript programming language. It gives advice to avoid common mistakes, subtle bugs, as well as performance issues and bad practices that non-expert JavaScript programmers may encounter on their endeavours into the depths of the language."


