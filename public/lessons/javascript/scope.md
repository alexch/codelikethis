    topic name: "scope"
    topic name: "variables"
    topic name: "functions"
    topic name: "closures"
    link href: "https://developer.mozilla.org/en-US/docs/Glossary/Scope"
    link href: "https://javascript.info/closure"
    link href: "https://www.digitalocean.com/community/tutorials/understanding-scope-in-javascript"

# Scope

The **SCOPE** is a context, including all the variables **accessible** from a given code location

There are different kinds of **SCOPE**:

* **Global**: can be accessed from **anywhere**
* **Local**: can be accessed **within** where it is defined
  * Includes **functions**, **loops**, or  **code blocks**
* **Private**: cannot be accessed beyond a specific place

# Global Scope

A variable without `var`, `let`, or `const` becomes a **global variable** and can be accessed **anywhere**.

```js
nameToSay = 'Grace'; // global variable

function sayName(someName) {
  let greeting; // local variable
  greeting = 'Hello, ' + someName + '!';
  return greeting;
}
sayName(nameToSay);
```

> Global variables are **dangerous**, minimize their use.

# Scope is One-way

![An example of a one way mirror metaphor for scope](../../images/one-way-mirror.gif)

> Scope is like a one-way mirror, inner scopes can see out, but outer scopes cannot see in.

# One-way Scope Example

Loops, Conditionals, and Functions use **code-blocks** which have their own **SCOPE**

* Variables defined with `let` or `cont` **CANNOT** be accessed outside a code-block.
* Code within a code-block **CAN** use variables from outside.

```js
nameToSay = 'Grace'; // global variable

function sayMaxTimes(maximum) { // code block 1
  let count = 1;
  while (count <= maximum) { // code block 2
    let greeting;
    greeting = 'Count:' + count + ' Hello, ' + nameToSay + '!';  
    console.log(greeting);
    count = count + 1;
  }
}
sayMaxTimes(5);
```

# Exercise: Guess the Name

* `let` and `const` create variables within a **SCOPE**
* Code **blocks** code are surrounded by curly braces, e.g. `{...}`
* Code **blocks** act as a **local** scope

```js
let name = 'Outside observer';
{
  let name = 'Mr. Bean';
  {
    let name = 'Detective';
    console.log(name); // what value is name?
  }
  console.log(name); // what value is name?
}
console.log(name); // what value is name?
```

> If a variable name cannot be found in the *current* scope, then JavaScript looks in the *next outer scope*

# Exercise: Guess the Fruit

* Which fruit would be logged below?

```js
let fruit = 'Apple';
{
  let fruit = 'Blueberry';
  {
    let fruit = 'Cantaloupe';
    console.log(fruit); // what value is fruit?
  }
  console.log(fruit); // what value is fruit?
}
console.log(fruit); // what value is fruit?
```

# Exercise: Guess the Value

* Which name would be logged below?
* Which fruit would be logged below?
* Which animal would be logged below?

```js
let name = 'Ada Lovelace';
{
  let fruit = 'Apple';
  {
    let animal = 'Horse';
    let name = 'Mr. Bean';
    console.log(fruit); // what is the value?
  }
  console.log(animal); // what is the value?
}
console.log(name); // what is the value?
```

# Function Names Global

> Unless nested within another function, or code-block, functions are global

```js
// global 'name'
let name = 'Alice';

function sayNames() {
  // can see global variable 'name'
  console.log('Printing first name: ' + name);
  saySecondName();
}

function saySecondName() {
  // function local variable 'name'
  let name = 'Bob';
  console.log('Printing second name: ' + name);
}

sayNames();
// 'Printing first name: Alice'
// 'Printing second name: Bob'
```

# Function Parameters Local

The `shout` function has two **local** scope variables

* Both variables `message` and `loudMessage`

```js
let myOpinion = 'i love cheese';

function shout(message) {
  let loudMessage = message.toUpperCase() + '!!!';
  return loudMessage;
}

console.log(shout(myOpinion));
// 'I LOVE CHEESE!!!'
```

# Scope Access Errors

Trying to use a variable that is not in scope will result in a `ReferenceError`

```js
function doSomething() {
  let localVariable = 'accessible within the function';
  console.log('Inside: myPrivateVariable is ' + localVariable);
}

doSomething();
// 'Inside: myPrivateVariable is accessible within the function'
console.log(localVariable);
// ReferenceError: localVariable is not defined
```

# Nested Function Scopes

For each definition of `function someName() {...}`:

1. JavaScript creates a new **scope** for the function
2. The new scope references the outer scope
3. This nesting can repeat indefinitely

# Why Nested Scopes?

`letterCount`, `currentIndex`, and `allWords` are visible inside the **inner** function as well as the **outer** function

```js
let phrase = 'all dogs are good dogs'; // global

function countLetters(words) { // outer scope
  let allWords = words.split(' ');
  let letterCount = 0;
  let currentIndex = 0;

  function wordCount() { // inner scope
    while (currentIndex < allWords.length) {
      let currentWord = allWords[currentIndex]
      let wordLength = currentWord.length
      letterCount += wordLength;
      currentIndex = currentIndex + 1;
    }
  }
  wordCount() // function updates letterCount
  return letterCount; 
}
countLetters(phrase) // calls outer function
```
