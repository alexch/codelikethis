# Debugging

Overview:

  * Read the error
      * including stack traces
  * Read the code
  * Add print statements (`console.log` in JavaScript)
  * Use a [rubber duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging) or a pair partner
  * Use an Interactive debuggers

# What is debugging?

Debugging is fixing code that you *thought* was working... but *isn't* working.

It's solving a puzzle that you created for yourself.

This can be frustrating! But it can also be rewarding and can lead to better understanding of your program and of the context in which it operates.

# Errors vs Failures

Roughly speaking, there are two scenarios for debugging:

1. **failures**: the program runs to completion, but gives an *incorrect* or *unexpected* result
2. **errors*: the program *exits* with an error message

# Debugging Failures

Debugging is an art, not a science. But its principles are scientific:

* Make a mental model of the system
* Think of hypotheses
* Make observations to confirm or reject those hypotheses
* Focus on anomalies
* Change one thing at a time and observe the results

# Debugging with Print Statements

The most fundamental way to debug is to *print* the values of variables at various points in your code.

```js
function factorial(x) {
    console.log("in factorial: x=" + x);
    if (x < 1) {
        console.log("x<1");
        return x;
    } else {
        console.log("multiplying " + x + " by factorial(" + (x-1) + ")")
        return x * factorial(x - 1);
    }
}
```

Keep adding print statements until you find an anomaly; repeat until you find the source.

> Don't forget to *remove* the tests after you've fixed the bug!

# Debugging with Print Statements

Output of the above:

```
> factorial(4)
in factorial: x=4
multiplying 4 by factorial(3)
in factorial: x=3
multiplying 3 by factorial(2)
in factorial: x=2
multiplying 2 by factorial(1)
in factorial: x=1
multiplying 1 by factorial(0)
in factorial: x=0
x<1
0
```

> Can you figure out the bug?

# Debugging with Unit Tests

When a user reports a bug -- or when a coder notices one -- the first thing to do is to write a test that exposes the bug, then run it and watch it fail.

This assures that you have *actually* identified the cause of the bug, and that once you think it's fixed, it's *actually* fixed.

# Rubber Duck Debugging

Often, simply explaining your code reveals its flaws.

This is one reason why *pair programming* is so effective.

If you don't have a pair, try explaining your problem out loud to a pet, or a doll.

![rubber duck](rubber-duck.jpg) 

# Read the Error

> Step 1: Read the error... **carefully**.

Mentally dissect the error report. Try to separate the *signal* from the *noise*.

Answer the following questions:

  * **Where** in your code is the error occurring?
  * **What** is the *name* of the error message?
  * **Why** is this error happening now?
    * What is the **context** of the error?
    * What is the code **expecting**, and what did it find instead?
  * If there are several error messages in a row, **which** is the root error?

(More detail on these questions in the following slides.)

*After* answering these questions, look at your code. Open up the file, scroll to the line and read the code to yourself, or read it aloud to your pair partner or your [rubber duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging). Many times the cause will be obvious.

# Where?

**Where** in your code is the error occurring?

  * There will often (though not always!) be a *stack trace* including paths, file names, line numbers... even *column* numbers!
  * A stack trace is basically a list of *functions* that have called each other, ordered from most to least recent
  * Once you mentally redact the stack trace, it becomes easier to understand the rest of the error.

> Read the first section of this article, [JavaScript Errors and Stack Traces in Depth: How The Call Stack Works
](http://lucasfcosta.com/2017/02/17/JavaScript-Errors-and-Stack-Traces.html), to learn more about Stack Traces in JavaScript

# What?

**What** is the *name* of the error message?

  * this will usually be in English, though possibly fragmented and jargony, e.g. "file not found" or "undefined is not a function".
  * This is not gibberish. It is meaningful. **Names have power.**

# Why?

What is the **context** of the error? What is the code **expecting**, and what did it find instead?

  * e.g. if it says "file not found", what is the file it is looking for? Is it looking in the right place and the file isn't there? Or is it looking in the wrong place?
  * e.g. if it says "undefined is not a function", *undefined* is the value of a variable that it expects to be a function. What is the name of the variable? Why doesn't it point to a function?

You may have to use traditional debugging techniques to answer these questions, e.g. print statements to fill in the values that didn't make it into the error message itself.

(Yes, a 'file not found' error really should tell you what file was not found; when you write your own error messages you should include as much relevant info as you can.)

# Which?

If there are several error messages in a row, **which** is the root cause?

  * errors often *cascade*, with one causing another causing another
  * remember to **scroll up** in your terminal to see the earlier error messages. Don't allow later errors to hide earlier ones.

# In-Browser Debugging

Modern Web Browsers (Chrome, Firefox, Safari, Edge) have some very good tools to help you inspect the state of your app, including

  * JS console
  * inspect & edit DOM / CSS
  * network access logs and graphs

These tools are useful, but you still need to ask and answer all the debugging questions yourself.

"Modern Front-End Workflow with DevTools" talk: <https://www.youtube.com/watch?v=wz1Sy5C039M>

# Interactive Debuggers

Many text editors contain an *interactive debugger* (aka *visual debugger*) with some powerful features, including:

  * set a *breakpoint* to pause your program when it reaches a specific line
  * *inspect values* of variables and constants
  * a *code console* which lets you execute expressions, call functions, or even change existing code *during a pause*
  * set *watch expressions* which will enable breakpoints based on conditions (like `x < 2`)

These features can help you understand what your code is doing in why, but can also be tedious or complicated or distracting; often print statements and unit tests are a more efficient path to identifying and fixing bugs.

# LAB: exercises about debugging

* FreeCodeCamp:
  * do **all** of the [Debugging](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/debugging) challenges

