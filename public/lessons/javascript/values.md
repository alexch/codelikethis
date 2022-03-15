    topic name: "values"
    topic name: "numbers"
    topic name: "strings"
    topic name: "booleans"
    topic name: "operators"
    topic name: "return-values"

# Values

A VALUE is a location in computer memory that stores DATA.

There are many kinds of values, including String, Number, Array, Object, and more.

> The different kinds of values are called TYPES

# Numbers

A **number** is what it sounds like -- any integer or decimal.

```js
10
-12
3.14
```

# Lab: Playing with Numbers

Open up a node environment in your terminal (`node` <kbd>Enter</kbd>). Once you're in the node environment you should be able to write javascript, and run it inside your terminal. Try out the following equations:

- Add two numbers together with the `+` operator
- Multiply two numbers with the `*` operator
- Divide two numbers using the `/` operator
- Square a number by raising it to the power of 2 `**2`
- Create a more complex mathematical equation. Useing amixture of different operators
- Bonus: Weird math! Try the following equations:
  - `0.1 + 0.2`, `2**53` and `2**53 + 1`, and `Infinity - Infinity`

What have you noticed about math in JavaScript

# Strings

A **string** is an object that's a collection of characters, like a word or a sentence.

```js
'apple'
'banana'
'Cherry Pie'
```

# String Slicing

You can extract sub-parts of a string using `slice`

```js
// "slice from character 0 to character 4"
"blueberry".slice(0, 4) 

// "slice from character 4 to the end
"blueberry".slice(4)
```

The first number is which character to start from.

The second number is which character to end on.

[MDN: slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)

# String Indexing

Indexes are the positions of characters within a String.

```txt
| B | L | U | E | B | E | R | R | Y |
0   1   2   3   4   5   6   7   8   9
```

Then `'blueberry'.slice(0, 4)`
  
- Includes the characters to the **right** of the start index
- Includes the characters to the **left** of the end index
- And **excludes** the character to the **right** of the end index

> Experiment with different start and end values in the console.

# Lab: Playing with Strings

Either open a terminal, and run `node`, or create a new JavaScript file in a text editor.

Complete the following challenges

- Add two strings together with the same type of quotes

e.g. `'Java' + 'Script'`

- Add two strings together with different types of quotes

e.g. `"I'm double quoted!" + 'I am single quoted.'`

- Subtract two strings

e.g. `'cats' - 'dogs'`

- Add a string to a number

- Try to put more quotes inside your a string's quotes?

# Booleans

A **Boolean** is a value that is either TRUE or FALSE, and are represented with the values `true` and `false`

> Created by [George Boole](https://en.wikipedia.org/wiki/George_Boole), a  mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

# Booleans and Conditionals

A conditional starts with the keyword `if` followed by a test in parentheses `if (10 > 5)`, followed by a block of code defined by curly braces which runs if the check evaluates to `true`.

# Lab: Is it True?

Given the conditional answer the following questions.

```js
if (someValueHere) {
  console.log('It is truthy');
}
```

- Is the boolean `true` truthy?
  - how about `false`?
- Try replacing `true` with a string
  - Is it truthy?
- Try replacing `true` with a number
  - Is it true?
  - What about the number `0`?
- Try replacing `true` with the expression `1 < 2`
  - What happens if you switch the operator like so `1 > 2`?

# Operators

Values can be combined or manipulated using **operators**

- PLUS (`+`)
- TIMES (`*`)
- POWER (`**`)
- DOT (`.`)
- ASSIGNMENT (`=`)
- COMPARISON (`===`)

An operator **sends a message** to the value

- e.g. `1 + 2` sends the number `1` the message `please add 2 to yourself`.

The DOT operator `.`, is a special operator that can **send any message**

# Comments

Two slashes in a row means **everything after these slashes is a comment**.

```js
2 + 2 // returns 4
```

JavaScript ignores everything to the right of the comment

Allowing for an explanation of what the nearby code does, or why it does it.

```js
(2 + 2) * 3 // first add, then muliply
```

```js
/* 
This is a
multi-line
comment
*/
console.log(x /*some variable from earlier*/);
```

# Expression Evaluation

Code that results in a value is called an **EXPRESSION**

When JavaScript encounters an expression, it **evaluates** it. Evaluates means, to convert to a value.

Complex expressions with values and operators apply the operators until it results in a single value.

```js
2 + 2 * 3 // Question: What is 2 + 2 * 3?
          // Answer: 8
```

```js
// Question: What is the uppercase version of 'apple'?
'apple'.toUpperCase()  
// Answer: "APPLE"
```

# Return Values

Evaluating an expression **RETURNS** a value

This value can be assigned to a variable, or used in another way.

```js
let product = 4 * 4; // product is 16
```
