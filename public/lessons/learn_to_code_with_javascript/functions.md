    topic name: "functions"
    topic name: "arguments"
    topic name: "parameters"
    topic name: "return-values"

# Functions

* just like a VARIABLE is a name for a chunk of data
* a FUNCTION is a name for a chunk of code
* if you have some code you want to run again and again
  * or just run once, but keep it organized

# Function example

Here's a not very useful function:

```js
function add(x, y) {
  return x + y;
}
```

* `function` means "define a function"
* `add` is the *name* of the function
* `x, y` are the *parameters* of the function
* `return x + y` is the *body* of the function
  * also the *return value* because of the magic word *return*

# Call Me, Maybe

You call a function by its name, plus parentheses:

```js
function add(x, y) {
  return x + y;
}

add(2, 3)   // returns 5
add(12, 30) // returns 42
```

# Lab: isDivisible

One number is *divisible* by another if you divide them and the *remainder* is 0.

Write a function called `isDivisibleBy` that takes two numbers, and returns `true` if the first number is divisible by the second number, and `false` otherwise.

    isDivisibleBy(100, 10)    //=> true
    isDivisibleBy(100, 7)     //=> false
    isDivisibleBy(3333, 11)   //=> true
    isDivisibleBy(99, 12)     //=> false
    
# Rant!!!

Here is a function that takes an "opinion" as input, and as output returns a VERY FORCEFUL statement of that opinion.

    function rant(opinion) {
      return opinion.toUpperCase().replace(/ /g, "") + "!!!"
    }

    console.log(rant("i like pizza"));

`/ /g` is a *regular expression*; for now just think of it like a weird string. It defines the substring to replace, and the `g` at the end stands for "global" and means "replace them all, not just the first one".

# Lab: Capitalize

Try to write a function that *capitalizes* a word.

For instance, 

`capitalize('tomato')` returns `'Tomato'`

(A solution is on the next slide, but try to solve it on your own. Remember that there are many [string operations](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#Methods_2) available to you...)

# Capitalize

    function capitalize(s) {
      return s[0].toUpperCase() + s.slice(1).toLowerCase()
    }

    console.log(capitalize("smith"));
    console.log(capitalize("MACGUYVER"));

# Function names can be variable names

The following two are roughly equivalent:

```js
function add(x,y) { return x + y; }

var add = function(x,y) { return x + y; };
```

# LAB: more about functions

* [FreeCodeCamp](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures)
    - start with the challenge [Write Reusable JavaScript with Functions](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/write-reusable-javascript-with-functions)
    - continue through the challenge [Assignment with a Returned Value](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/assignment-with-a-returned-value)

* Read [Eloquent JavaScript chapter 3](http://eloquentjavascript.net/03_functions.html)
