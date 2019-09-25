    topic name: "recursion"
    topic name: "functions"
    topic name: "conditionals"
    topic name: "loops"
    link href: "https://javascript.info/recursion"
    link href: "https://www.youtube.com/watch?v=k7-N8R0-KY4"
    link href: "http://2ality.com/2015/06/tail-call-optimization.html"

# Recursion

*recursion* is when a function *calls itself*

![ouroboros](/images/ouroboros.jpg)

(like Ouroboros, a mythical serpent who eats its own tail)

<small>(image source: [wikipedia, public domain](https://en.wikipedia.org/wiki/Ouroboros#/media/File:Serpiente_alquimica.jpg))</small>

# Infinite Recursion

Here's a not very useful recursive function:

```js
function go() {
  console.log("Go!");
  go();                // do it all again
}
```

Call this function with `go()`, then either wait a few seconds, or stop it by pressing <kbd>CTRL</kbd>-<kbd>C</kbd>.

`RangeError: Maximum call stack size exceeded` means that `go` has called itself too many times.

# Recursion Requires Termination

For recursion to be useful, it needs to (eventually) stop.

The standard way to stop is called a *guard clause*.

Also called a *base case* or a *terminator*.

```js
function countdown(seconds) {
  if (seconds === 0) {
    console.log("Blastoff!");
  }
```

This means, "When seconds reaches 0, **stop recursing**."

# Countdown

The simplest form of recursion uses a counter; in this example we are counting down the seconds until a rocket launches.

```js
function countdown(seconds) {
  if (seconds == 0) {
    console.log("Blastoff!");
  } else {
    console.log("" + seconds + "...");
    let nextCount = seconds - 1;
    countdown(nextCount);
  }
}

countdown(10);
```

Put the above in a source file called `countdown.js` and try it now. 

Note that you *must change* the value; otherwise you will recurse forever.

# Exercise: Draw It Out

Please dive into the above `countdown` function in excruiciating detail.

Fill out the cells of the following table for the call `countdown(5)`:

| Iteration | seconds | nextCount |
|---|---|---|
| 0 |   |   |
| 1 |   |   |
| 2 |   |   |
| 3 |   |   |
| 4 |   |   |

# Recursion is Reduction

In addition to the base case, a recursive function needs to define at least one other case; this case *wraps around* the base case like a Russian doll.

![matryoshka](/images/matryoshka.jpg)

You can think of a recursive function as starting with a large problem, and gradually reducing the problem until it reaches the base case.

Since the base case has a known solution, every other step can then be built back up on top of it -- which is why it's called the *base*.

In this way, recursion is an example of the *divide and conquer* approach to problem-solving.

<small>(image source: [wikipedia, public domain](https://en.wikipedia.org/wiki/Matryoshka_doll#/media/File:First_matryoshka_museum_doll_open.jpg))</small>

# Lab: Recursive Factorial

To find the *factorial* of a number N, take all the counting numbers between 1 and N and multiply them together.

Write a recursive function called `factorial` that takes a number and returns its factorial.

Remember to start with the base case!

```js
factorial(1)    // 1
factorial(2)    // 2
factorial(3)    // 6
factorial(10)   // 3628800
```

# Solution: Factorial

<details>
<summary>Hint</summary>
<div>
You may want to use logic to define edge cases, and breakpoints. e.g.

```js
if (number === 1) {
  return 1
}
```

<details>
<summary>Solution</summary>
<div>

```js
function factorial(n) {
    if (n === 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
```

</div>
</details>

# Exercise: Draw It Out

Please dive into the above `factorial` function in excruciating detail.

Fill out the cells of the following table for the call `factorial(5)`:

| Iteration | n | (n - 1) | factorial(n - 1) | return value |
|---|---|---|---|---|
| 0 |   |   |   |   |
| 1 |   |   |   |   |
| 2 |   |   |   |   |
| 3 |   |   |   |   |
| 4 |   |   |   |   |

# Recursion vs Loops

Recursion can be seen as another kind of [loop](loops), like `for` or `while` or `reduce`.

In fact, most recursive functions can be "unrolled" and rewritten using a loop and a [stack](stacks).

For example, here is `factorial` using a stack instead of recursion:

```js
function factorial(n) {
    let stack = [];
    while (n >= 1) {
        stack.push(n);
        n = n - 1;
    }
    let f = 1;
    while (stack.length > 0) {
        f = f * stack.pop();
    }
    return f;
} 
```

What do you think about this implementation compared to the previous one? What are the advantages and disadvantages of recursion vs. loops?

# Lab: Recursive Fibonacci

Using recursion, write a program called `fib.js` so that running `node fib.js 10` prints

```js
[ 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ]
```

which are the first 10 elements of the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_number).


# Recursive Fibonacci solution

<details>
<summary>Hint</summary>
<div>
Look back to fibonacci using stacks. Instead of looping with `while` you can use recursion 
</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
let series = [0, 1];

function fibbo(array) {
  let lastNum = array.pop()
  let penultNum = array.pop()
  let nextNum = lastNum + penultNum

  array.push(punultNum)
  array.push(lastNum)
  array.push(nextNum)

  if(array.length === 10) {
    return array
  } else {
    fibbo(array)
  }
}

console.log(fibbo(series));
```

</div>
</details>