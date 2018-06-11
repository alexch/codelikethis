# Closures

A closure is

* a function, with all its parameters and local variables

PLUS

* access to all the parameters and local variables of its *ancestor functions*

[todo: diagram]

# Scope

![scope](scope.jpg)

*scope* = all the variables that are *visible* from a given location in your code

including:

  * local variables (`let` and `var`)
  * function parameters

a closure is a *scope* that includes another scope

# Example

```js
@@@js
var x = 10;
function f(y) {
    return x + y;
}
console.log(f(5));  // 15
```

# Nested Scopes

Every time you invoke a function, JS creates a new *scope* for that function

that points to the *current* scope

and so on recursively

[todo: nested scope example]


# Why? 1

* so callbacks can access local variables just like their neighboring code can

# Why? 2

* nested functions, e.g.

        @@@js
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

# Why? 3

* higher-order functions (functions that use other functions, like `map` or `forEach`)

# Why? 4

* encapsulation (this is tricky; see advanced OO in JS lesson)

        @@@js
        var o = (function() {
            var x = 0;  // private variable

            return {
                inc: function() {
                    x = x + 1;
                    console.log(t);
                },
                printIt: function() {
                    console.log(x);
                }
            };
        })();

        o.printIt()   // 0
        o.inc()       
        o.printIt()   // 1

