# Input and Output

* Computers have many senses -- keyboard, mouse, network card, camera, joystick, etc. Collectively, these are called **INPUT**.

* Computers can also express themselves in many ways -- text, graphics, sound, networking, printing, etc. Collectively, these are called **OUTPUT**.

* Input and Output together are called **I/O**.

* the only part of your laptop that is *really* a computer is the CPU and the RAM; all the other parts (keyboard, trackpad, display, disk drive, etc.) are technically I/O devices 

# Memory vs I/O

* Performing *calculations* and accessing *memory* is **very fast**
* ...but reading and writing to I/O devices is **slow**
    * (at least as far as the CPU is concerned)
    * I/O operations can take *seconds* or *milliseconds*; CPU operations take *nanoseconds*
* Every time you ask JavaScript to do an I/O operation, it *pauses your program*
  * this allows the CPU to spend time doing other things, not just sitting idle waiting for a key to be pressed or a file to be written
* In NodeJS, you have to write a function for JavaScript to run once it *resumes*
    * this function is named an *asynchronous callback*
    * *asynchronous* is Greek for "out of time" or "not together in time"

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

# readline

* NodeJS is more than a *JavaScript interpreter*
* It's also a collection of *JavaScript libraries*
* One of the libraries is called `readline`
    * `readline` makes it easier to read lines, naturally :-)
    * the "books" in this library are functions
      * (and classes and other things too)

# using readline

> Warning: this code uses features we have not yet covered! Copy and paste it verbatim during the codealong below, and don't worry if it doesn't make much sense yet.

To use `readline`, include the following lines in the top of your source file:

```javascript
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}
```

> This is called "boilerplate code" -- you don't need to fully understand it before using it.

# using readline - explanation

| code                                                        | explanation                                                                                                                             |
|-------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `const readline = require('readline');`                     | load the `readline` package and name it `readline`                                                                                      |
| `const readlineInterface = readline.createInterface({...})` | create an *interface* to readline using the following settings:                                                                         |
| `  process.stdin,`                                | for input, use the *standard input stream* (i.e. terminal keyboard input)                                                               |
| `  process.stdout`                               | for output, use the *standard output stream* (i.e. terminal console output)                                                             |
| `function ask(questionText) {...}`                          | a function named *ask* that uses the [Promise API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises) to asynchronously ask a question and wait for a reply |

(We will cover the Promise API in much more detail later; for now, all you really need to know is that Promises allow us to use `async` and `await` in the next slide.)

# LAB: using readline and await

Codealong time! Please follow along with the instructor and enter this code into a file named `quest.js`:

```javascript
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

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

* run it from the command line using `node quest.js`

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
* Then it says hello to the user by their *full name*.

* Run the program by typing `node name.js` on the command line.

# Full Name solution

<details>
<summary>Hint</summary>
<div>
You may want to use `readline` and the `ask()` function.

```js
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

async function fullName() {
  let firstName = await ask("What is your first name? ")
  let lastName = await ask("What is your last name? ")

  console.log("Hello, " + firstName + " " + lastName + "!")
}
```

</div>
</details>