    topic name: "scope"
    topic name: "global-variables"
    topic name: "local-variables"
    topic name: "parameters"
    topic name: "functions"
    topic name: "closure-scope"

# Scope

![scope](scope.jpg)

*scope* = all the variables that are *visible* from a given location in your code

including:

  * local variables (`let` and `var`)
  * function parameters
  * global variables
  * top-level functions

# Scope is a One-Way Mirror

> scope is a one-way mirror -- inner scopes can see out, but outer scopes cannot see in

![one way mirror functions](one-way-mirror.gif)

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

# Scope Error

```javascript
function gamma() {
    var x = "declared inside gamma";  // x can only be used in gamma
    console.log("Inside gamma");
    console.log(x);
}

console.log(x);  // Causes error
```

# Closure Scope

JavaScript also supports *lexical scope* which means that variables defined *above* the current function may also be visible...

```javascript
function sing() {
  let numberOfBottles = 99;

  function bottlesOfBeer() {       // << nested inside sing()
    return '' + numberOfBottles 
      + ' bottles of beer on the wall';
  }
  ...

```

# Lexical Scope

Closures *add a layer* between global and local:

  * local variables and parameters of *nesting closures* of the current function

This is called "lexical scope" because a line of code can "see" all variables that are declared (= written = _lexical_) in the same code block, even if that code block is inside a different (nesting) function.

# Nested Scopes

Every time you invoke a function, JS creates a new *scope* for that function

that points to the *current* scope

and so on recursively

[todo: nested scope diagram]

# Why? 1

* so callbacks can access local variables just like their neighboring code can

# Why? 2

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

# Why? 3

* higher-order functions (functions that use other functions, like `map` or `forEach`)

# Why? 4

* encapsulation (this is tricky; for more detail, see the [encapsulation](/lessons/javascript/encapsulation) lesson)

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
```
