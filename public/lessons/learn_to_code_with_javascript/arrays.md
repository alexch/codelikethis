    topic name: "arrays"
    topic name: "values"
    topic name: "index"
    topic name: "methods"
    topic name: "loops"
    topic name: "refactoring"

# Arrays

* An ARRAY is a CONTAINER
  * an object that contains other objects
* It's a list of objects

# What makes an array an array

* You can put any values inside it
* In any order
* They stay in order (unless you move them later)
* Duplicates are fine

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

# LAB: Array Indexes Exercise

Try this in node:

```js
let fruits = ["apple", "banana", "cherry"]
fruits[1]
```

Did you get the result you expected?

Why or why not?

# Start At Zero

When counting,

humans start at one,

but **computers start at zero**.

So the first item in an array is number zero, not number one.

# Length

Every array has a *property* named `length`

```js
let fruits = ["apple", "banana", "cherry"]
fruits.length //=> 3
```

Q: How can you get the last item in an array... even if you don't know its index beforehand?

# The End

```js
let fruits = ["apple", "banana", "cherry"]
fruits[fruits.length - 1]
```

# After The End

Try this:

```js
fruits[99]
```

Did you get the result you expected?

Why or why not?

# Undefined means 🤷

by returning *undefined*, the computer is answering the question

> "What is the 99th item?"

with the answer

> "There is no 99th item."

# Array Methods

[MDN: Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Methods_2) lists the array API interface -- containing all the methods and properties that are common to all array values. 

There are many methods here and you should not try to memorize them all. But skim them and remember how to get back to this documentation page later.

# Adding values to an array

* **push** adds a single value to the end of an array

```javascript
let fruits = ["apple", "banana", "cherry"]
fruits.push("pineapple")
fruits //=> ["apple", "banana", "cherry", "pineapple"]
```

* **push** can also add several values at once

```javascript
fruits.push("nectarine", "strawberry")
fruits //=> ["apple", "banana", "cherry", "pineapple", "nectarine", "strawberry"]
````

# Yarra Lasrever

```js
let fruits = ["apple", "banana", "cherry"]
fruits.reverse()
```

Try this now in a console. Do you see what you expect?

# Array to String

There are a few easy ways to turn an array into a string.

```js
fruits.join()           // 'apple,banana,cherry'
fruits.join(" and ")    // 'apple and banana and cherry'
fruits.toString()       // 'apple,banana,cherry'
fruits.toSource()       // [ 'apple', 'banana', 'cherry' ]
```

Note that `console.log` uses `toSource()`, which is usually better for debugging than `toString`...

...but the `toSource` method only works in web browsers, not in NodeJS, at least not by default :-(

# String to Array

You can also easily turn a string into an array.

```javascript
'dog'.split('') //=> ['d', 'o', 'g']
'my dog has fleas'.split(' ') //=> [ 'my', 'dog', 'has', 'fleas' ]
```

# Loops and Iterators

There are many ways to "iterate" through an array.

This means to go through the entire array, one item at a time, usually in order, and then *do something* with each individual item.

In the next slides we will illustrate 3 different ways to iterate... one way is explicit, one way is concise, and one way is fancy.

# Explicit: Looping through an array with for

JavaScript inherited `for(;;)` from C; it's cumbersome but you should learn to recognize it. 

```js
for (let i=0; i < fruits.length; i++) {
  console.log(fruits[i]);
}
```

|phrase|meaning|
|---|---|
| `for`                    | in a loop, |
| `let i`                  | make an *index* variable named `i` |
| `i=0`                    | and initially set it to `0` |
| `i < fruits.length`      | then, as long as `i` is less than the number of `fruits` |
| `{` ... `}`              | execute this block of code |
| `console.log(fruits[i])` | print the `i`th element of the `fruits` array |
| `i++`                    | and then *increment* `i` before the next time through |

# Concise: Looping through an array with for-of

Recently, JavaScript added `for..of`, which hides the messy details of incrementing an index counter and accessing each array item.

```js
for (let fruit of fruits) {
  console.log("I like " + fruit + "!")
}
```

|phrase|meaning|
|---|---|
| `for`                    | in a loop, |
| `of fruits`              | take each thing inside `fruits` |
| `let fruit`              | name it `fruit` |
| `{` ... `}`              | and send it to this block of code |

# Fancy: Looping through an array with forEach

`forEach` is an [iteration method](./iteration_methods) that behaves a lot like `for..of` but in a *[functional style](../javascript/hybrid)* :

```js
fruits.forEach( (fruit) => {
  console.log("I like " + fruit + "!")
});
```

|phrase|meaning|
|---|---|
| `fruits.forEach(`...`)`  | hey `fruits`, for each thing inside you, |
| `(fruit)`                | please name it `fruit` |
| ` => `                   | and send it to |
| `{` ... `}`              | this block of code |
| `console.log(fruit)`     | so I can print it to the terminal |
 
[MDN: Array.forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)

# LAB: loud backwards fruit

Given this array:

```js
let fruits = ["apple", "banana", "cherry"]
```

write a program that prints:

    CHERRY
    BANANA
    APPLE

# Setting items in an array

The `[]` operator works for assignment as well.

`fruits[0] = 'apricot'` will set the `0`th item of the array to the string `'apricot'`

# Checking every item in an array

The `includes` method checks if a given value is inside an array (or not).

```js
fruits.includes("apple")   // true

fruits.includes("pizza")   // false
```

Remember, here we are sending a message *to an array*, asking if it includes a certain *string*.

# LAB: enemies list refactoring

Refactoring is changing existing code so that it *works* the same, but is cleaner and easier to read.

In your old `hello.js` program you had an `if` statement to check if someone is your enemy. Something like:

```js
if (name === "darth" || name === "voldemort" || name === "sauron")
```

Please take a few minutes to **refactor** your old `hello.js` program to use arrays to check if someone is your enemy. Is it possible to make that `if` statement more concise?

# LAB: more about arrays

* [Eloquent JavaScript Chapter 4](http://eloquentjavascript.net/04_data.html): Data Structures: Objects and Arrays
