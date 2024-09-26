    topic name: "arrays"
    topic name: "values"
    topic name: "index"
    topic name: "methods"
    topic name: "loops"
    topic name: "refactoring"

# Arrays

* An ARRAY is a CONTAINER for values
* It is an object that contains other objects
* It resembles an ordered list

# What makes an Array an Array?

* You can put any values inside it
* In any order
* They will stay in order, unless you move them later
* Duplicate values are allowed

# Creating an array

```js
let fruits = ['apple', 'banana', 'cherry'];
```

Square brackets around values mean, "please go create an array"

And put these three values inside of it

# Arrays are Indexed

* Every "slot" in the array has an INDEX
* You can retrieve any item in an array by its INDEX
* Square brackets after an array mean "get the N-th item in this array"
  * This method of accessing items is referred to as "square bracket notation"
* The following code retrieves one fruit

```javascript
let fruits = ['apple', 'banana', 'cherry'];
fruits[1]
```

> But which fruit is `fruits[1]` ?

# LAB: Array Indexes Exercise

Try this in an interactive `node` shell:

```js
let fruits = ['apple', 'banana', 'cherry'];
// which fruit is this?
fruits[1]
```

Did you get the result you expected?

# Arrays Start at Zero

When counting, humans start at one, but **computers start at zero**.

So the first item in an array is number **zero**, not number **one**.

# Array Length

Every Array has a **property** named `length`

```js
let fruits = ['apple', 'banana', 'cherry'];
// what is the length of the fruit Array?
fruits.length
```

> How can you get the last item in an array, even if you don't know its index beforehand?

# The End

```js
let fruits = ['apple', 'banana', 'cherry'];
// which fruit is last?
fruits[fruits.length - 1]
```

# After The End

Try this:

```js
let fruits = ['apple', 'banana', 'cherry'];
// which value is at index 99?
fruits[99]
```

Did you get the result you expected?

Why or why not?

# Undefined Means 🤷 "unknown"

by returning *undefined*, the computer is answering the question

> "What is the 99th item?"

with the answer

> "There is no 99th item."

# Array Methods

[MDN: Array Methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#instance_methods) lists the Array API interface. Containing all the methods and properties that are common to all array values. 

There are many methods there and you should NOT try to **memorize** them all, just skim them and remember how to get back to this documentation page later.

# Adding Values to an Array 1

* The `.push` method adds a single value to the end of an array

```javascript
let fruits = ['apple', 'banana', 'cherry'];
fruits.push('pineapple')
fruits //=> ['apple', 'banana', 'cherry', 'pineapple']
```

# Adding Values to an Array 2

* The `.push` method can also add several values at once

```javascript
let fruits = ['apple', 'banana', 'cherry'];
fruits.push('nectarine', 'strawberry')
fruits //=> ['apple', 'banana', 'cherry', 'nectarine', 'strawberry]
```

# Array Reverse

```js
let fruits = ['apple', 'banana', 'cherry'];
fruits.reverse()
fruits //=> ['cherry', 'banana', 'apple']
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

These start and end numbers are *indexes*

The `.slice()` function can accept **one** or **two** arguments

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
['B', 'L', 'U', 'E'].slice(1, 3); //=> [ 'L', 'U' ]
```

# Array to String

There are a few easy ways to turn an array into a string.

```js
fruits.join();        //=> 'apple,banana,cherry'
fruits.join(" and "); //=> 'apple and banana and cherry'
fruits.join("-");     //=> 'apple-banana-cherry'
fruits.toString();    //=> 'apple,banana,cherry'
```

# String to Array

You can also easily turn a string into an array.

```javascript
'dog'.split('');               //=> ['d', 'o', 'g']
'my dog has fleas'.split(' '); //=> [ 'my', 'dog', 'has', 'fleas' ]
```

# Arrays and Loops

There are ways to loop through an array's items

This means to go through the entire array, one item at a time, in order, and *do something* with each item.

# Looping Through an Array with `for`

JavaScript has had a `for` loop for quite some time

```js
let fruits = ['apple', 'banana', 'cherry'];

for (let index = 0; index < fruits.length; index++) {
  console.log(fruits[index]);
}
```

|phrase|meaning|
|---|---|
| `for`                        | in a loop, |
| `let index`                  | make an *index* variable named `index` |
| `index = 0`                  | and set `index` to `0` |
| `index < fruits.length`      | then, as long as `index` is less than the number of `fruits` |
| `{` ... `}`                  | execute this block of code |
| `console.log(fruits[index])` | print the element at `index` in the `fruits` array |
| `index++`                    | and then *increment* `index` before the next cycle |

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

# LAB: Loud Backwards Fruit

Given this array:

```js
let fruits = ['apple', 'banana', 'cherry']
```

Write a program that prints the following

```
CHERRY
BANANA
APPLE
```

> NOTE: CHERRY being bolded is not required

# Setting Items Within an Array

The `[]` operator works for assignment as well.

`fruits[0] = 'apricot'` will set the `0`th item of the array to the string `'apricot'`

# Checking for Inclusion Within an Array

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
<pre>
<code class="language-javascript">
const readline = require('readline');
const readlineInterface = readline.createInterface(process.stdin, process.stdout);

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
}

async function start() {
  let name = null;
  let enemies = ['Darth Vader', 'Lex Luthor', 'Palpatine']

  while (name !== 'bye!') {
    name = await ask('What is your name?');
    // Using someArray.includes(someValue);
    if (enemies.includes(name)) {
      console.log('Go away!')
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

# More About Arrays

* [Eloquent JavaScript Chapter-4: Data Structures](http://eloquentjavascript.net/04_data.html)
* [JavaScript.info Arrays](https://javascript.info/array)
* [JavaScript.info Array Methods](https://javascript.info/array-methods)
* [MDN JavaScript Guide - Indexed Collections](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
