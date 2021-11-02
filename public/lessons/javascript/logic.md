    topic name: "comparisons"
    topic name: "booleans"
    topic name: "conditionals"
    topic name: "if-then"
    topic name: "if-else"
    topic name: "truthy-falsy"
    topic name: "assignment"
    topic name: "operators"
    topic name: "conjunctions"
    topic name: "node"
    topic name: "functions"
    topic name: "values"

# Truthiness

Computers have a very particular idea of when things are *true* and *false*.

# True or False?

Try the following in node:

* `1 < 2`
* `2 + 2 < 4`
* `2 + 2 <= 4`
* `"anonymous".endsWith("us")`
* `"every journey".startsWith("a step")`

# Comparisons

*Comparison operators* let you compare two values. JavaScript has all the usual suspects...

|Operator|Comparison|
|---|---|
| `<` | less than |
| `>` | greater than |
| `<=` | less than or equal to |
| `>=` | greater than or equal to |
| `==` | equal to |
| `!=` | not equal |
| `===` | *really* equal to |
| `!==` | *really* not equal to |

[MDN: comparison operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators)

These are also called "Boolean operators" after *[George Boole](https://en.wikipedia.org/wiki/George_Boole)*,
a 19th-century mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

# Conditions

The magic word `if` is a *conditional*.

The phrase immediately after `if` is a *condition*.

```js
if (age < 18) {
  console.log('Sorry, you cannot vote yet.');
}
```

|phrase|meaning|
|---|---|
| `if (` ... `)`      | **if** this condition's value is *truthy* |
| `{` ... `}`         | **then** run this block of code |

Wait a second. "Truthy?"

[MDN: if...else](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else)

# What is truthiness?

![Truthiness](https://res.cloudinary.com/btvca/image/upload/v1574445211/curriculum/truthiness_jhdubk.png)

* In the "Colbert Report", [truthiness](https://en.wikipedia.org/wiki/Truthiness) means things we *feel* to be true, even though we know they're probably not

* In JavaScript, **all** values are *truthy* **unless** they are defined as *falsy*.

* [MDN: Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy)

# What is falsiness?

`false`, `null`, `undefined`, `0`, `NaN`, and the empty string `""` are all falsy.

Fortunately, `true` is truthy and `false` is falsy.

Unfortunately, the string `"false"` is truthy, and the string `"0"` is truthy, even though the number `0` is falsy. This is because the string contains a character, and, even though the character is `0`, any string with at least one character is truthy.

[MDN: Falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)

# If...Then...Else...

The magic word `else` allows for conditional **branching**.

```js
if ( age >= 18 ) {
  console.log('allowed');
} else {
  console.log('denied');
}
```

Like a fork in the road, the program chooses one path or the other.

It takes the first path if the condition is truthy, and takes the second path if the condition is falsy.

# 2 + 2 = ?

Sadly, this mathematical expression causes an error

  2 + 2 = 4

You need to do the following instead

  2 + 2 === 4

Why is this needed?

# Conditional or Assignment?

> BEWARE of using a single equal sign inside an `if` condition!

* The value of a comparison is either `true` or `false`
  * So `if (x === 2)` means `if x is equal to 2` which changes based on `x`

* The value of an assignment is the *value being assigned*
  * So `if (x = 2)` means `if 2` which is *always truthy*
  * Also, the value of `x` will be 2 afterwards, no matter what it was before
  * This is bad, and almost always wrong

# Different Kinds of Equals Signs

In addition to `=` and `==`, JavaScript also has `===`.

That's three equal signs in a row.

|Operator|Operation|Example|Meaning|
|---|---|---|---|
| `=`   | assignment         | `X = Y`  | let X equal Y |
| `==`  | comparison (fuzzy) | `X == Y` | does X *mostly* equal Y? |
| `===` | comparison (exact) | `X === Y`  | does X *really* equal Y? |

`==` means "does X equal Y, or if not, can Y be *converted* into something that equals X?"

Since the rules for type conversion are confusing, most JavaScript experts recommend:

> always use `===`, never use `==`

> Using `==` can have some very interesting side effects, see [Stackoverflow](https://stackoverflow.com/questions/359494/which-equals-operator-vs-should-be-used-in-javascript-comparisons)

# Logical Conjunctions

You can make more complicated logical expressions using conjunctions:

|Conjunction|Operator|Example|Meaning|
|---|---|---|---|
| AND | `&&` | `X && Y` | "are both X and Y true?" |
| OR | <code>&#124;&#124;</code> | <code>X &#124;&#124; Y</code> | "is either X or Y (or both) true?" |
| NOT | `!`  | `!X` | "is X false?" |

For example:

```js
if (age >= 18 || hasPermissionSlip()) {
  console.log('allowed');
} else {
  console.log('denied');
}
```

[MDN: logical operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_Operators)

# LAB: Good Friend, Bad Friend

In this lab you will create a program to read input from a human user, and then make a decision about what to output as a message based on that input.

Start with a `hello.js` program that looks like this:

```js
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

function start() {
  let name = ask('What is your name?');
  console.log('Hello, ' + name + '!');
}

start();
```

* Now change `hello.js` so that it doesn't always say hello!
* If the user's name is "Darth" then say "Noooooo! That's impossible!"

# Good Friend, Bad Friend solution

<details>
<summary>Solution</summary>
<div>
<pre>
<code class="language-javascript">
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

function start() {
  let name = ask('What is your name?');
  if (name === 'Darth') {
    console.log('Noooooo! That is impossible!')
  } else {
    console.log('Hello, ' + name + '!');
  }
}

start();
</code>
</pre>
</div>
</details>

# Lab: Infinite Names

* Change `hello.js` so it keeps asking for names forever...
* ...unless and until someone says their name is "bye!"
* then it stops and exits back to the terminal

# Infinite Names solution

<details>
<summary>Solution</summary>
<div>
<pre>
<code class="language-javascript">
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

function start() {
  let name = ask('What is your name?');

  while (name !== 'bye!') {
    if (name === 'Darth') {
      console.log('Noooooo! That is impossible!')
    } else {
      console.log('Hello, ' + name + '!');
    }
  }
}

start();
</code>
</pre>
</div>
</details>

# LAB: Enemies List

* Change `hello.js` so that it says 'Go away!' if the user's name is any one of a number of evil names
* For instance, Darth Vader, Voldemort, Palpatine, Lex Luthor...
* Bonus Challenge: don't let enemies sneak in even if they spell their names with capital letters, like `VolDeMort`

# Enemies List solution

<details>
<summary>Hint</summary>
<div>
You can do multiple checks in a single if statement by using the logical "or" operator: `||`
<pre>
<code class="language-javascript">
if(checkOne || checkTwo || checkThree) {
  //this block of code runs if any of the checks are true
}
</code>
</pre>
</div>
</details>

<details>
<summary>Solution</summary>
<div>
<pre>
<code class="language-javascript">
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

function start() {
  let name = ask('What is your name?');
  let nameOne = 'Darth Vader';
  let nameTwo = 'Lex Luthor';
  let nameThree = 'Palpatine';

  while (name !== 'bye!') {
    if (nameOne || nameTwo || nameThree) {
      console.log('Noooooo! That is impossible!')
    } else {
      console.log('Hello, ' + name + '!');
    }
  }
}

start();
</code>
</pre>
</div>
</details>
