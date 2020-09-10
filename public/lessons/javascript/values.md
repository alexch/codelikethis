    topic name: "values"
    topic name: "numbers"
    topic name: "strings"
    topic name: "booleans"
    topic name: "operators"
    topic name: "return-values"

# Values

A VALUE is a location in computer memory that stores DATA.

There are many kinds of values, including String, Number, Array, Date, ... 

(The different kinds of values are called TYPES. Soon you will create your own types but for now, we will use the built-in ones.)

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
"apple"
"banana"
"Cherry Pie"
```

# Slicing and Dicing

Every string is made of lots of other strings.

You can pull out parts of a string with the `slice` method.

```js
// this means "slice from character 0 to character 4"
"blueberry".slice(0, 4) 

// this means "slice from character 4 to the end
"blueberry".slice(4)
```

These start and end numbers are called *indexes* (or *indices* if you're feeling fancy).

[MDN: slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)

# String Indexing

Humans like to start counting at 1, but computers like to start counting at 0.

Think of the indexes as pointing at the *spaces between* characters, as in this diagram:

    | B | L | U | E | B | E | R | R | Y |
    0   1   2   3   4   5   6   7   8   9
     
So with this picture in your mind, `slice`...
  
   * includes the character to the *right* of the start index
   * includes the character to the *left* of the end index...
   * ...but *excludes* the character to the *right* of the end index

Try various start and end values in the console and see what happens!

# Lab: Playing with Strings

Open up a Node instance in your terminal, and let's play around with strings!

- Add two strings together that use the same type of quotes (e.g.`'Java' + 'Script'`)
- Add two strings together using different types of quotes (e.g. `"I'm double quoted!" + 'I am single quoted.')
- Subtract two strings (e.g. `'cats' - 'dogs'`)
- Add a string to a number

What happens when you try to put quotes inside your string's quotes?

# Booleans

A **boolean** is a value that is either true or false, and is represented in JavaScript with the keywords `true`, and `false`.

(It's named after *[George Boole](https://en.wikipedia.org/wiki/George_Boole)*, 
a 19th-century mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

# Operators

Values can be combined or manipulated using **operators**, like...
 
 * PLUS (`+`)
 * TIMES (`*`)
 * POWER (`**`)
 * DOT (`.`)
 * ASSIGNMENT (`=`)
 * COMPARISON (`===`)

An operator *sends a message* to the value

  * e.g. `1 + 2` sends the number `1` the message `please add 2 to yourself`.

Dot is a special operator that *sends arbitrary messages*; we will learn more about her later.

# Comments

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

> JavaScript also has multi-line comments via `/* ... */` but those are less common. They can also be used to comment out a section within a line:  

```javascript
/* This is
 * a multiline
 * comment! */

 console.log(x /*some variable from earlier*/);
 ```

# Expression Evaluation

A snippet of JavaScript code is called an *expression*.

Whenever JavaScript encounters an expression, it tries to *evaluate* it, which means to convert it into a *value*.

A simple expression (like a plain number or a string) evaluates to just that value.

A more complicated expression with operators keeps applying those operators until it gets down to a single value. 

> You can think of evaluation as *asking and answering* a question.

```javascript
2 + 2    // Question: What is 2 + 2?
4        // Answer: 4

// Q: What is the all-caps version of the string "apple"?
"apple".toUpperCase()  
// A: the string "APPLE"
"APPLE"
```

We say that a statement **evaluates to** a value, as in
"2 plus 2 *evaluates to* 4". You can also say "the value of 2 + 2 is 4" or "the return value of 2 + 2 is 4". 

# Return Values

Sometimes the return value is the same as the original value.

```js
4 * 1    // return value: 4
```

Sometimes the return value is a different value.

```js
2 + 3    // return value: 5
```

Sometimes the return value is a different value *and* a different type.

```js
"banana".length  // return value: 6
```

Sometimes the return value is a special value!

```js
(5).length     // return value: undefined
5 / 0          // return value: Infinity
"cookie" * 10  // return value: NaN
```

# Sidebar: Expressions vs. Statements

JavaScript (like most languages derived from C) makes a distinction between *expressions* and *statements*.

*expression* means "code that can be evaluated" or "code that has a value", e.g.:

    1 + 1

*statement* means "code that does something", e.g.:

    console.log("hello");

Some statements have values, so `node` will *evaluate* them and *print* those values...

```javascript
> 1 + 1
2
```

...but *some statements have no value* (even though they contain expressions that *do* have value), and this can cause some surprising effects, e.g.:

```javascript
> x = 10
10
> let x = 20
undefined
```

# Expression vs Statement Breakdown

|Expression | Statement |
|---|---|
|has a value	| does something |
|can be assigned to a var|	has a semicolon (optionally) |
|		|		contains expressions |



Read more here: (https://medium.com/launch-school/javascript-expressions-and-statements-4d32ac9c0e74)
    
# Readings and Exercises:

* Eloquent JavaScript
    - read [Introduction](https://eloquentjavascript.net/00_intro.html) 
    - read [Values](https://eloquentjavascript.net/01_values.html)

* FreeCodeCamp [Basic JavaScript](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript) challenges
    - Start with the challenge [Comment Your JavaScript Code](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/comment-your-javascript-code)
    - Work up to the exercise [Add Two Numbers](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/add-two-numbers-with-javascript) ... and feel free to continue on if you like. 
    - You can complete these exercises with or without a FreeCodeCamp account, but if you create one your progress will be recorded.

