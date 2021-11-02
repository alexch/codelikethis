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

There are several kinds of scope including:

**Global scope**: variables that can be seen from *anywhere* else in the program

**Local scope**: variables that can only be seen *near* where they are defined, such as inside a *function* or *code block*

**Private scope**: variables that cannot be seen beyond a specific part of your code

> JavaScript does not have *built in* support for marking a variable private, yet

# Global Scope

If you declare a variable without a keyword like `var`, `let`, or `const` then it is a **global variable** and can be seen and used by *any line of code in your entire program*

> Global variables can **sometimes** be useful, but are always **dangerous**. 

A mistake in *any part* of your program accessing a global variable can introduce a bug in *any other part* of your program referencing that same variable

# Scope is a One-Way Mirror

![An example of a one way mirror metaphor for scope](../../images/one-way-mirror.gif)

> Scope is a one-way mirror, inner scopes can see out, but outer scopes cannot see in. The interrogation room scope, cannot see the detectives in the observation room scope.

# Block Scope

`let` and `const` create a *block*-scoped variable. Any *blocks* of code surrounded by `{` curly braces `}` can have their own set of local `let` or `const` variables of the same name

```javascript
let name = 'Global';
{
  let name = 'Mr. Bean';
    {
      let name = 'Detective';
      console.log(name);
    }
    console.log(name);
}
console.log(name);
```

> If a variable name cannot be found in the *current* scope, then JavaScript looks in the *next outer scope*

# Exercise: Guess the Variable 1

* Which fruit would be logged below?

```javascript
let fruit = 'Apple';
{
  let fruit = 'Blueberry';
    {
      let fruit = 'Cantaloupe';
    }
  // What is the value of fruit?
  console.log(fruit);
}
```

# Exercise: Guess the Variable 2

* Which fruit would be logged below?

```javascript
let fruit = 'Apple';
{
  let fruit = 'Blueberry';
    {
      let fruit = 'Cantaloupe';
      // What is the value of fruit now?
      console.log(fruit);
    }
}
```

# Exercise: Guess the Variable 3

* Which fruit would be logged below?

```javascript
let fruit = 'Apple';
{
  let fruit = 'Blueberry';
    {
      let fruit = 'Cantaloupe';
    }
}
// What is the value of fruit now?
console.log(fruit);
```

# Functions names default to Global

> Unless a function definition is nested within another function, or a code block, it is global.

```javascript
// global "name" variable
let name = 'Alice';

function sayNames() {
  // can see variable "name"
  console.log('Printing first name: ' + name);
  saySecondName();
}

function saySecondName() {
  // this "name" is local to the function
  let name = 'Bob';
  console.log('Printing second name: ' + name);
}

sayNames();

// this will print the global "name"
console.log(name);
```

# Parameters are local to their function

```javascript
let myOpinion = 'i love cheese';

function shout(message) {
  let loudMessage = message.toUpperCase() + '!!!';
  return loudMessage;
}

console.log(shout(myOpinion));
```

`shout` function has *two* locally scoped variables:

* the local variable `loudMessage`
* the "parameter" named `message`, also called an "argument"

# Scope Error

> Trying to use a variable that is out of scope will result in an error

```javascript
function doSomething() {
  let privateVariable = 'you cannot see me';
  console.log('Inside myPrivateVariable is ' + privateVariable);
}

// ReferenceError: privateVariable is not defined
console.log(privateVariable);
```

# Closure Scope

JavaScript also supports *closure scope*

Meaning, variables that are visible where a function is defined are also visible to the new function's body

```javascript
// Outer function definition
function singSong() {
  let numberOfBottles = 99

  // Inner function definition
  function chorus() {
    let message = '' + numberOfBottles
      + ' bottles of beer on the wall, '
      + numberOfBottles + ' bottles of beer, '
      + 'take one down, pass it around, '
      + (numberOfBottles - 1) + ' bottles of beer on the wall.'
    return message;
  }

  while (numberOfBottles > 0) {
    console.log(chorus())
    numberOfBottles -= 1
  }
}
```

`chorus` is **enclosed** within `singSong`, so it *inherits* `singSong`'s scope and `numberOfBottles` is visible to **both** `singSong` **and** `chorus`

# Nested Scopes

For each `function someName() {}` that is defined:

1. JavaScript creates a *new scope* for the function
2. The new scope *points to* the current outer scope
3. This can repeat, again, and again

# Why Nested Scopes? 1

```javascript
let phrase = 'all dogs are good dogs';

function countLetters(words) {
  let allWords = words.split(' ');
  let letterCount = 0;
  let currentIndex = 0;

  function wordCount() {
    while (currentIndex < allWords.length) {
      let currentWord = allWords[currentIndex]
      let wordLength = currentWord.length
      letterCount += wordLength;

      currentIndex = currentIndex + 1;
    }
  }

  wordCount()

  return letterCount;
}

countLetters(phrase)
```

The `letterCount`, `currentIndex`, and `allWords` are visible inside the *inner* function as well as the outer function

# Why Nested Scopes? 2

```javascript
function wordCount() {
  while (currentIndex < allWords.length) {
    let currentWord = allWords[currentIndex]
    let wordLength = currentWord.length
    letterCount += wordLength;

    currentIndex = currentIndex + 1;
  }
}

function countLetters(words) {
  let allWords = words.split(' ');
  let letterCount = 0;
  let currentIndex = 0;

  wordCount()

  return letterCount;
}
```

> NOTE: This fails because `wordCount` is *not* nested inside `countLetters`, and so **cannot** see the variables within the function's scope
