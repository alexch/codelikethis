# Values

A **value** is a location in computer memory that stores DATA.

There are many kinds of values, including String, Number, Array, Date, ...

Different kinds of values are called **types**.

We will be focusing on the most common types in this course

---

# Numbers

A **number** is what it sounds like -- any integer or decimal.

```js
10
-12
3.14
```

---

# Strings

A **string** is an object that's a collection of characters, like a word or a sentence.

```js
"apple"
"banana"
"Cherry Pie"
```

---

# Booleans

A **boolean** is a value that is either `true` or `false`.

(It's named after *[George Boole](https://en.wikipedia.org/wiki/George_Boole)*,
a 19th-century mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

---

# Comments - Single Line

When reading JavaScript code, if you ever see two slashes in a row, that means "everything after these slashes is a comment".

```javascript
2 + 2    // makes four
```

A comment is a message for humans. JavaScript ignores everything to the right of the slashes, so you can explain what the nearby code does, or why it does it.

In these lessons, we often use comments to explain the *result* of executing the nearby code. In this case, we sometimes add an arrow to the comment:

```javascript
2 + 2  //=> 4
3 + 5 // -> 8
```

---

# Comments - Multi Line

JavaScript also has multi-line comments via `/* I am a comment */`

They can be used to comment out a section within a line, or many lines

```javascript
let x = 42;

/*
  This is
  a multiline
  comment!
*/

console.log(x /* the value from earlier */);
// => 42
```

---

# Operators

Values can be combined or manipulated using **operators**, like...

 * PLUS (`+`)
 * TIMES (`*`)
 * MINUS (`-`)
 * POWER (`**`)
 * MODULUS (`%`)
 * EQUALS (`=`)
 * INCREMENT (`++`)
 * DECREMENT (`--`)
 * COMMA (`,`)
 * DOT (`.`)

[All JavaScript Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators "All JavaScript Operators")

An operator sends a *message* to the value

  * e.g. `1 + 2` sends the number `1` the message `please add 2 to yourself`.

Dot is a special operator that *sends arbitrary messages*; we will learn more about her later.

---

# LAB: Number Games

We can use numbers and operators together to do math

Use the *node* program to the answers to the following

- What does 42 x 42 x 42 equal?
- What does 65536 divided by 1024 equal?
- What is the **remainder** integer of 123456789 divided by 35?

# Variables

* A **variable** is a **name** for a value.
* You give a value a name using the **assignment** operator
    * It looks like an equal sign but is *not* a comparison.
    * Often preceded by `let` as in "Let there be light" or "Let X equal 10".

```js
let color = "blue"
let fruit = "berry"
```

* Anywhere you would use a literal value, you can use a variable instead.

```js
color + fruit      // "blueberry"
'black' + fruit    // "blackberry"

color = 'pink'
color + fruit      // "pinkberry"
```

* This means you should pick helpful names

---

# LAB: Strings with Whitespace

```javascript
let fruit = 'pineapple'
let food = 'smoothie'
```

How could you use the above variables to get the following?

```js
pineapple smoothie
```

**^^^ Note that there is a space between the strings ^^^**

---

# The Warehouse Metaphor

Think of memory as a giant warehouse.

![Warehouse from Raiders of the Lost Ark](/images/warehouse.jpg)

Like this warehouse from the movie Raiders of the Lost Ark,
computer memory is vast and filled with boxes of various sizes.

---

# The Warehouse Metaphor Explained

If memory is a giant warehouse...

...and memory locations are **boxes** in that warehouse

...then a *value* is the **contents** of a box

...and a *variable* is a **label** you stick on the outside of the box

---

# Let there be confusion

* `let` is just one way to declare a variable in JavaScript
* `var` is a lot like `let` but has wider *scope* which is sometimes bad
* `const` has similar scope to `let` but won't allow you to reasign the value
* If you don't use either `let`, `var`, or `const` then the variable becomes *global* (which is dangerous)
* Lesson: *always use let or const* unless you have a good reason not to

---

# Don't let me down

Unfortunately, in JavaScript you can only use `let` once per variable name in a given *scope*, otherwise you will receive an error like this:

```js
Identifier 'x' has already been declared
```

That means that when you're in the JavaScript console, if you see this error then try again without the `let`

```js
> let x = 1
undefined
> let x = x + 2
SyntaxError: Identifier 'x' has already been declared
> x = x + 2
3
```

---

# String Literals

* *"literal"* means "exactly as it is written"
* a *string literal* is a string whose characters are spelled out explicitly in your code
* JavaScript string literals are surrounded with either:
  * single quotes (`'`)
  * or double quotes (`"`)
* You can use the alternate quote within another, for example:

```js
"He said 'My dog has fleas.' yesterday"
'Vermonters have a hundred words for "snow".'
```

---

# String Escapes

* some characters can't be typed literally, so you need to use *string escapes*
* backslash (<kbd>\\</kbd>) is the *escape character* in JavaScript strings
* backslash means "the next character means something special"
  * for instance backslash-n (`\n`) means "newline"

```js
console.log("Roses are red,\nViolets are blue;\nCandy is sweet,\nAnd so are you.")
```

---

# String Messages

A string understands lots of messages. Here are a few:

```js
"drive" + "way"
'Java' + "Script"

"Bert's pal Ernie" + ' sings "Rubber Duckie"'

"titanic".toUpperCase()
"QUIETLY".toLowerCase()

"Java".repeat(10)

"banana".length

"berry".charAt(1)
"berry".charAt(0)
"apple"[3]

"banana".includes("nan")
"banana".endsWith("ana")

"blueberry".replace("blue", "black")
```

Try all of these out in `node` or the browser console!

Check out [MDN String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) docs for more.

---

# Slicing and Dicing

Every string is made of lots of other strings.

You can pull out parts of a string with the `slice` message.

```js
// this means "slice from character 0 to character 4"
"blueberry".slice(0, 4)

// this means "slice from character 4 to the end
"blueberry".slice(4)
```

These start and end numbers are called *indexes* (or *indices* if you're feeling fancy).

[MDN: slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)

---

# String Indexing Explained

Humans like to start counting at 1, but computers like to start counting at 0.

This can be confusing, so here's a visualization to help explain it.

Think of the indexes as pointing at the *spaces between* characters, as in this diagram:

    | B | L | U | E | B | E | R | R | Y |
    0   1   2   3   4   5   6   7   8   9

So with this picture in your mind, `slice`...

   * includes the character to the *right* of the start index
   * includes the character to the *left* of the end index...
   * ...but *excludes* the character to the *right* of the end index

Try various start and end values in the console and see what happens!

---

# LAB: Cut the Cream

How could you take the following string `"banana cream pie"` and assign a variable to `"cream"` ?

```javascript
// starting string
let favoritePie = 'banana cream pie';

// variable to assign to "cream"
let withExtra = favoritePie.slice(/* What goes here? */);
```

---

# Number

* JavaScript has a built-in type called `Number`.
* It represents decimal numbers, aka *floating-point* decimals.
* JavaScript does not have a special type for integers, unlike most other languages.
* The maximum **safe** Number is `2**53 - 1`

[MDN Docs for Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)

---

# Order of operations

Q: What is 1 plus 2 times 3?

A: *It depends!*

```js
(1 + 2) * 3 == 9
1 + (2 * 3) == 7
```

---

# Parentheses Are Free

> When in doubt, use parentheses!

(or, when there's any doubt, make your assumptions explicit)

---

# LAB: one nation, divisible

One number is *divisible* by another if you divide them and the *remainder* is 0.

Write code in `node` to figure out if...

  * 100 is divisible by 5
  * 100 is divisible by 8
  * 330 is divisible by 11
  * 337 is divisible by 7

---

# Strings vs. Numbers

Hmmm....

    1 + 2
    "1" + "2"
    "1 + 2"

---

# Strings plus Numbers

Hmmm again...

    "1" + 2

Even though Strings and Numbers are different TYPES, JavaScript converts one to the other.

But when two types meet, which one wins?

---

# Type Conversion

The clearest answer is that you, the programmer, explicitly declare which type you want to win.

---

# Converting a Number to a String

```js
(12).toString() // "12"
```

---

# Converting a String to a Number

There are [many ways to convert a string to a number in JavaScript](https://coderwall.com/p/5tlhmw/converting-strings-to-number-in-javascript-pitfalls).

The easiest and cleanest is `unary +`:

| expression | value |
|------------|-------|
| +"12"      |    12 |
| +"012"     |    12 |
| +"0.2"     |   0.2 |
| +"cheese"  |   NaN |
| +"0"       |     0 |
| +""        |     0 |
| +" "       |     0 |

(Other ways can give bizarre results if the string contains letters or begins with a 0.)

---

# Converting a String to a Numer - ParseInt

There are two other common methods to convert strings to numbers which are shown below

```javascript
// Converts strings to integers
parseInt("42") // => 42

// Converts strings to floating point numbers
parseFloat("3.1418") // => 3.1418
```

---

# Type Coercion

If you don't explicitly do *type conversion* then JavaScript will "helpfully" convert the types for you.

This is called type *coercion* and just like with people, coercion is stressful and often backfires.

For instance, if you ask the user their age, and read it from a web form or keyboard input, it will be in a string. If you forget to explicitly convert that to a number before using it in a calculation, the results can be unexpected...

      > "30" - 1              // "30" is coerced into a number
      29
      > "30" + 1              // 1 is coerced into a string
      '301'

([You Don't Know JS](https://github.com/getify/You-Dont-Know-JS/blob/master/types%20%26%20grammar/ch4.md) has way more information than you wanted to know on this subject.)

---

# Randomize it!

[Math.random](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) is your way to make things unpredictable!

Calling `Math.random()` returns a random *decimal* number between 0 and 1.

If you want a random *integer* you can multiply that decimal by a range, like this:

```js
function randomInteger(min, max) {
  let range = max - min + 1;
  return min + Math.floor(Math.random() * range);
}

console.log(randomInteger(1, 3));
```

---

# Arrays

* An ARRAY is a CONTAINER
  * an object that contains other objects
* It's a list of objects

---

# What makes an array an array

* You can put any values inside it
* In any order
* They stay in order (unless you move them later)
* Duplicates are fine

---

# Creating an array

```js
["apple", "banana", "cherry"]
```

square brackets on their own mean "please go *create* an array now"

and put these 3 other values inside it

# Array Indexes

* Every slot in the array has a serial number
* You can retrieve any item in an array by its INDEX
* Square brackets after an array mean "the whatever-th item in this array"
* The following code retrieves one fruit

```javascript
let fruits = ["apple", "banana", "cherry"];
fruits[1]
```

...but which fruit? See next slide!

---

# LAB: Array Indexes Exercise

Try this in node:

```js
let fruits = ["apple", "banana", "cherry"]
fruits[1]
```

Did you get the result you expected?

Why or why not?

---

# Start At Zero

When counting,

humans start at one,

but **computers start at zero**.

So the first item in an array is number zero, not number one.

---

# Length

All arrays have a special *property* named `length`

What do you think it does?

```js
let fruits = ["apple", "banana", "cherry"]
fruits.length //=> 3
```

Question: How can you get the last item in an array... even if you don't know its index beforehand?

---

# The End

Answer: Use the Array's length proprty within the indexing

```js
let fruits = ["apple", "banana", "cherry"]
fruits[fruits.length - 1]
```

---

# After The End

Try this:

```js
fruits[99]
```

Did you get the result you expected?

Why or why not?

---

# Undefined means 🤷

by returning *undefined*, the computer is answering the question

> "What is the 99th item?"

with the answer

> "There is no 99th item."

---
