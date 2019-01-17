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

# Messages and Operators

<!-- todo: rewrite this replacing "messages" since not all JS statements are messages -->

All values respond to **messages**. 

You send messages using **operators**, like PLUS (`+`) and TIMES (`*`) and DOT (`.`)

(Dot is a special operator; we will learn more about her later.)

# Return Values

Every time a value receives a message, it returns a response.

You can think of it as the answer to a question. 

```js
2 + 2    // Question: What is 2 + 2?
4        // Answer: 4

// Q: What is the all-caps version of the string "apple"?
"apple".toUpperCase()  
// A: the string "APPLE"
"APPLE"
```

The response is often called the **return value**; 
you can also say that a statement **evaluates to** a value, as in
"2 plus 2 evaluates to 4".

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
(5).shape      // return value: undefined
5 / 0          // return value: Infinity
"cookie" * 10  // return value: NaN
```

# LAB: Values: readings and exercises

* Eloquent JavaScript
    - read [Introduction](https://eloquentjavascript.net/00_intro.html) 
    - read [Values](https://eloquentjavascript.net/01_values.html)

* FreeCodeCamp [Basic JavaScript](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript) challenges
    - Start with the challenge [Comment Your JavaScript Code](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/comment-your-javascript-code)
    - Work up to the exercise [Add Two Numbers](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/add-two-numbers-with-javascript) ... and feel free to continue on if you like. 
    - You can complete these exercises with or without a FreeCodeCamp account, but if you create one your progress will be recorded.

