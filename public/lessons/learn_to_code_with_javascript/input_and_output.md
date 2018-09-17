# Input and Output

* Computers have many senses -- keyboard, mouse, network card, camera, joystick, etc. Collectively, these are called INPUT.

* Computers can also express themselves in many ways -- text, graphics, sound, networking, printing, etc. Collectively, these are called OUTPUT.

* Input and Output together are called **I/O**.

# Terminal I/O

* In JavaScript, 
    * `console.log` means "print a line to the terminal"
    
* In NodeJS,
    * `process.stdin` means "input coming from the terminal"
    
    * Reading a line in NodeJS is weird; here's one way to do it

```
@@@ js
process.stdin.on('data', (chunk) => { console.log(chunk) })
```

# node load code, decoded

```
@@@ js
process.stdin.on('data', (chunk) => { console.log(chunk) })
```

|phrase|meaning|
|---|---|
| `process.stdin`        | hey terminal input, |
| `.once('data',` ... `)`  | when you get some data, |
| `(chunk)`              | please name it `chunk` |
| ` => `                 | and send it to |
| ` { ` ... ` }`         | this block of code |
| `console.log(chunk)`   | print `chunk` to the terminal |

---

`=>` is called "fat arrow" and is equivalent to this:

```
@@@ js
process.stdin.once('data', function(chunk) { console.log(chunk) })
```

and the block of code itself is called a *callback* (since you are asking `stdin` to *call you back* when it receives input).

# LAB: Hello, friend!

1. Open `hello.js` in your text editor
2. Change it to contain the following code:

        @@@ js
        console.log("What is your name?");
        process.stdin.once('data', (chunk) => {
            let name = chunk.toString(); 
            console.log("Hello, " + name + "!"); 
        });

3. Save the file and switch back to the terminal
4. Run the program using `node hello.js`
5. Type in your name and press the <kbd>Return</kbd> key (also called <kbd>Enter</kbd>)

What happens? Is this what you expected?

# Yikes!

* Uh-oh! We've got trouble... what is that exclamation point doing way down there?

* The first thing to do is DON'T PANIC!
* You are *totally* going to figure this out.
* And even if you don't, you haven't actually broken anything.
* In fact, it's really hard to break a computer just by typing, so stay calm.

# Breathe

* [In through the nose](http://qr.ae/TUp1vd)...
* Out through the mouth...
* In through the nose...
* Ahhhhhhhh.

# Control-C to close

* First things first: get back to the command line
* This program doesn't *exit* yet, so you will need to *force* it to close
* Do this by holding down CONTROL and pressing C
    * abbreviated ⌃C or ^C or CTRL-C

# Let's fix this

* Have you figured out what the problem is?
* If not, I'll tell you on the next slide.
* Take a second and try to figure it out first. I'll wait.

# The newline character

* Here's a fun fact:
* In addition to letters, numbers, and punctuation, computers also store other keys inside strings
* Among these CONTROL CHARACTERS is the one that represents the RETURN KEY
* This character's name is NEWLINE
* Every time you read a line, the computer reads *all* the characters, *including the newline*!

# Trim it

* Fortunately, there's an easy fix
* If you send the message `trim` to a string, it will remove all SPACES and NEWLINES from both ends

# LAB: fixing Hello, Friend

* Change the program to look like this:

        @@@ js
        console.log("What is your name?");
        process.stdin.once('data', (chunk) => {
            let name = chunk.toString().trim();
            console.log("Hello, " + name + "!");
        });

* Run it and make sure it works OK
* Press ⌃C to close it

# LAB: exit

* Change the program to look like this:

        @@@ js
        console.log("What is your name?");
        process.stdin.once('data', (chunk) => {
            let name = chunk.toString().trim();
            console.log("Hello, " + name + "!");
            process.exit();
        });

Note that:

  * `process.exit` uses the same `process` object as `process.stdin`
  * The call to `process.exit()` must be *inside* the callback
    * Otherwise, what happens? Try it and see!

# LAB: Capitalization

* What happens if you type your name in all lowercase?
* Make the program capitalize your name for you even if you forget.

**Hint**: remember `slice` from the [Strings lesson](strings)?

# LAB: YELL YOUR NAME

* Now go crazy and make it YELL your name! 
    * Hint: Use the [toUpperCase](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase) method

---

# readline

* NodeJS is more than a JavaScript *interpreter*

* It's also a collection of JavaScript *libraries*

* One of the libraries is called `readline` 
    * `readline` makes it easier to read lines, naturally :-)
    * the "books" in this library are functions 
      * (and classes and other things too)

# using readline

To use `readline`, include the following lines in the top of your source file:

```ecmascript 6
const readline = require('readline');

const readlineInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
    
function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}
```

# using readline - explanation

|code| explanation |
|---|---|
| `const readline = require('readline');` | load the `readline` package and name it `readline` |
| `const readlineInterface = readline.createInterface({...})` | create an *interface* to readline using the following settings: |
|`     input: process.stdin,` | for input, use the *standard input stream* (i.e. terminal keyboard input) |
|`     output: process.stdout` | for output, use the *standard output stream* (i.e. terminal console output) 
|`function ask(questionText) {...}` | create a function named *ask* that uses the [Promise API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises) |

(We will cover the promises in much more detail later; for now, all you really need to know is that Promises allow us to use [async and await]() in the next slide.)

# LAB: using readline and await

Codealong time! Please follow along with the instructor and enter this code into a file named `quest.js`:

```ecmascript 6
const readline = require('readline');

const readlineInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
    
function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

start();

async function start() {
  let name = await ask('What is your name? ');
  let quest = await ask('What is your quest? ');
  let color = await ask('What is your favorite color? ');
  console.log('Hello ' + name + '! ' + 
    'Good luck with ' + quest + ', ' +
    'and here is a ' + color + ' flower for you.');
  process.exit();
}
```

* run it from the command line using `node hello-readline.js`

# async and await

* We will learn a lot more about callbacks, promises, and `async`/`await` later
* For now, follow these two rules when using `async` and `await`:

    1. `await` means "wait for the following thing to happen"
    2. when you use `await` inside a function, you must use `async` to define that function

> WARNING: `async` functions don't play nicely with `for` loops! (Fortunately, there are other ways to loop that do work well.)

# LAB: Full Name

* Now it's your turn to write a program from scratch.
* Write a program named `name.js` that asks two things:
  1. Your first name
  2. Your last name
* Then it says hello to the user by her *full name*.
* Run the program by typing `node name.js` on the command line.

# CONGRATULATIONS!

> You just wrote a program!

You are now officially a coder. HIGH FIVE!

# Lab: Name Length

* Change `name.js` so it also prints the number of characters in the user's name.
* For instance:

        What is your first name? Grace
        What is your last name? Hopper
        Hello, Grace Hopper!
        Your name is 11 characters long.
