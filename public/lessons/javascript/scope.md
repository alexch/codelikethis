    topic name: "scope"
    topic name: "global-variables"
    topic name: "local-variables"
    topic name: "parameters"
    topic name: "functions"
    topic name: "closure-scope"
    #todo: make a cleaner protocol than @description=
    @description = "When can you access a JavaScript variable? It depends on its scope. In this lesson we discuss the various scopes a variable can occupy, including global vs local, functional vs lexical, private vs public."
    link href: "https://toddmotto.com/everything-you-wanted-to-know-about-javascript-scope/"
    link href: "https://scotch.io/tutorials/understanding-scope-in-javascript"

# Scope

*scope* = all the variables and functions that are *visible* from a given location in your code

The two primary forms of scope are *Global* and *Local*

**Globally scoped** variables can be seen from *anywhere* in the program

**Locally scoped** variables can be seen only *nearby* where they are defined -- usually inside the same *function* or *code block*

# Global Scope

If you declare a variable without a keyword (`var`, `let`, `const`) then it is a **global variable** and can be seen and used by *any line of code in your entire program*

Global variables are very useful but also very dangerous. A mistake in *any part* of your program using a global variable could introduce a bug in *any other part* of your program using that global variable.

(ES5 introduced [strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode) which can reduce this risk -- though not eliminate it entirely)

# Implicit vs. Explicit globals

Globals are usually bad, but they are good for when you want to call a particular function from *literally anywhere* in your code... for instance, when you want to tell your analytics server that something interesting just happened.

If you really want to use a global variable, you should do so explicitly, so other readers of your code will know that you did it intentionally.

JavaScript programs have a *global object* whose properties are available as global variables. In web browsers, the global object is named `window`; in NodeJS, the global object is named `global`.

```javascript
// implicitly global
sendAnalytics = function(message) { ... }

// explicitly global (Browser)
window.sendAnalytics = function(message) { ... }

// explicitly global (NodeJS)
global.sendAnalytics = function(message) { ... }
```

Either of the above lines (in an HTML JS app) will allow any line in the entire rest of your program to call `sendAnalytics('user clicked "unsubscribe" button')`

# Scope is a One-Way Mirror

> scope is a one-way mirror -- inner scopes can see out, but outer scopes cannot see in

![one way mirror functions](../../images/one-way-mirror.gif)

Mr. Bean -- in the interrogation room scope -- can't see the cops in the observation room scope.

# Block Scope

`let` and `const` are *block*-scoped: any block of code surrounded by `{` curly braces `}` can have its own set of local `let` variables

```javascript
let name = 'Mr. Bean';
{
    let name ='Detective Bob';
    {
        console.log(name);
    }
    console.log(name);
}
console.log(name);
```

If a variable name can't be found in the *current* scope, then JavaScript looks in the *next outer scope*, and so on

# Exercise: Guess the Variable

* Which fruit would be logged below?

```javascript
let fruit = 'Apple';
{
    let fruit ='Blueberry';
    {
        let name = 'Cantaloupe';
    }
    console.log(name); // What is this fruit?
}
```

# Top Level Functions are Global

A function defined with the term `function` at the left margin is [hoisted](https://developer.mozilla.org/en-US/docs/Glossary/Hoisting), meaning it

* is placed into the correct scope *before* any other code is executed
* can be called "before" it is defined (above in the source file)

```javascript
let name = 'Alice';     // this name is global

let alpha = function() {
  console.log(name);    // alpha can see global var
  beta();               // alpha can see global function named beta
}

// alpha() uses let so must be called after it is defined
alpha();

function beta() {     // beta is hoisted!
  let name = 'Bob';     // this name is local to beta
  console.log(name);    // prints "Bob"
}

console.log(name);      // prints "Alice"
```

# Parameters are local to their function

```javascript
let opinion = 'i love cheese';
console.log(rant(opinion));

function rant(message) {
    let loudMessage = message.toUpperCase() + '!!';
    return loudMessage;
}
```

the above `rant` function has *two* locally scoped variables:

* the local variable `loudMessage`
* the parameter `message`

# Exercise: Guess the Variable with Functions

```javascript
let poet = 'Robert Frost';

function famousPoem(poet) {

  let poemAuthors = {
   'Robert Frost': 'Stopping by Woods on a Snowy Evening',
   'Walt Whitman': 'Leaves of Grass',
   'undefined': 'The Lanyard' // Billy Collins
  };
  return poemAuthors[poet];
}

famousPoem('Walt Whitman'); // Which Poem?
famousPoem(poet);           // Which Poem?

poet = 'Maya Angelou';
famousPoem();               // Which Poem?

```

# Scope Error

* when you try to use a variable that is out of scope, you will get an error

```javascript
function gamma() {
    let x = "declared inside gamma";
    console.log("Inside gamma: x is " + x);
}

console.log(x);  // ReferenceError: x is not defined
```

# Closure Scope

JavaScript also supports *lexical scope* (aka "closure scope" or "nested scope") which means that variables defined *above* the current function may also be visible...

```javascript
function sing() {               // outer function
  let numberOfBottles = 99

  function bottlesOfBeer() {    // inner function
      let message = '' + numberOfBottles
        + ' bottles of beer on the wall';
      return message;
  }

  while (numberOfBottles > 0) {
      console.log(bottlesOfBeer())
      numberOfBottles -= 1
  }

}
```

`bottlesOfBeer` is **enclosed** within `sing`, so it *inherits* `sing`'s scope

`numberOfBottles` is visible inside **both** `sing()` **and** `bottlesOfBeer()`

# Nested Scopes

Every time you call a function, JS creates a *new scope*

that scope *points to* the current scope

and so on recursively

(and -- strangely enough -- variables that are defined inside a nested function are *still alive* after that function returns (?!?!?!) -- more on this at the very end of this lesson)

# Why Nested Scopes? 1

* so callbacks can access local variables just like their neighboring code can

```javascript
function countLetters(words) {
    let letterCount = 0;
    words.forEach(function(word) {
        letterCount += word.length;
    });
    return letterCount;
}
```

`total` is visible inside the *inner* (callback) function as well as the outer (`countLetters`), so `forEach` can behave like other loops

### This doesn't work:

```javascript
function addLetterCount(word) {
    letterCount += word.length;
}

function countLetters(words) {
    let letterCount = 0;
    words.forEach(addLetterCount);
    return letterCount;
}
```
...because `addLetterCount` is *not* nested inside `countLetters`

# Why Nested Scopes? 2

* nested functions, e.g. the following function accepts a *two-dimensional array* and prints each row

```js
function printGrid(grid, delimiter) {

    function printRow(row) {
        console.log(row.join(delimiter));
    }

    let i = 0;
    while (i < grid.length) {
        printRow(grid[i]);
        i = i + 1;
    }
}
```

this is a contrived example, but the idea is that

* you don't have to pass `delimiter` in to `printRow`, making your code a bit cleaner
* you can *descriptively name* chunks of code as inner functions without "polluting the global namespace"

# Why Nested Scopes? 3

* private state encapsulation with [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE)'s (this is **very tricky**; for more detail, see the [encapsulation](encapsulation) lesson)

```js
let count = (function() {
    let value = 0;  // private variable
    let increment = function() {
        value = value + 1;
        return value;
    };
    return increment;
})();

count() // returns 1
count() // returns 2
count() // returns 3

value   // ReferenceError: value is not defined
```

* we now have a *function* that contains its own persistent state
  * sometimes called a *generator* or an *iterator*
  * **this is weird** since a normal function always returns the same value given the same input
* the private variable `value` is *still alive* after the IIFE returns 😲
