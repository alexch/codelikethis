    topic name: "each"
    topic name: "map"
    topic name: "filter"
    topic name: "reduce"
    topic name: "callbacks"
    link name: "Higher-order Functions",
         href: "http://eloquentjavascript.net/05_higher_order.html",
         from: "EloquentJavaScript"
    link name: "Array Iteration Methods",
         href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Iteration_methods",
         from: "Mozilla Developer Network"

# Array Properties and Methods

Every JavaScript *Array* is also a JavaScript *Object*

That means that arrays have *properties* and *methods* like other objects.

Examples:

```javascript
let myArray = ['apple', 'cherry', 'pineapple'];
```

* `myArray.length` is a *property* that is the number of elements in the array
* `myArray.reverse()` is a *method* that reverses the ordering of all elements in the array 

> NOTE: Properties are called by their name alone, but Methods require parenthesis `()` after the name

See [MDN: Array Methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#instance_methods) to see a lot more array methods

# Iteration Methods

Every JavaScript array has [many tools](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Iteration_methods) that let you pass each item to a  *function* to its contents.

| method name | description | returns |
|---|---|---|
| [`forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)  | do something with each item | `undefined`|
| [`find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find)  | find the first item matching the test | one matching item (or `undefined` if no match) |
| [`filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) | accept or reject each item | a new Array of matching items |
| [`map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)  | change each item into a new item | a new Array of the same size |
| [`reduce`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)  | scan the entire collection and "reduce" it to... | ...a single result, e.g. a total |

* We call this group of methods "[iteration methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Iteration_methods)"
* There are about a dozen built-in iteration methods, plus lots more added by libraries like [lodash](https://lodash.com/). 

# Iterators are Callback Functions

A [callback function](https://developer.mozilla.org/en-US/docs/Glossary/Callback_functio) is **any** function passed to another function as an argument. Callback functions are then called by the outer function in order to do some work.

```javascript
function printDate(value) {
  console.log('The date is: ' + value);
}

function currentDate(callback) {
  let now = Date().toLocaleString();
  // calling the inner callback
  callback(now);
  // back in the outer function
  console.log('All Done!');
}

currentDate(printDate)
```

# The `forEach` Method 1

`forEach` works a lot like `for..of`, but passes each value to a [callback function](https://developer.mozilla.org/en-US/docs/Glossary/Callback_function) as an argument, one after another.

```js
let names = ['Alice', 'Bob', 'Carol'];

function printUpperCase(name) {
  console.log(name.toUpperCase())
}

names.forEach(printUpperCase);

/* Prints the following:
ALICE
BOB
CAROL
*/
```

# The `forEach` Method 2

Given an array of names:

```javascript
let names = ['Alice', 'Bob', 'Carol'];
```
This code:

```js
for (let name of names) {
  console.log(name.toUpperCase())
}
```

And this code:

```js
function printUpperCase(name) {
  console.log(name.toUpperCase())
}

names.forEach(printUpperCase)
```

Print the same thing:

```text
ALICE
BOB
CAROL
```

# The `find` Method

Find the first item that matches the condition function

```javascript
let names = ['Alice', 'Bob', 'Carol'];

function beginsWithC(word) {
  return word.charAt(0).toUpperCase() === 'C';
};

names.find(beginsWithC); 
//=> 'Carol'
```

Note that:

* `beginsWithC` function must return a `true` or `false` value
* `find` method returns a single item from the array, or `undefined`

# Lab: Find a Berry

Given the following array:

```javascript
let fruits = ['Apple', 'Blueberry', 'Cherry', 'Date', 'Elderberry']
```

Write code that uses `find` to return the first item that ends with the string `'berry'`

(in this case, `'Blueberry'`)

<details>
<summary>Solution</summary>
<div>
<pre>
<code class="language-javascript">
let fruits = ['Apple', 'Blueberry', 'Cherry', 'Date', 'Elderberry'];

function endBerry(word) {
  return word.endsWith("berry")
}

fruits.find(endBerry);
</code>
</pre>
</div>
</details>

# The `filter` Method

The `filter` iteration method returns *all* matching values, in a *new array*

Note that
* `beginsWithC` function must **still* return a `true` or `false` value
* `filter` method returns an Array of all values passing the test

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David'];

function beginsWithC(word) {
  return word.charAt(0).toUpperCase() === 'C';
}

names.filter(beginsWithC) 
//=> [ 'Charlie', 'Carol' ]
```

# Lab: Find all Berries

Given the following array:

```javascript
let fruits = ['Apple', 'Blueberry', 'Cherry', 'Date', 'Elderberry']
```

Now go find your code from the previous lab ("Find a Berry")
and change it to use `filter` to return a new array 
containing **all** the fruits that end with the string `'berry'`

# Find All Berries Solution

<details>
<summary>Solution</summary>
<div>
<pre>
<code class="language-javascript">
let fruits = ['Apple', 'Blueberry', 'Cherry', 'Date', 'Elderberry'];

function endBerry(word) {
  return word.endsWith("berry")
}

fruits.filter(endBerry);
</code>
</pre>
</div>
</details>

# The `map` Method

The `map` iteration method returns a *new array* whose elements correspond to the elements of the original array.

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David'];
function upperCase(word) {
    return word.toUpperCase();
}
names.map(upperCase) 
//=> [ 'ALICE', 'BOB', 'CHARLIE', 'CAROL', 'DAVID' ]
```

It's called "map" because in a mathematical sense, it defines a *mapping* from one collection to another.

| from | to |
|---|---|
| 'Alice'| 'ALICE' | 
| 'Bob'| 'BOB' |
| 'Charlie' | 'CHARLIE' |
| 'Carol' | 'CAROL' |
| 'David' | 'DAVID' |

# Lab: Titleize with Map

Remember the [capitalize function](/lessons/javascript-track/functions#anchor/capitalize)? It capitalizes the first letter of a string and makes the whole rest of the string lowercase.

```javascript
function capitalize(word) {
  let firstLetter = word[0];
  let restOfWord = word.slice(1);
  return firstLetter.toUpperCase() + restOfWord.toLowerCase();
}
```

Now please try to write a function that capitalizes *each word* in a string.

```javascript
titleize("the rain in spain falls MAINLY on the PLAIN")
  //=> 'The Rain In Spain Falls Mainly On The Plain'
```

There is a solution on the next slide, but please try on your own first.

# Solution: Titleize

<details>
<summary>Solution</summary>
<pre>
<code class="language-javascript">
function capitalize(word) {
  let firstLetter = word[0];
  let restOfWord = word.slice(1);
  return firstLetter.toUpperCase() + restOfWord.toLowerCase();
}

function titleize(phrase) {
  let words = [];
  phrase.split(' ').forEach((word) => {
    words.push(capitalize(word))
  });
  return words.join(' ');
}
</code>
</pre>
</details>

# Aside: Method Chaining

* The solution above uses **method chaining** -- taking the **result** of one method, and immediately calling a method on that result **without assigning it to a variable**, again and again until you get a final result.
* Method chaining can be very elegant, but it can also be very dense, making the code harder to understand, test, and debug.
* "Unspooling" a method chain into intermediate variables (like example 3) can make the code easier to follow, but it can also make it cluttered and obscure the algorithm.

# Reduce

The `reduce` method keeps track of a *running total* (aka *accumulator* or *memo*); whatever value the function returns is used as the accumulator for the next pass.

Here's some code that counts the total number of letters across all words in an array:

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David'];
const reducer = function(accumulator, word) {
    return accumulator + word.length;
};
let totalCount = names.reduce(reducer, 0); //=> 25
```

The `reduce` algorithm can be difficult to follow at first; here's a walkthrough:

| Iteration | Accumulator In | Word | Length | Accumulator Out |
|---|---|---|---|---|
| 1 |  0 | 'Alice'   | 5 | 0 + 5 = 5 |
| 2 |  5 | 'Bob'     | 3 | 5 + 3 = 8 |
| 3 |  8 | 'Charlie' | 7 | 8 + 7 = 15 |
| 4 | 15 | 'Carol'   | 5 | 15 + 5 = 20 |
| 5 | 20 | 'David'   | 5 | 20 + 5 = 25 |

See how the accumulator is used to pass information from one iteration to the next?

# Iteration Methods in Emoji

![map filter reduce in emoji](https://res.cloudinary.com/btvca/image/upload/v1574445188/curriculum/map-filter-reduce-in-emoji_t6emre.png)

<small>(image used with [permission](https://twitter.com/AccordionGuy/status/1098031540725051399) by [@AccordionGuy](https://twitter.com/AccordionGuy) based on [a tweet by @steveluscher](https://twitter.com/steveluscher/status/741089564329054208) -- with a [working implementation](http://www.globalnerdy.com/2016/06/26/demonstrating-map-filter-and-reduce-in-swift-using-food-emoji/) 😲 in Swift)
</small>
