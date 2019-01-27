    project name: 'guess'
    topic name: "conditionals"
    topic name: "loops"
    topic name: "variables"
    topic name: "break"
    topic name: "index"

# Loops

Computers are like robots. They are good at doing things over and over and over and over again.

A LOOP is when we ask a program to do something many times.

# while

The simplest loop in JavaScript is `while`. 

```js
while (someCondition) {
    someAction()
}
```

In English this reads, "While some condition is true, do some action".

# while true

If you want something to keep going forever, set condition to `true`:

```js
while (true) {
  console.log("Hello")
}
```

This means "While true is true, say 'Hello'". Obviously `true` will always be true, so it goes forever.

To stop it, hold down the CONTROL key and press the C key.

This is called an *infinite loop*. 

**Note well!** The lines between `{` and `}` are INDENTED. Indentation is very important to you and other humans. It lets our eyes follow the patterns and helps us quickly see what parts of the program go with each other.

# One Infinite Loop

![One Infinite Loop](../images/one-infinite-loop.jpg)

*Fun Fact:* The address of Apple HQ is

    1 Infinite Loop
    Cupertino, CA 95014

*Image from the Wikimedia Commons, licensed under the Creative Commons Attribution-Share Alike 3.0 Unported license. Attribution: Joe Ravi*

# LAB: Infinite Counting

Let's write a program that counts from 0 to infinity. Put this in a file called `count.js`.

```js
let count = 0;
while (true) {
    console.log(count);   
    count = count + 1;
}
```

Run the program with `node count.js`.

> Remember, CONTROL-C means "Stop everything!!!"

# LAB: Who wants to loop forever?

Next, we will change your `count.js` program so that it only counts to 100.

Please try this yourself! But it's kind of tricky, so on the next slide I'll show you one solution.

# while for a while

```js
let count = 1;
while (count <= 100) {
    console.log(count);   
    count = count + 1;
}
```

Did you find a solution? Did your program stop at 100 or 99?

# `while`

* The `while` statement keeps checking the expression

  * if it's `true` then it loops back
  * if it's `false` then it stops looping and goes on to the rest of the program

This is fairly complicated, so let's stop here and make sure to understand everything that's happening in this little program.

# `while` breakdown (pt.1)

    let count = 1

creates a *variable* named `count` and sets its value to `1`.

    while (count <= 100) 
    
starts a loop and immediately compares `count` to `100`.

`1` is less than `100`, so the expression is `true`, so we continue with the block of code starting with the `{`.

# `while` breakdown (pt.2)

      console.log(count);

prints the current value of count.

      count = count + 1

*increments* the `count` variable... it was `1`, so now it's `2`

    }

goes *back to the `while` line* and checks again

# `while` breakdown (pt.2)

    while (count <= 100)

compares `count` to `100`.

`2` is less than `100`, so the expression is `true`, so we continue with the loop.

Eventually, `count` becomes `101`, and the `while` expression is `false`, and so we stop looping and go on.

# `break` dancing

The magic word `break` stops a loop immediately.

Here's a more verbose way of counting to 100:

```js
let count = 0;
while (true) {
    console.log(count);   
    count = count + 1;
    if (count > 100) {
        break;
    }
}
```

# LAB: One Potato

Remember this poem?

    1 potato,
    2 potato,
    3 potato,
    4!
    5 potato,
    6 potato,
    7 potato,
    More!

Write a program called `potato.js` that prints that poem, using loops.

(No, you can't just print the entire poem as a single string; that would be cheating.)

# Many Potatoes

Remember, there's always more than one solution to any problem! Don't get fixated on finding the One Right Answer.

> "The strategy is definitely: first make it work, then make it right, and, finally, make it fast."
> - Brian Kernighan, creator of the C programming language

In the next slides we will examine several different ways to write the One Potato program.

# functional decomposition

The first thing we'll do is *decompose* the problem into two smaller problems:

1. counting from 1 to 8
2. printing the correct message for any value

*Decomposition* is one of the most important skills in programming. It lets you focus. 

Also known as "*divide and conquer*".

Using a *function* is the most straightforward way to capture a smaller task.

[Modular Decomposition](http://www.cs.columbia.edu/~evs/songs/Modular_20Decomposition.mp3) song by Eric Siegel, Ph.D.

# counting potatoes

```js
function potato(count) {
    if (count === 8) {
        return "More!"
    } else if (count === 4) {
        return "4!"
    } else {
        return "" + count + ","
    }
}
```


# `while true`

```js
let i = 1;
while (true) {
    console.log(potato(i));
    i = i + 1;
    if (i > 8) {
        break;
    }
}
```

# `while`

```js
let i = 1;
while (i <= 8) {
    console.log(potato(i));
    i = i + 1;
}
```

# `do`

`do` is like `while`, but the condition is checked at the end of the loop, not the beginning.

```js
let i = 0;
do {
    i = i + 1;
    console.log(potato(i));
} while (i < 8);
```

# `for`

JavaScript inherited `for(;;)` from C; it's cumbersome but you should learn to recognize it.

```js
for (var i=0; i <= 8; i++) { 
  console.log(potato(i+1));
}
```

|phrase|meaning|
|---|---|
| `for`                    | in a loop, |
| `var i`                  | make an *index* variable named `i` |
| `i=0`                    | and initially set it to `0` |
| `i < 8`                  | then, as long as `i` is less than `8` |
| `{` ... `}`              | execute this block of code |
| `console.log(potato(i))` | print the `i+1`th potato message |
| `i++`                    | and then *increment* `i` before the next time through |

See? Cumbersome.

# LAB: Prime Numbers

A *prime number* is one that is only *divisible* by itself and 1.

The goal of this lab is to print all (and only) the prime numbers between 2 and 100.

To do this, your code will probably need to use one or the other, or both, of these:

  * *nested functions* - functions that call other functions
  * *nested loops* - loops that contain other loops

Please try this now; if you get stuck, the next few slides have some tips.

# TIP: Prime Numbers: Tip 1

use the `isDivisible` function you wrote back in the [functions](functions) lesson

# TIP: Prime Numbers: Tip 2

write a function named `isPrime` that takes one parameter, and returns `true` if that number is prime

# TIP: Prime Numbers: Tip 3

write a main loop that counts from 2 to 100; inside that loop, call `isPrime` and print the number if `isPrime` is true

# Fake it 'til you make it

Functional decomposition is also a great way to write a program that you haven't quite figured out yet.

When you reach a step that you don't know how to do, or just don't want to think about right now, call a function *that you haven't written yet*.

Then later on -- only *after* the parent function is written -- go back and write the faked-out function.

# LAB: More about loops

Exercisms: 

  * [Collatz Conjecture](https://exercism.io/my/solutions?exercise_id=collatz-conjecture&track_id=javascript)
  * [Pangram](https://exercism.io/my/solutions?exercise_id=pangram&track_id=javascript)

* [An overview of JavaScript iterators
](https://medium.freecodecamp.org/javascript-iterators-17ab32c3cae7) - The difference between for, for…in and for…of loops
