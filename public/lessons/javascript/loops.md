    project name: 'guess'
    topic name: "conditionals"
    topic name: "loops"
    topic name: "variables"
    topic name: "break"
    topic name: "index"

# Loops

Computers are good at doing things over and over again.

A **LOOP** is when a program does something repeatedly, until some **CONDITION** is met.

# While Loop

The simplest kind of loop is the `while` loop.

The loop below counts from one to five, followed by `Ha ha ha!` each time.

```js
let count = 1;
while (count <= 5) {
  // the code below runs once per loop cycle
  console.log('' + count + ', Ha ha ha!');
  count = count + 1;
}
```

> In English this reads, "While some condition is true, do some action".

# While True

To loop forever, set the **CONDITION** to `true`:

```js
while (true) {
  // will loop forever
  // because true is always true
  console.log('Hello');
}
```

> To stop the loop, hold down the CONTROL+C keys, <kbd>CRTL</kbd>+<kbd>C</kbd>.

# One Infinite Loop

![One Infinite Loop](https://res.cloudinary.com/btvca/image/upload/v1574445194/curriculum/one-infinite-loop_eful1h.jpg)

> Fun Fact: The address of Apple Headquarters is 1 Infinite Loop

*Wikimedia Commons, image licensed under the Creative Commons Attribution-Share Alike 3.0 Unported license. Attribution: Joe Ravi*

# Counting Forever

Write the following code in a file called, `count.js`.

Then run the program using `node count.js`.

```js
let count = 1;
while (true) {
  console.log(count);
  count = count + 1;
}
```

> Remember: <kbd>CRTL</kbd>+<kbd>C</kbd> will stop the program

# LAB: Count to One Hundred

Update `count.js` so that it counts from 1 to 100, **inclusive**.

```js
let count = 1;
while (/* count is less than or equal to 100 */) {
  console.log(count);
  count = count + 1;
}
```

# Solution: Count to 100

<details>

<summary>
Hint
</summary>

Remember, a while loop only runs while the check evaluates true
<pre>
<code class="language-javascript">
while(/*this expression is true...*/) {
  // execute this code
}
</code>
</pre>
</details>

<details>
<summary>
Solution
</summary>
<pre>
<code class="language-javascript">
let count = 1;
while (count <= 100) {
  console.log(count);
  count = count + 1;
}
</code>
</pre>
</details>

> Did your program stop at 100, 101, or 99?

# While Loops Breakdown

* A `while` statement checks the **condition** every cycle
  * **IF** *condition* evaluates to `true`, **THEN** then loop again
  * **IF** *condition* evaluates to `false`, **THEN** stop looping and proceed to the code after the loop

```js
let count = 1;
while (count <= 100) {
  console.log(count);
  count = count + 1;
}
```

# While Breakdown

1. Create a **variable** named `count` and set the value to `1`
2. Begin loop if `count` is less than `100`
3. `1` is less than `100`, so run the **body** of the loop
4. Repeat, starting from the **condition** at top of the loop

```js
let count = 1;
while (count <= 100) {
  console.log(count);
  count = count + 1;
}
```

# While Breakdown Cont

* Step 1

```js
let count = 1
```

* Step 2

```js
while (count <= 100) { ... }
```

* Step 3

```js
console.log(count);
count = count + 1;
```

* Step 4

```js
while (count <= 100) { ... }
```

# Break in a While Loop

If the program encounters the keyword `break` the loops stops.

Alternative code counting from 1 to 100 using `break` is below

```js
let count = 0;
while (true) {
  if (count > 100) {
    break;
  }

  console.log(count);
  count = count + 1;
}
```

# For Loops

A `while` loop is simple, but requires a **variable** in the **condition** or the `break` keyword.

There is another kind of loop called a `for` loop.

```js
for (let count = 1; count <= 100; count++) {
  console.log(count);
}
```

# For Loop Breakdown

The `for (...)` part of a `for` loop is where the loop:

1. Initializes a variable to track
2. Checks whether to run again
3. Updates the variable after the loop body runs.

```js
for (let count = 1; count <= 100; count++) {...}
```

# For Loop Breakdown Cont

Think about the three parts as three separate lines of code.

1. `let count = 0;` <- Initialize a variable to track

2. `count <= 100;` <- Determine whether to run again

3. `line++;` <- Update the variable after the loop body runs

# For Loop Body

The `body` of the loop is the code that runs on each time through the loop

```js
for (let count = 0; count <= 100; count++) {
  // this code will run each time we loop
  // since `count` changes each time,
  // a different number printed each cycle
  console.log(count);
}
```

> Everything inside the curly braces is the body

# LAB: One Potato

Apply what you learned about `while` and `for` loops to print a poem.

Create a file called `potato.js` that prints the following when executed by `node`.

```js
1 potato,
2 potato,
3 potato,
4!
5 potato,
6 potato,
7 potato,
More!
```

> Make sure to use a `while` or `for` loop in your solution

# Counting Potatoes Solution (pt.1)

Separate the solution into two parts.

Create a function `poemLine` does only one thing; create the correct output for a given line number.

<details>
<summary>
Solution
</summary>
<pre>
<code class="language-javascript">
function poemLine(lineNumber) {
  if (lineNumber === 8) {
      return "More!"
  } else if (lineNumber === 4) {
      return "4!"
  } else {
      return lineNumber + " potato,"
  }
}
</code>
</pre>
</details>

# Counting Potatoes Solution (pt.2)

The second part of the solution only loops, based on a counter `lineNumber`.

<details>
<summary>
Solution
</summary>
<pre>
<code class="language-javascript">
function poemLine(lineNumber) {
  if (lineNumber === 8) {
      return "More!"
  } else if (lineNumber === 4) {
      return "4!"
  } else {
      return lineNumber + " potato,"
  }
}

// New Code Below

let lineNumber = 1;

while (lineNumber <= 8) {
  console.log(poemLine(lineNumber));
  lineNumber = lineNumber + 1;
}
</code>
</pre>
</details>

# Counting Potatoes, alternative with `break`

Another solution using the `break` to stop looping after eight cycles.

<details>
<summary>Solution</summary>
<pre>
<code class="language-javascript">
function poemLine(lineNumber) {
  if (lineNumber === 8) {
      return "More!"
  } else if (lineNumber === 4) {
      return "4!"
  } else {
      return lineNumber + " potato,"
  }
}

// New Code Below

let lineNumber = 1;

while (true) {
  console.log(poemLine(lineNumber));
  lineNumber = lineNumber + 1;
  if (lineNumber > 8) {
      break;
  }
}
</code>
</pre>
</details>
