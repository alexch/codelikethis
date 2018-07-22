# Scope

![scope](scope.jpg)

*scope* = all the variables that are *visible* from a given location in your code

including:

  * local variables (`let` and `var`)
  * function parameters
  * global variables
  * top-level functions

> scope is a one-way mirror -- inner scopes can see out, but outer scopes cannot see in

# Closure Scope

JavaScript also supports *lexical scope* which means that variables defined *above* the current function may also be visible...

```
function sing() {
  let numberOfBottles = 99;
  function bottlesOfBeer() {
    return "" + numberOfBottles + ' bottles of beer on the wall';
  }
  ...
  
```

(more about this later, in the [closures](/javascript/closures) lesson)

