# RPN Calculator

"RPN" stands for "Reverse Polish Notation". (See [the wikipedia entry](http://en.wikipedia.org/wiki/Reverse_Polish_notation) for more information on this colorful term.) Briefly, in an RPN world, instead of using normal "infix" notation, e.g.

    2 + 2
    
you use "postfix" notation, e.g.

    2 2 +

While this may seem bizarre, there are some advantages to doing things this way. For one, you never need to use parentheses, since there is never any ambiguity as to what order to perform operations in. The rule is, you always go from the back, or the left side.

    1 + 2 * 3 =>
    (1 + 2) * 3 or
    1 + (2 * 3)

    1 2 + 3 * => (1 + 2) * 3
    1 2 3 * + => 1 + (2 * 3)

Another advantage is that you can represent any mathematical formula using a simple and elegant data structure, called a [stack](http://en.wikipedia.org/wiki/Stack_(data_structure)).

# Template

Clone this GitHub repo: https://github.com/BurlingtonCodeAcademy/rpn_calculator

(If we are using GitHub Classroom, you will get your own personal repo to clone instead.)

Install the test runner (and any other required packages) with `npm install`

Start with this definition in `calculator.js`:

```
@@@js
class Calculator {
  constructor() {
    this.stack = [];
  }

  value() {
  }
		
  enter(value) {
  }

  plus() {
  }
}
module.exports = Calculator;
```

# Backlog

<!--box-->

## Red - Green - Refactor

Run the tests (aka "Jasmine spec") in `calculator.spec.js` like this:

    npm test

Keep writing code until each and every spec is passing. 

Add your own specs to this file...

  * if you want more clarity on existing features
  * when you add new features
  * to find and fix bugs

Remember to clean up your code between each test.

<!--/box-->

<!--box-->

## REPL

Write a *read-eval-print-loop* that accepts input from the command line and feeds the input into your calculator, like this:

```
$ node calc.js
[]
2               <<< user input
[2]
4               <<< user input
[2, 4]
+               <<< user input
[6]
3               <<< user input
[6, 3]
11              <<< user input
[6, 3, 11]
-               <<< user input
[6, -8]
+               <<< user input
[-2]
ERROR
```

**Important note:** `calc.js` must be a *separate file* from `calculator.js`, to allow the tests to run independently (without also launching the app). You can *import* your Calculator class into this new file like this:

    let Calculator = require('./calculator.js');

> **Hint:** you can use `(+value)` to turn a string into a number.

<!--/box-->


<!--box-->

## Pow!

Write *tests and code* for a "power of" operator: `^`

<!--/box-->

<!--box-->

## CLI

If command-line parameters are provided, use them instead of the REPL.

Example:

```
$ node calculator.js 2 2 +
[2, 2, '+']
[4]
4
```  

> **Hint:** you may have to alter the `value` method to do more than merely report what's on the top of the stack. 

> **Warning:** the *bash* shell will interpret `*` as a "file glob", not as a literal asterisk. To pass an asterisk, prefix it with a backslash, like this:

    node calc.js 5 5 \* 
    
> or put it in single quotes, like this:

    node calc.js 5 5 '*' 
  
> In Windows (cmd.exe or PowerShell) you may need to use double quotes instead, like this:

    node calc.js 5 5 "*"

<!--/box-->
