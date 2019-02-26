    topic name: "scope"
    topic name: "global-variables"
    topic name: "local-variables"
    topic name: "parameters"
    topic name: "functions"
    topic name: "closure-scope"

# Scope

*scope* = all the variables and functions that are *visible* from a given location in your code

The two primary forms of scope are *Global* and *Local* 

**Globally scoped** variables can be seen from *anywhere* in the program

**Locally scoped** variables can be seen only *nearby* where they are defined -- usually inside the same *function*

# Global Scope

If you declare a variable without a keyword (`var`, `let`, `const`) then it is a **global variable** and can be seen and used by *any line of code in your entire program*

Global variables are very useful but also very dangerous. A mistake in *any part* of your program using a global variable could introduce a bug in *any other part* of your program using that global variable.

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

![one way mirror functions](one-way-mirror.gif)

```javascript
let name = 'Alice';
{
    let name ='Bob';
    {
        let name = 'Charlie';
        console.log(name);
    }
    console.log(name);
}
console.log(name);
```

# Variable Visibility

<!--BOX-->
```
let name = 'Alice';         // this name is global
```

<!--BOX-->
```
    function beta() {
      let name = 'Bob';     // this name is local to beta
      console.log(name);    // prints "Bob"
    }
```
<!--/BOX-->

```
console.log(name);          // prints "Alice"
```

<!--BOX-->
```
    function alpha() {
      console.log(name);    // alpha can see global var
                            // prints "Alice"
      beta();               // alpha can see global function named beta
    }
```
<!--/BOX-->
```
alpha();
```
<!--/BOX-->

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

`numberOfBottles` is visible inside **both** `sing()` **and** `bottlesOfBeer()` -- so when either 

# Nested Scopes

Every time you invoke a function, JS creates a new *scope* for that function

that points to the *current* scope

and so on recursively

and -- strangely enough -- variables that are defined inside a nested function are *still alive* after that function returns (?!?!?!)

# Why Nested Scopes? 1

* so callbacks can access local variables just like their neighboring code can

```javascript
function countLetters(words) {
    let letterCount = 0;
    words.forEach(function(word) {
        letterCount += word.length;
    })
    return letterCount;
}
```

# Why Nested Scopes? 2

* nested functions, e.g.

```js
function printGrid(grid) {

    function printRow(rowNum) {
        console.log(grid[rowNum].join(","));
    }

    let i = 0;
    while (i<grid.length) {
        printRow(i);
        i = i + 1;
    }
}
```

# Why Nested Scopes? 3

* higher-order functions (functions that use other functions, like `map` or `forEach`)

```javascript
function countLetters(words) {
  let total = 0;
  words.forEach(function(word) {
    total += word.length;
  });
  return total;
}
```

`total` is visible inside the *inner* (callback) function as well as the outer (`countLetters`), so `forEach` can behave like other loops

# Why Nested Scopes? 4

* private state encapsulation with [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE)'s (this is tricky; for more detail, see the [encapsulation](/lessons/javascript/encapsulation) lesson)

```js
let count = (function() {
    let value = 0;  // private variable
    let increment = function() {
        value = value + 1;
        console.log(value);
        return value;
    };
    return increment;
})();

count() // prints and returns 1
count() // prints and returns 2
value   // ReferenceError: value is not defined
```

# Module Scope

* NodeJS introduced the concept of *module scope* to the JavaScript world.
* A variable defined at the "top" (left margin) of a file is visible to all other code in that file 
