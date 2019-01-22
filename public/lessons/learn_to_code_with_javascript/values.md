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

# Strings

A **string** is an object that's a collection of characters, like a word or a sentence.

```js
"apple"
"banana"
"Cherry Pie"
```

# Booleans

A **boolean** is a value that is either `true` or `false`.

(It's named after *[George Boole](https://en.wikipedia.org/wiki/George_Boole)*, 
a 19th-century mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

# Operators

Values can be combined or manipulated using **operators**, like...
 
 * PLUS (`+`)
 * TIMES (`*`)
 * POWER (`**`)
 * DOT (`.`)

An operator *sends a message* to the value

  * e.g. `1 + 2` sends the number `1` the message `please add 2 to yourself`.

Dot is a special operator that *sends arbitrary messages*; we will learn more about her later.

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

# Return Values (cont.)

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

Sometimes the return value is a magic value!

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

Read more here: (https://medium.com/launch-school/javascript-expressions-and-statements-4d32ac9c0e74)
    
# LAB: Values: readings and exercises

* Eloquent JavaScript
    - read [Introduction](https://eloquentjavascript.net/00_intro.html) 
    - read [Values](https://eloquentjavascript.net/01_values.html)

* FreeCodeCamp [Basic JavaScript](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript) challenges
    - Start with the challenge [Comment Your JavaScript Code](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/comment-your-javascript-code)
    - Work up to the exercise [Add Two Numbers](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/add-two-numbers-with-javascript) ... and feel free to continue on if you like. 
    - You can complete these exercises with or without a FreeCodeCamp account, but if you create one your progress will be recorded.

