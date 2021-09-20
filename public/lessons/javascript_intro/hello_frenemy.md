# Terminal I/O

* In JavaScript,
    * `console.log` means "print a line to the terminal"

* In NodeJS,
    * `process.stdin` means "input coming from the terminal"

    * Reading a line in NodeJS is **weird**; here's one way to do it

```js
process.stdin.once('data', (chunk) => { console.log(chunk.toString()) } )
```

> The weirdness is explained on the next slide!

---

# node load code, decoded

```js
process.stdin.once('data',
    (chunk) => { console.log(chunk.toString()) }
)
```

> `once` is a function that takes two parameters,
> and its second parameter is **another function**

|phrase|meaning|
|---|---|
| `process.stdin`        | hey terminal input, |
| `.once('data',` ... `)`  | when you get some data, |
| `(chunk)`              | please name it `chunk` |
| ` => `                 | and send it to |
| ` { ` ... ` }`         | this block of code |
| `console.log(chunk.toString())`   | convert it to a string and print it to the terminal |

---

# Welcome to Callback City!

The previous one-liner code is equivalent to this:

```js
function printLine(chunk) { 
    console.log(chunk) 
}
process.stdin.once('data', printLine);
```

The `printLine` function itself is called a *callback* 
(since you are asking the I/O device to *call you back* when it receives input).

---

# LAB: Hello, friend!

1. Open `hello.js` in your text editor
2. Change it to contain the following code:

```js
console.log("What is your name?");
process.stdin.once('data', (chunk) => {
    let name = chunk.toString();
    console.log("Hello, " + name + "!");
});
```

3. Save the file and switch back to the terminal
4. Run the program using `node hello.js`
5. Type in your name and press the <kbd>Return</kbd> key (also called <kbd>Enter</kbd>)

What happens? Is this what you expected?

---

# Yikes!

* Uh-oh! We've got trouble... what is that exclamation point doing way down there?

* The first thing to do is DON'T PANIC!
* You are *totally* going to figure this out.
* And even if you don't, you haven't actually broken anything.
* In fact, it's really hard to break a computer just by typing, so stay calm.

---

# Control-C to close

* First things first: get back to the command line
* This program doesn't *exit* yet, so you will need to *force* it to close
* Do this by holding down CONTROL and pressing C
    * abbreviated ⌃C or CTRL-C

---

# Let's fix this

* Have you figured out what the problem is?
* If not, I'll tell you on the next slide.
* Take a second and try to figure it out first. I'll wait.

---

# The newline character

* Here's a fun fact:
* In addition to letters, numbers, and punctuation, computers also store other keys inside strings
* Among these CONTROL CHARACTERS is the one that represents the RETURN KEY
* This character's name is NEWLINE
* Every time you read a line, the computer reads *all* the characters, *including the newline*!

---

# Trim it

* Fortunately, there's an easy fix
* If you send the message `trim` to a string, it will remove all SPACES and NEWLINES from both ends

---

# fixing Hello, Friend

* Change the program to look like this:

```js
console.log("What is your name?");
process.stdin.once('data', (chunk) => {
    let name = chunk.toString().trim();
    console.log("Hello, " + name + "!");
});
```

* Run it and make sure it works OK
* Press ⌃C to close it

---

# This Way To The Exit

* Change the program to look like this:

```js
console.log("What is your name?");
process.stdin.once('data', (chunk) => {
    let name = chunk.toString().trim();
    console.log("Hello, " + name + "!");
    process.exit();
});
```

Note that:

  * `process.exit` uses the same `process` object as `process.stdin`
  * The call to `process.exit()` must be *inside* the callback
    * Otherwise, what happens? Try it and see!

---

# Good Friend, Bad Friend

* Your [`hello.js` program](./input-and-output) should currently look something like this:

```js
console.log("What is your name?");
process.stdin.on('data', (chunk) => {
    let name = chunk.toString();
    console.log("Hello, " + name + "!");
});
```

* Now change `hello.js` so that it doesn't always say hello!
  * If the user's name is "Darth" then say "Noooooo! That's impossible!"

---

# Infinite Names

* Change `hello.js` so it keeps asking for names forever...
  * ...unless and until someone says their name is "bye!"
  * then it stops and exits back to the terminal

---

# Enemies List

* Change `hello.js` so that it says "Go away!" if the user's name is any one of a number of evil names
* For instance, Voldemort, Satan, Lex Luthor...
* Bonus: don't let enemies sneak in even if they spell their names with capital letters, like `VolDeMort`

---
