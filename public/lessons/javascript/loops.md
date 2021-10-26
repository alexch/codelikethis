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

The simplest loop in JavaScript is a `while` loop.

```js
while (someCondition) {
  // this code runs once per loop cycle
  doSomeAction()
}
```

In English this reads, "While some condition is true, do some action".

# while true

To loop forever, set the condition to `true`:

```js
while (true) {
  // this will loop forever
  // because `true` never changes
  console.log("Hello");
}
```

This means "While `true` is `true`, say 'Hello'".

`true` will always be true, so it loops forever.

To stop the loop, hold down the CONTROL key and press the C key, <kbd>CRTL</kbd>+<kbd>C</kbd>.

This is called an *infinite loop*.

# One Infinite Loop

![One Infinite Loop](https://res.cloudinary.com/btvca/image/upload/v1574445194/curriculum/one-infinite-loop_eful1h.jpg)

*Fun Fact:* The address of Apple Headquarters is

    1 Infinite Loop
    Cupertino, CA 95014

*Wikimedia Commons, image licensed under the Creative Commons Attribution-Share Alike 3.0 Unported license. Attribution: Joe Ravi*

# Counting Forever

Let's write a program that counts forever. 

Put this in a file called `count.js`.

```js
let count = 1;
while (true) {
  console.log(count);
  count = count + 1;
}
```

Run the program with `node count.js`.

> Remember to <kbd>CRTL</kbd>+<kbd>C</kbd> to stop the program

# LAB: Count to One Hundred

Next, change your `count.js` program so that it count 1 to 100.

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
    // ...do this action
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

Did your program stop at 100, 101, or 99?

# While Loops

* The `while` statement keeps checking the test expression

  * if it's `true` then it loops back
  * if it's `false` then it stops looping and goes on to the rest of the program

This is fairly complicated, so let's stop here and make sure to understand everything that's happening in this little program.

# While breakdown (pt.1)

    let count = 1

creates a *variable* named `count` and sets its value to `1`.

    while (count <= 100)

starts a loop and immediately compares `count` to `100`.

`1` is less than `100`, so the expression is `true`, so we continue with the block of code starting with the `{`.

# While breakdown (pt.2)

      console.log(count);

prints the current value of count.

      count = count + 1

*increments* the `count` variable... it was `1`, so now it's `2`

    }

goes *back to the `while` line* and checks again

# While breakdown (pt.3)

    while (count <= 100)

compares `count` to `100`.

`2` is less than `100`, so the expression is `true`, so we continue with the loop.

Eventually, `count` becomes `101`, and the `while` expression is `false`, and so we stop looping and go on.

# Break in a While Loop

The magic word `break` stops looping immediately.

Here is another way to count to 100, but this time using `break`:

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

# For Loops

The `while` loop is simple, but there is another loop called a `for` loop that combines multiple operations within the `for` statement.

```js
for (let count = 1; count <= 100; count++) {
  console.log(count);
}
```


# For Loops with Arrays

A `for` loop is often seen paired with an indexed data structure known as an Array

```js
let poemLines = [
  'Roses are red', 
  'Violets are blue', 
  'Honey is sweet',
  'And so are you'
];

for (let line = 0; line < poemLines.length; line++) {
  console.log(poemLines(line));
}
```

[JavaScript.info Guide for Arrays](https://javascript.info/array)

[MDN Guide for Arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Indexed_collections)


# For Loop Breakdown (pt.1)

We are using the for loop to get each item in the Array collection `poemLines`

```
let poemLines = [
  'Roses are red', 
  'Violets are blue', 
  'Honey is sweet',
  'And so are you'
];
```

# For Loop Breakdown (pt.2)

The `for (...) ` part of a `for` loop is where the loop:

1. Initializes a variable to track
2. Determines whether to run again
3. Changes the variable after the loop runs.

```js
for (let line = 0; line < poemLines.length; line++)
```

# For Loop Breakdown (pt.3)

Think about the three parts as three separate lines of code.

1. Initialize a variable to track

```js
let line = 0;
```

2. Determine whether to run again

```js
line < poemLines.length;
```

3. Change the variable after the loop runs

```js
line++;
```

# For Loop Breakdown (pt.4)

The `body` of the loop is the code that runs on each time through the loop

```js
for (let line = 0; line < poemLines.length; line++) 
/* everything inside the curly braces is the body */
{
  // this code will run each time we loop
  // since `index` changes each time,
  // a different poem line is printed each cycle
  console.log(poemLines(line));
}
```

# LAB: One Potato

Now let's apply what we have learned about `while` and `for` loops to print a poem in JavaScript.

Remember this poem?

    1 potato,
    2 potato,
    3 potato,
    4!
    5 potato,
    6 potato,
    7 potato,
    More!

Please write a program called `potato.js` that prints that poem, using loops.

(No, you can't just print the entire poem as a single string; that would be cheating.)

# Counting Potatoes Solution (pt.1)

Let's separate the solution into two parts.

Create a function `poemLine` does only one thing; create the correct string for a given line number.

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
