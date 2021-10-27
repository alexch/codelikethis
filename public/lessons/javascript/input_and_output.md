    video youtube_id: 'DKGZlaPlVLY'
    topic name: "input-output"
    topic name: "node"
    topic name: "terminal"
    topic name: "functions"
    topic name: "methods"
    topic name: "es6"
    topic name: "variables"
    topic name: "values"
    topic name: "callbacks"
    topic name: "command-line"
    topic name: "strings"
    project name: "guess"
    link name: "Mozilla Developer Network: Callbacks",
         href: "https://developer.mozilla.org/en-US/docs/Glossary/Callback_function"
    link name: "Wikipedia: Callbacks",
         href: "https://en.wikipedia.org/wiki/Callback_(computer_programming)#JavaScript"
    link name: "Mozilla Developer Network: Async Functions",
         href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function"
    link name: "Mozilla Developer Network: Await async functions",
         href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await"
    link name: "Kyle Simpson: Input & Output",
         href: "https://frontendmasters.com/courses/javascript-basics/input-output/"
    link name: "You Don't Know JS: Input & Output",
         href: "https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch1.md#output"

# Input and Output

* Computers have many senses -- keyboard, mouse, network card, camera, joystick, etc. Collectively, these are called **INPUT**.

* Computers can also express themselves in many ways -- text, graphics, sound, networking, printing, etc. Collectively, these are called **OUTPUT**.

* Input and Output together are called **I/O**.

* the only part of your laptop that is *really* a computer is the CPU and the RAM; all the other parts (keyboard, trackpad, display, disk drive, etc.) are technically I/O devices 

# Memory vs I/O

* Performing *calculations* and accessing *memory* is **very fast**
* Reading *Input* and writing *Output*  is **slow**
  * I/O operations can take many *milliseconds*
  * CPU operations take *nanoseconds*, 1000x faster
* Every time you ask JavaScript to do an I/O operation, it *pauses your program*
  * This allows the CPU to spend time doing other things, not just sitting idle waiting for a key to be pressed or a file to be written
* Node.js uses a *function* to run once the program *resumes*
  * This is called an *asynchronous callback*
  * *asynchronous* is Greek for "out of time" or "not together in time"

# The Readline Library

* Node.js is more than just a *JavaScript interpreter*
* It is also a collection of *JavaScript libraries*
* One of the libraries is called `readline`
  * Readline makes it easier to read lines of input from a human, or a program

# Using Readline

To use `readline`, add the following lines at the top of a JavaScript file

```javascript
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}
```

# Using Readline Step-by-Step

| code                                                        | explanation                                                                                                                             |
|-------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `const readline = require('readline');`                     | load the `readline` package and name it `readline`                                                                                      |
| `const readlineInterface = readline.createInterface({...})` | create an *interface* to readline using the following settings:                                                                         |
| `  process.stdin,`                                | for input, use the *standard input stream* (i.e. terminal keyboard input)                                                               |
| `  process.stdout`                               | for output, use the *standard output stream* (i.e. terminal console output)                                                             |
| `function ask(questionText) {...}`                          | a function named *ask* that uses the [Promise API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises) to asynchronously ask a question and wait for a reply |

(We will cover the Promise API in much more detail later; for now, all you really need to know is that Promises allow us to use `async` and `await` in the next slide.)

# Echoing with Readline

```javascript
const readline = require("readline");
const readlineInterface = readline.createInterface(
  process.stdin,
  process.stdout
);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

async function echo() {
  console.log("Starting program...");
  let message = await ask("Say something awesome, and I will repeat it!\n> ");
  console.log("You wrote:\n" + "=> " + message);
  console.log("Program complete...");
  process.exit();
}

echo();
```

# LAB: Echo

The code on the previous slide will take in user input, and echo it back to the console. Let's try it out!

  * Create a new file called `echo.js`
  * Type the code from the previous slide into that file
  * Run the file in the terminal with the command `node echo.js`

# LAB: Using Readline Many Times

Code along time! Please follow along with the instructor and enter this code into a file named `quest.js`:

> Run it from the command line using `node quest.js`

```javascript
const  = require('readline');
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

# Async Await

* We will learn more about callbacks, promises, and `async`/`await` later
* For now, follow these two rules when using `async` and `await`:

  1. `await` means "wait for the following thing to happen"
  2. when you use `await` inside a function, you must use `async` to define that function

> WARNING: `async` functions don't play nicely with plain `for` loops, but there are other ways to loop that do work well

# LAB: First and Last Name

* Now it's your turn to write a program from scratch.
* Write a program named `name.js` that asks two things:

  1. Your first name
  2. Your last name

* Then it says hello to the user by their *full name*.

* Run the program by typing `node name.js` on the command line.

# First and Last Name solution

<details>
<summary>
Hint
</summary>
<div>
You may want to use `readline` and the `ask()` function.

<pre>
<code class="language-javascript">
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}
</code>
</pre>

</div>
</details>

<details>
<summary>
Solution
</summary>

<pre>
<code class="language-javascript">
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

fullName()
</code>
</pre>
</details>

# LAB: Name Length

* Now create a file `nameLength.js` that calculates length of the user's first and last name combined
* For instance:

```
What is your first name? Grace
What is your last name? Hopper
Hello, Grace Hopper!
Your name is 11 characters long.
```

> NOTE: Remember to count only non-empty characters

# LAB: Length of Each Name

* Now create a file `allNamesLength.js` that asks for all the user's names, prints the length of each *individual* name, and prints the final total for all names.

* Run the program by typing `node allNamesLength.js` on the command line.

For instance:

```
What is your first name? Augusta
What is your middle name? Ada
What is your last name? King

Hello, Augusta Ada King!
Your first name is 7 characters long.
Your middle name is 3 characters long.
Your last name is 4 characters long.
Your full name is 14 characters long.
```
