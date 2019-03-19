    link href: "https://javascript.info/settimeout-setinterval", description: "a nice tutorial on setTimeout and setInterval, including in-browser exercises"
    topic name: "setTimeout"
    topic name: "callbacks"
    link href: "https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setTimeout"
    link href: "https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval"

# Timing in JavaScript

In this lesson we discuss

 * `Date.now()`
 * `setTimeout` and `setInterval`
 * callbacks

# What time is it?

Ironically, the normal way to tell the *time* in JavaScript is to use an object called *Date*.

Calling `Date.now()` returns a very big number... try it now.

That number represents the number of *milliseconds* that have elapsed since *January 1, 1970*.

This value is also known as *unix time* or *epoch time*, and is a standard way of marking time in software... although as usual, JavaScript is not *quite* following the standards, since usually it's expressed in seconds, not milliseconds.

# Lab: Unix Months

As a really quick exercise, calculate the number of months since 1970.

> Hint: remember the [Playing With Numbers](numbers#anchor/lab_playing_with_numbers) lab?

# Timers and Callbacks

The concept of *callbacks* is very common in JavaScript. In fact, you've probably used them already!

In this lesson we will focus on callbacks in the context of another very useful and common function, `setTimeout`.

# What is a callback?

A *callback* is just a function.

What makes it special is that you pass in *as a parameter* to a different function.

Later on, the callback function *gets called back* -- but **not by your own code**.

Rather, the function that you passed it in to in the first place either calls it immediately, or stores it away somewhere, so that it can be called when something else happens later on...

...possibly seconds or minutes or hours later!

# setTimeout

The built-in function `setTimeout` sets up a callback.

You call it with two parameters:

  1. a callback function (let's call it F)
  2. a number of milliseconds (let's call it N)

`setTimeout` returns *immediately*, but also sets up a hidden timer

after approximately N milliseconds, F gets *called back*

Try this now:

```javascript
function later() {
  console.log("See you later...");
  setTimeout( alligator, 1000 );
}
function alligator() {
  console.log("Alligator!")
}
later();
```

[MDN: setTimeout documentation](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setTimeout)

# setTimeout with inline callback

This "later alligator" program could be rewritten to use an *anonymous inline function* instead of a named top-level function.

```javascript
function later() {
  setTimeout( function() {
    console.log("Alligator!")
  }, 1000 );
  console.log("See you later...");
}
later();
```

Using *inline callbacks* is a very common idiom in JavaScript, especially with `setTimeout`.

The syntax can be confusing because of all the parentheses and curly braces, but it's essentially the same pattern as above:

* call `setTimeout` with two parameters
* the first parameter is a function that prints "Alligator!"
* the second parameter is a number of milliseconds
* `setTimeout` will *return immediately*, then wait 1000 milliseconds, then call the function

> Note that even though "See you later" appears **lower** in the code than "Alligator", it happens **first** because `setTimeout` returns **immediately**.

# Lab: measuring setTimeout's accuracy

In this lab, we will demonstrate that `setTimeout` is not perfect.

(But hey, who is?)

Write a function named `waitASecond` that...

1. Gets the current time in milliseconds
2. Saves it in a variable
3. Uses `setTimeout` to set up a one second timer
4. When the callback executes, get the current time *again*
5. *Subtract* the start time from the new current time and print that value

Now run the function several times in a row. What do you notice?

<details>
<summary>Click Here for Solution</summary>
<pre><code class='javascript'>
function waitASecond() {
  let start = Date.now();
  setTimeout(
    function() {
      let end = Date.now();
      console.log(end - start);
    },
  1000)
}
</code></pre>

# setInterval

`setTimeout` has a sibling named `setInterval`

It works a lot like `setTimeout` but is a little more complicated.

After calling `setInterval`, JavaScript will call your callback *again and again forever* until you *clear* the timer.

For example:

```javascript
function countDownFrom(num) {
    let intervalId = setInterval(tick, 1000);

    function tick() {
        console.log(num);
        num = num - 1;
        if (num <= 0) {
            console.log('Blastoff!');
            clearInterval(intervalId);
        }
    }
}
countDownFrom(10);
```

https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval

# setInterval or setTimeout?

When you want something to happen again and again on a fixed delay, you need to choose between `setInterval` and `setTimeout`.

`setInterval` is a bit more powerful but also a bit more complicated.

Note that anything you do with `setInterval` could instead be implemented using `setTimeout`, as long as your callback **calls `setTimeout` again** recursively, like this:

```javascript
function countDownFrom(num) {
    setTimeout(tick, 1000);

    function tick() {
        console.log(num);
        num = num - 1;
        if (num <= 0) {
          console.log('Blastoff!');
        } else {
          setTimeout(tick, 1000);
        }
    }
}
countDownFrom(10);
```

This design decision comes down to personal style and preference; the two solutions have about the same complexity and number of lines of code.

# Testing Asynchronous Code

* Use a "Mock Clock"
  * the mock clock temporarily replaces `setTimeout` with a different function during tests
  * this function keeps track of what would be called when
  * then "ticks" forward when asked
  * so your tests can simulate speeding up and slowing down time
  
* In Jasmine:

```javascript
beforeEach(function() {
  jasmine.Clock.useMock();
});
//... call the code that calls setTimeout
jasmine.Clock.tick(500); // advance 500 msec
```

  * see thread [How to test timers?](http://groups.google.com/group/jasmine-js/browse_thread/thread/f987956c624840d1/73b3ff5391244b19)
