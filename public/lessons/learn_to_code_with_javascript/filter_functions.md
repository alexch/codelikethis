    topic name: "each"
    topic name: "map"
    topic name: "filter"
    topic name: "reduce"
    topic name: "callbacks"
    link name: "Higher-order Functions",
         href: "http://eloquentjavascript.net/05_higher_order.html",
         from: "EloquentJavaScript"

# Filter Functions

a JavaScript array has a few very handy methods
that let you *apply a function* to its contents.

| method | description | returns |
|---|---|---|
| [`forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find)  | do something to each item | `undefined`|
| [`find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find)  | find the first item that matches | one matching item (or `undefined` if no match) |
| [`filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) | accept or reject each item | a new collection, possibly smaller |
| [`map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)  | change each item into a new item | a new collection of the same size |
| [`reduce`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)  | scan the entire collection and "reduce" it to... | ...a single result, e.g. a total |

We call this group of methods "filter functions" or "iterator methods".

# forEach

`forEach` works a lot like `for..of`

Given an array of names:

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David']
```

this code:

```javascript
for (let name of names) {
    console.log(name.toUpperCase());
}
```

and this code:

```javascript
let printUpper = function(word) {
  console.log(word.toUpperCase());
}
names.forEach(printUpper);
```

both print:

```
ALICE
BOB
CHARLIE
CAROL
DAVID
```

# Find

to find the first item that matches the condition...

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David']
let beginsWithC = function(word) {
    return word.charAt(0).toUpperCase() === 'C';
}
names.find(beginsWithC) //=> 'Charlie'
```

# Find Inline

For conciseness, people often define the filter function *inline*, like this:

```javascript
names.find((word) => word.charAt(0).toUpperCase() === 'C')
```

Q: Is this more or less clear than the previous slide?

# Filter

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David']
let beginsWithC = function(word) {
    return word.charAt(0).toUpperCase() === 'C';
}
names.filter(beginsWithC) //=> [ 'Charlie', 'Carol' ]
```

# Map

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David']
let upper = function(word) {
    return word.toUpperCase();
}
names.map(upper) //=> [ 'ALICE', 'BOB', 'CHARLIE', 'CAROL', 'DAVID' ]
```
# Lab: Titleize with Map

Remember capitalize? It only capitalizes the first letter of the whole string.

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

Here's one way to do it:

```javascript
function titleize(phrase) {
  return phrase.split(' ').map((word) => capitalize(word)).join(' ');
}
```

Here's another:

```javascript
function titleize(phrase) {
  return phrase.split(' ').map(capitalize).join(' ');
}
```

And another:

```javascript
function titleize(phrase) {
    let words = [];
    phrase.split(' ').forEach((word) => {words.push(capitalize(word))});
    return words.join(' ');
}
```

# Reduce

The `reduce` method keeps track of a *running total* (aka *accumulator*); whatever value the function returns is used as the accumulator for the next pass.

Here's some code that counts the total number of letters across all words in an array:

```javascript
let names = ['Alice', 'Bob', 'Charlie', 'Carol', 'David'];
const reducer = (accumulator, word) => accumulator + word.length;
let totalCount = names.reduce(reducer, 0); //=> 25
```

The first time through, the accumulator is 0. Next time, it's 5. Then 8, then 15, etc.

# Map Filter Reduce in Emoji

![map filter reduce in emoji](../images/map-filter-reduce-in-emoji.png)

(source unknown)
