    topic name: "hashes"
    topic name: "objects"
    topic name: "key-value-pairs"
    topic name: "setting-getting"
    topic name: "strings"
    topic name: "values"
    topic name: "methods"
    topic name: "functions"
    topic name: "data-structures"
    link from: "EloquentJavaScript",
         href: "http://eloquentjavascript.net/04_data.html",
         name: "Eloquent JavaScript Chapter 4: Data Structures: Objects and Arrays"
    project name: "zorkington"

# Hash

![corned beef hash](../images/cornedbeefhash.jpeg)

* during breakfast, *hash* is a *delicious processed meat product*
* during coding, a *hash* is an *abstract data type*

# Hash Example

```javascript
const hashMenu = {
    'corned beef': 3.69,
    'roast beef': 3.89,
    'homestyle': 4.47,
}

console.log('The price of homestyle hash is $' + hashMenu.homestyle)
```

### New term: *property*

`'corned beef'`, `'roast beef'`, and `'homestyle'` are all *properties* of the `hashMenu` *object*

# What makes a hash a hash?

a hash is an

* unordered 
* indexed (by strings, not numbers)
* collection
* of key/value pairs

In other words, a hash defines a *mapping* from one group of things to another, like a phone book or a dictionary.

# a hash is also known as a...

  * map or mapping
  * dictionary
  * associative array
  * lookup table
  * key/value store

# hash or object?

In JavaScript, a **hash** is officially called an **object**.

> This is confusing since in every other computer language, "hash" and "object" are quite different things.

## Object != Object-Oriented

* Just using an object as a key-value store does not make your code *object-oriented*.
    * For OOP you need a few extra features, especially the keywords `new` and `this` and `class`
    * We discuss OOP in a separate [OO_JS](../javascript/oo_js) lesson
* In the rest of this lesson we use "hash" and "object" interchangeably

# An Object is a Lookup Table

An object is useful for putting many similar things together.

an object can be defined *literally* (inline) with curly braces, like this:

Let's make an object that maps a state's *abbreviation* to its *full name*:

```javascript
let states = {
  'VT': 'Vermont',
  'CA': 'California',
  'MA': 'Massachusetts',
  'NY': 'New York'
}
```

> This is called an *object literal* since it defines the object exactly as it's written.

(If the key has no spaces in it, you can omit the quotations; object keys are always strings.)

# Accessing Object Properties

You can get the properties of an object with either *dots* or *brackets*:

|   |   | value  |
|---|---|---|
| `states.VT` | `states['VT']` | `'Vermont'` |
| `states.CA` | `states['CA']` | `'California'` |
| `states.MA` | `states['MA']` | `'Massachusetts'` |
| `states.NY` | `states['NY']` | `'New York'` |

Both syntaxes are useful in different situations.

```javascript
states['VT'].toUpperCase()  // 'VERMONT'
```

# Setting Object Properties

You can also set the properties of an object with either *dots* or *brackets*:

```js
states.WY = 'Wyoming'
states['FL'] = 'Florida'
```

# Dots vs. Brackets

Dots are prettier than square brackets, but less versatile, since some keys simply cannot be represented using dot notation, and trying to use them causes syntax errors.

```js
> capitals = {}
{}

> capitals.New York = 'Albany'
capitals.New York = 'Albany'
             ^^^^
SyntaxError: Unexpected identifier

> capitals.'New York' = 'Albany'
capitals.'New York' = 'Albany'
         ^^^^^^^^^^
SyntaxError: Unexpected string
```

If you get those errors, revert to brackets, which is more reliable:

```javascript
> capitals['New York'] = 'Albany'
'Albany'
> capitals
{ 'New York': 'Albany' }
```

# Dots vs. Brackets vs. Variables

You can use variables instead of literals to get and set properties.

Given this code:

```js
let items = {
    brick: 'red'
}
let item = 'brick'
```

Two of the following expressions look for *a key named `item`*, but only one looks for a key named *the value of the variable named item*:

| code | value | explanation |
|---|---|---| 
|`items.item   ` |  `undefined` | "get me the property named 'item'" |
|`items['item']` |  `undefined` | "get me the property named 'item'" |
|`items[item]  ` |  `'red'`     | "get me the property named 'brick'"

> This can be confusing!

# An Object is a Data Structure

Objects are good for a lot more than mere one-to-one maps. They allow you to design *data structures* that are as complicated as you can imagine...

```javascript
let alice = {
  name: 'Alice Abrams',
  age: 36,
  married: false,
  homeAddress: {
    street: '12 Maple St.',
    city: 'Burlington',
    state: 'VT',
    zipCode: '05401',
    location: {
      latitude: 44.4759,
      longitude: -73.2121
   },
   pets: ['Mittens', 'Fido']
  }
}
```

> Note: The above shows the essence of [JSON](../javascript/json):
> a syntax for representing data structures containing primitive values,
> including nested objects and arrays.

# Looping through an object with for...in

```js
for (let state in states) {
    console.log(state);
}
```

**Note:** use "`for...of`" for arrays, use "`for...in`" for objects -- see [this article](https://bitsofco.de/for-in-vs-for-of/) for more detail about **of** vs. **in**.

**WARNING:** remember the `let` or you will be defining a *global variable* named `state`

# Sidebar: Why is it called a hash?

The most common and useful implementation of this data structure uses something called a *hashing function* to make the lookup efficient. A hashing function allows you to have **huge** amounts of data and still access a single item very quickly. Think of the Dewey Decimal System: when you look up a book in the index, it tells you what aisle and shelf to visit to find that book. You don't need to search through the entire library; you just need to search a single shelf.

Because programmers are humans, and humans can be very literal-minded, people named it based on *how* it works, rather than *what* it does or *why* it does it.

*Map* and *Dictionary* are much better metaphors (and in fact there is a recently-introduced JavaScript type called [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) which behaves better than the built-in "object" hash; for instance, its keys are not limited to being strings).

Also, *hash* is a funny word, and programmers love jokes.

# All keys are strings

* In a JavaScript object, keys must be strings

* **Beware** of using these as keys, since they get converted to strings in unexpected ways:

    * `null`
    * `undefined`
    * `''` (empty string)
    * `false` or `true`
    * `0` (or any number)

# `delete`

To remove a key-value pair from an object, use the keyword `delete`:

```js
states = {
            CA: 'California',
            MA: 'Massachusetts',
            NY: 'New York'
         }
{ CA: 'California', MA: 'Massachusetts', NY: 'New York' }
> delete states.MA
true
> states
{ CA: 'California', NY: 'New York' }
```

> note that `delete` is **not** a method; it's a standalone keyword, like a global function

# fake delete

You can get a similar effect by setting the value to `null` or `undefined`, but beware: the key remains!

```js
> states.CA = null
null
> states.NY = undefined
undefined
> states
{ CA: null, NY: undefined }
> for (let state of states) { console.log(state) }
```

> You probably shouldn't do this, since it only removes the *value*, but not the *key*, from the property list.

# Object Instance Methods

Here's a taste of [object instance methods](./methods).

A method is a *function* attached to an *object* as a *property*.

```js
let stringUtils = {
  capitalize: function(word) {
    return word.charAt(0).toUpperCase() +
      word.slice(1).toLowerCase();
  },
  rant: function(opinion) {
    return option.toUpperCase() + '!!!';
  }
}

stringUtils.rant('i love pizza') //=> 'I LOVE PIZZA!!!'
```

# LAB: more about JS Objects

* FreeCodeCamp:
  * From [Build JavaScript Objects](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/build-javascript-objects)
  * to [Accessing Nested Objects](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/accessing-nested-objects)

