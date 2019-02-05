    topic name: "hashes"
    topic name: "objects"
    topic name: "key-value-pairs"
    topic name: "setting-getting"
    topic name: "strings"
    topic name: "values"
    topic name: "methods"
    topic name: "functions"
    link from: "EloquentJavaScript",
         href: "http://eloquentjavascript.net/04_data.html",
         name: "Eloquent JavaScript Chapter 4: Data Structures: Objects and Arrays"

# Hash

a *hash* is an *abstract data type*

![corned beef hash](../images/cornedbeefhash.jpeg)

# Hash Example

```javascript
const hashMenu = {
    'corned beef hash': 3.69,
    'roast beef hash': 3.89,
    'homestyle hash': 4.47,
}

console.log('The price of homestyle hash is $' + 
  hashMenu['homestyle hash'])
```

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

In JavaScript, a hash is officially called an object.

> This is confusing since in every other computer language, "hash" and "object" are quite different things.

## Object-Oriented Programming

* Just using an object as a key-value store does not make your code *object-oriented*.
* For OOP you need a few extra features, especially the keywords `new` and `this` and `class`
* We discuss OOP in a separate [OO_JS](../javascript/oo_js) lesson

# Setting and Getting Object Values with square brackets

```js
let states = {}

states['CA'] = 'California'
states['MA'] = 'Massachusetts'
states['NY'] = 'New York'

states['MA']                // 'Massachusetts'
states['MA'].toUpperCase()  // 'MASSACHUSETTS'
```

# Setting and Getting Object Values with dots

```js
let states = {}

states.CA = 'California'
states.MA = 'Massachusetts'
states.NY = 'New York'

states.MA                // 'Massachusetts'
states.MA.toUpperCase()  // 'MASSACHUSETTS'
```

# Dots vs. Brackets

Dots are prettier than square brackets, but less versatile:

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

> capitals['New York'] = 'Albany'
'Albany'
> capitals
{ 'New York': 'Albany' }
```

# Dots vs. Brackets vs. Variables

Given this code:

```js
var items = {
    brick: 'red'
}
var item = 'brick'
```

Two of these expressions look for *a key named `item`* but only one looks for a key named *the contents of the variable named item*

```
items.item      // undefined
items['item']   // undefined
items[item]     // "red"
```

> This is confusing!

# Object literals

an object can be defined *literally* (inline) with curly braces, like this:

```js
states = {
           CA: 'California',
           MA: 'Massachusetts',
           NY: 'New York'
         }

states['MA']  // 'Massachusetts'
states.MA     // also 'Massachusetts'
```

# Looping through an object with for...in

```js
for (let state in states) {
    console.log(state);
}
```

**Note:** use "for...of" for arrays, use "for...in" for objectes -- see [this article](https://bitsofco.de/for-in-vs-for-of/) for more detail.

**WARNING:** remember the `let` or you will be defining a *global variable* named `state`

# Sidebar: Why is it called a hash?

The most common and useful implementation of this data structure uses something called a *hashing function* to make the lookup efficient. A hashing function allows you to have **huge** amounts of data and still access a single item very quickly. Think of the Dewey Decimal System: when you look up a book in the index, it tells you what aisle and shelf to visit to find that book. You don't need to search through the entire library; you just need to search a single shelf.

Because programmers are humans, and humans can be very literal-minded, people named it based on *how* it works, rather than *what* it does or *why* it does it.

*Map* and *Dictionary* are much better metaphors (and in fact there is a recently-introduced JavaScript type called [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) which behaves better than the built-in "object" hash; for instance, its keys are not limited to being strings).

Also, *hash* is a funny word, and programmers love jokes.

# JS Object Hash Rules

* All keys are strings

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

```js
let rectangle = {
    height: 10,
    width: 8,
    area: function() {
        return this.height * this.width;
    }
}

rectangle.height   //=> 10
rectangle.area()   //=> 80
```

`this` is a magic word that means "this object I'm in *right now*"

# LAB: more about JS Objects

* FreeCodeCamp:
  * From [Build JavaScript Objects](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/build-javascript-objects)
  * to [Accessing Nested Objects](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/accessing-nested-objects)

