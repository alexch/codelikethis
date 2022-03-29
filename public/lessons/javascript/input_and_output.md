    topic name: "input-output"
    topic name: "functions"
    topic name: "promise"
    topic name: "async-await"
    topic name: "values"
    topic name: "callbacks"
    link name: "Mozilla Developer Network: Callbacks",
         href: "https://developer.mozilla.org/en-US/docs/Glossary/Callback_function"
    link name: "Mozilla Developer Network: Async Functions",
         href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function"
    link name: "Mozilla Developer Network: Await async functions",
         href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await"

# Input and Output

* Computers can receive data from a keyboard, mouse, camera, microphone, etc.
  * These are called **INPUT**s
* Computers can also emit data like; text, graphics, sound, printing, etc.
  * These are called **OUTPUT**s

# Memory vs I/O

* Performing **calculations** and using **memory** is **fast**
* Reading **Input** and writing **Output**  is **slow**
  * CPU operations = **nanoseconds**, 1/1,000,000,000 second
  * I/O operations = **milliseconds** to **seconds**
* During an I/O operation, the program is paused, or waits.
  * CPU does other things during that time.

# Using Readline

`readline` is a **library**, which is code you can **use**, but someone else **wrote**

Use Readline like the following example:

```js
// include the library
const readline = require('readline');
// create an "interface", using STDIN and STDOUT
const readlineInterface = readline.createInterface(
  process.stdin, 
  process.stdout
);

// create a function called "ask" that
// OUTPUTs a question, and waits for INPUT
function ask(questionText) {
  // use a "Promise", which stands in for a future answer
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}
```

# Echo Input with Readline

```js
// make sure readline the code from the prior slide
// is included at the top of your file
async function echo() {
  console.log("Starting program...");
  let message = await ask("Say something, and I will echo!\n> ");
  console.log("You wrote:\n" + "=> " + message);
  console.log("Program complete...");
  process.exit();
}
// call the "echo" function
echo();
```

# LAB: Echo

Create a new file called `echo.js`

* Include the `readline` library, `readlineInterface`, and `ask` function
* Add the code from the previous slide into the file
* Run `echo.js` using `node`, type an INPUT, and then press the `[ENTER]` key

# Async and Await

A **PROMISE** is something that stands in for a finished result, while a task is still processing.

An example would be a **ticket** or **receipt** used to redeem an order from a food-truck.

> Promises can be `await`ed, within a function marked as `async`.

1. `await` means "wait for the following to finish"
2. To use `await` inside a function, you must use mark it as `async`

> WARNING: `async` functions and `for` loops do not mix well, use `while` instead

# LAB: First and Last Name

Now it's your turn to write a program from scratch.

Write a program named `name.js` that asks two things:

1. Your first name
2. Your last name
3. Then it should output the following:

```txt
'Hello, {firstName} {lastName}!'
```

> Replace the {firstName} and {lastName} with your INPUT values

# First and Last Name solution

<details>
<summary>
Hint
</summary>
<div>
You will need `readline` and the `ask()` function.

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
// include 'readline' and the 'ask' functions above
async function fullName() {
  let firstName = await ask("What is your first name? ")
  let lastName = await ask("What is your last name? ")

  console.log("Hello, " + firstName + " " + lastName + "!")
}

fullName()
</code>
</pre>
</details>

# LAB: What is your Quest

Create a file named `quest.js`.

Make the program ask three things:

1. "What is your name?"
2. "What is your quest?"
3. "What is your favorite color?"

After asking all three questions, the program should answer:

```txt
'Hello {name}! Good luck with {quest}, and here is a {color} flower for you.'
```

# Solution: What is your Quest

<details>
<summary>
Solution
</summary>

<pre>
<code class="language-javascript">
// include 'readline' and the 'ask' function above
async function start() {
  let name = await ask('What is your name? ');
  let quest = await ask('What is your quest? ');
  let color = await ask('What is your favorite color? ');
  console.log('Hello ' + name + '! ' +
    'Good luck with ' + quest + ', ' +
    'and here is a ' + color + ' flower for you.');
  process.exit();
}
</code>
</pre>
</details>

# LAB: Name Length

Create a file `name-length.js` that:

* Calculates length of the first and last name INPUT combined
* Count only the **non-blank** characters.

Example:

```txt
What is your first name? Grace
What is your last name? Hopper
Hello, Grace Hopper!
Your name is 11 characters long.
```

> NOTE: Whitespace, tabs, and new-lines are considered **blank**

# LAB: Length of Each Name

Create a file `allNamesLength.js` that:

* Asks for a user's first name, middle name, and last name.
* Then prints the length of each *individual* name
* And finally prints the total character count for all three names.

Example:

```txt
What is your first name? Augusta
What is your middle name? Ada
What is your last name? King

Hello, Augusta Ada King!
Your first name is 7 characters long.
Your middle name is 3 characters long.
Your last name is 4 characters long.
Your full name is 14 characters long.
```
