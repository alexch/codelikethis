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

* Every slot in the array has an index
* You can retrieve any item in an array by its INDEX
* Square brackets after an array mean "the whatever-th item in this array"
  * This method of accessing items is referred to as "square bracket notation"
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

# Undefined Means 🤷

by returning *undefined*, the computer is answering the question

> "What is the 99th item?"

with the answer

> "There is no 99th item."

# Array Methods

[MDN: Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Methods_2) lists the array API interface -- containing all the methods and properties that are common to all array values. 

There are many methods here and you should not try to memorize them all. But skim them and remember how to get back to this documentation page later.

# Adding Values to an Array

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

# Slicing and Dicing

you can `slice` an array to cut it into smaller arrays

```js
let fruits = ['apple', 'banana', 'cherry', 'date', 'elderberry']

// this means "slice from item 1 to item 3"
fruits.slice(1, 3) //=> [ 'banana', 'cherry' ]

// this means "slice from item 2 to the end"
fruits.slice(2) //=> [ 'cherry', 'date', 'elderberry' ]
```

These start and end numbers are called *indexes* (or *indices* if you're feeling fancy).

[MDN: slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice)

# Array Indexing Explained

Humans like to start counting at 1, but computers like to start counting at 0.

This can be confusing, so here's a visualization to help explain it.

Think of the indexes as pointing at the *spaces between* items, as in this diagram:

    ['B', 'L', 'U', 'E']

    | B | L | U | E |
    0   1   2   3   4

So with this picture in your mind, imagine that `slice`...

   * includes the item to the *right* of the start index
   * includes the item to the *left* of the end index...
   * ...but *excludes* the item to the *right* of the end index

```javascript
['B', 'L', 'U', 'E'].slice(1, 3) //=> [ 'L', 'U' ]
```

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

# Explicit: Looping Through an Array with for

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

# Looping Through an Array with for-of

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

# Looping Through an Array with forEach

`forEach` is an [iteration method](/lessons/javascript-track/iteration_methods) that behaves a lot like `for..of` but in a *[functional style](hybrid-styles)* :

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

# LAB: Loud Backwards Fruit

Given this array:

```js
let fruits = ["apple", "banana", "cherry"]
```

write a program that prints:

    CHERRY
    BANANA
    APPLE

# Setting Items in an Array

The `[]` operator works for assignment as well.

`fruits[0] = 'apricot'` will set the `0`th item of the array to the string `'apricot'`

# Checking Every Item in an Array

The `includes` method checks if a given value is inside an array (or not).

```js
fruits.includes("apple")   // true

fruits.includes("pizza")   // false
```

Remember, here we are sending a message *to an array*, asking if it includes a certain *string*.

# LAB: Enemies List Refactoring

Refactoring is changing existing code so that it *works* the same, but is cleaner and easier to read.

In your old `hello.js` program you had an `if` statement to check if someone is your enemy. Something like:

```js
if (name === "darth" || name === "voldemort" || name === "sauron")
```

Please take a few minutes to **refactor** your old `hello.js` program to use arrays to check if someone is your enemy.
* Put the list of enemies in an array
* How can you use array methods to check if a name is in the enemies list?
* BEWARE: your new code might need more curly braces than the old code; make sure the `{`s and `}`s properly match

# Enemies List solution

<details>
<summary>Solution</summary>
<div>

```js
let enemiesArray = ["Darth", "Voldemort", "Sauron"]

console.log("What is your name?");
process.stdin.on('data', (chunk) => {
    let name = chunk.toString().trim();
    if (enemiesArray.includes(name)) {
      console.log("NOOOOOO! Go away " + name + "!")
    } else {
      console.log("Hello, " + name + "!");
    }
});
```

</div>
</details>

# More About Arrays

* [Eloquent JavaScript Chapter 4](http://eloquentjavascript.net/04_data.html): Data Structures: Objects and Arrays
