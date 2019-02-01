    topic name: "functions"
    topic name: "arguments"
    topic name: "parameters"
    topic name: "return-values"
    link href: "https://eloquentjavascript.net/03_functions.html",
         name: "Eloquent JavaScript: Functions"
    link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions",
         name: "Mozilla Developer Network: Functions"
    link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures",
         name: "Mozilla Developer Network: Closures and Scope"
    link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions",
         name: "Mozilla Developer Network: Arrow Functions"

# Functions

* a **variable** is a name for a chunk of data
* a **function** is a name for a chunk of code

## Why would you want to name a chunk of code?

Perhaps...

* you have some code you want to run again and again
* you want to do the same operation on different values
* you want to keep your code organized

# Function example

Here's a not very useful function:

```js
function add(x, y) {
  let sum = x + y;
  return sum;
}
```

* `function` means "define a function"
* `add` is the *name* of the function
* `x, y` are the *parameters* of the function (also called *arguments*)
* `sum` is a *local variable* of the function
* `sum` is also the function's *return value* because of the magic word *return*

# Call Me, Maybe

You call a function by its name, plus parentheses:

```js
function add(x, y) {
  let sum = x + y;
  return sum;
}

add(2, 3)   // returns 5
add(12, 30) // returns 42
```

# Lab: One Nation, Divisible

One number is *divisible* by another if you divide them and the *remainder* is 0.

Write a function called `divisible` that takes two numbers, and returns `true` if the first number is divisible by the second number, and `false` otherwise.

    divisible(100, 10)    //=> true
    divisible(100, 7)     //=> false
    divisible(3333, 11)   //=> true
    divisible(99, 12)     //=> false

# Rant!!!

Here is a function that takes an "opinion" as input, and as output returns a VERY FORCEFUL statement of that opinion.

    function rant(opinion) {
      let strongOpinion = opinion.toUpperCase();
      return strongOpinion + '!!!';
    }

    rant('i like pizza');  #=> 'I LIKE PIZZA!!!'

The variable `strongOpinion` is called a *local variable* and can only be used *inside* the function.

# Lab: Capitalize

Please write a function that *capitalizes* a word.

For instance,

`capitalize('tomato')` returns `'Tomato'`

A solution is on the next slide, but try to solve it on your own.
Remember that there are many [string operations](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#Methods_2) available to you...

# Capitalize

    function capitalize(word) {
      let firstLetter = word[0];
      let restOfWord = word.slice(1);
      return firstLetter.toUpperCase() + restOfWord.toLowerCase();
    }

    console.log(capitalize('smith'));
    console.log(capitalize('MACGUYVER'));

The variables `firstLetter` and `restOfWord` are called *local variables* and can only be used *inside* the `capitalize` function.

# Passing Variables to Functions

When you pass a *variable* to a function, that variable's *value* is assigned to a *parameter*.

> The variable and parameter names **do not** need to match!

```js
function rant(opinion) {
  let strongOpinion = opinion.toUpperCase();
  return strongOpinion + '!!!';
}

let feeling = "I feel great";
let strongFeeling = rant(feeling);
```

| Outside the function | Inside the function | Value |
|---|---|---|
| `feeling`       | `opinion`       | `"I feel great"`    |
|                 | `strongOpinion` | `"I FEEL GREAT"`    |
| `strongFeeling` |                 | `"I FEEL GREAT!!!"` |

# Four Function Syntaxes

> **WARNING**: JavaScript has many ways to define a function.

This is the standard, original, retro function syntax:

```js
function add(x,y) { return x + y; }
```

The following are all roughly equivalent to the above:

```js
let add = function(x,y) { return x + y; };
```

```js
let add = (x,y) => { return x + y; };
```

```js
let add = (x,y) => x + y;
```

* Note that these new forms are *anonymous*:
    * there is **no name** between `function` and `(x,y)`
    * the name of the function **is** the name of the variable that points to it

# LAB: more about functions

* [FreeCodeCamp](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures)
    - start with the challenge [Write Reusable JavaScript with Functions](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/write-reusable-javascript-with-functions)
    - continue through the challenge [Assignment with a Returned Value](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/assignment-with-a-returned-value)

* Read [Eloquent JavaScript chapter 3](http://eloquentjavascript.net/03_functions.html)
