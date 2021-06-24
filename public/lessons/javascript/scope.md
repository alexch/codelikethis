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

A **SCOPE** is all the variables and functions that are *visible* from a given location in your code

The sever forms of scope are *Global*, *Local*, and *Private*

**Globally scoped** variables can be seen from *anywhere* in the program

**Locally scoped** variables can be seen only *nearby* where they are defined -- usually inside the same *function* or *code block*

**Private** variables can only be seen by a specific part of your code, JavaScript does not have *native* support for private variables. There are changes in the works.

# Global Scope

If you declare a variable without a keyword (`var`, `let`, `const`) then it is a **global variable** and can be seen and used by *any line of code in your entire program*

Global variables are very useful but also very dangerous. A mistake in *any part* of your program using a global variable could introduce a bug in *any other part* of your program using that global variable.

# Scope is a One-Way Mirror

> scope is a one-way mirror -- inner scopes can see out, but outer scopes cannot see in

![one way mirror functions](../../images/one-way-mirror.gif)

> Mr. Bean -- in the interrogation room scope -- can't see the cops in the observation room scope.

# Block Scope

`let` and `const` are *block*-scoped: any block of code surrounded by `{` curly braces `}` can have its own set of local `let` variables

```javascript
let name = 'Mr. Bean';
{
    let name ='Detective';
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

```javascript
let name = 'Alice';   // global

// alpha can see global name
// alpha can see global function named beta
let alpha = function() {
  console.log(name);  
  beta();
}

// alpha() uses let 
// must be called after defined
alpha();

function beta() {     // beta is hoisted!
  let name = 'Bob';   // this name is local to beta
  console.log(name);  // prints "Bob"
}

console.log(name);    // prints "Alice"
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

`rant` function has *two* locally scoped variables:

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
function sing() {             // outer function
  let numberOfBottles = 99

  function bottlesOfBeer() {  // inner function
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

* Nested 'callbacks' can access local variables just like their neighboring code can

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

# Why Nested Scopes? 2

### This will not work:

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
