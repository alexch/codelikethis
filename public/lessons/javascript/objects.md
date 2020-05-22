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

# Software Models the World

* Data Structures allow for programmers to make models of the world in code.
* People naturally think of the world as made up of things.
* Programming languages have ways to represent things.
* JavaScript's primary way of representing a thing is an "Object".
* JavaScript objects let you describe things in any way you can imagine.
  * As long as your description is valid JavaScript :)

> All models are wrong, but some are useful. -- [George Box](https://en.wikipedia.org/wiki/All_models_are_wrong)

# An Object Contains Properties

```javascript
let abby = {
  'species': 'dog',
  'color': 'brown',
  spayed: true,
  breed: 'mutt',
  weight: 40,
  'favorite activity': 'chasing squirrels'
}
```

* This is called **object literal** syntax since it defines the object exactly as it's **written**.
* The string on the left is called the *key*; the string on the right is called a *value*; the two together are called an *entry* or a *property*.
* JavaScript object keys are always strings, but if the key has no spaces in it, you can omit the quotations
* `let abby = {...}` is an assignment, setting the variable `abby` to point to the object we just defined

# An Object is a Lookup Table

An object is useful for putting many similar things together.

Let's make an object that maps a state's *abbreviation* to its *full name*

*Type this in a NodeJS console*:

```javascript
let states = {
  'VT': 'Vermont',
  'CA': 'California',
  'MA': 'Massachusetts',
  'NY': 'New York'
}
```

# Getting Object Properties

You can get the properties of an object with either *dots* or *brackets*:

| With Dots   | With Brackets  | The Value         |
|-------------|----------------|-------------------|
| `states.VT` | `states['VT']` | `'Vermont'`       |
| `states.CA` | `states['CA']` | `'California'`    |
| `states.MA` | `states['MA']` | `'Massachusetts'` |
| `states.NY` | `states['NY']` | `'New York'`      |

Both syntaxes are useful in different situations.

```javascript
states['VT']  // 'Vermont'
states.VT     // also 'Vermont'
```

# Setting Object Properties

* You can set the properties of an object with either *dots* or *brackets* followed by a `=` (single equal sign)
* Adding properties works even after the object has been created.

```javascript
states.WY = 'Wyoming'

states['FL'] = 'Florida'
```

* Setting a property with a key that already exists *removes* the original value first
```javascript
states.VT = 'The Green Mountain State'
```

# Dots vs. Brackets

Dots are prettier than square brackets, but less versatile, since some keys simply cannot be represented using dot notation, and trying to use them causes syntax errors.

The bracket `[]` syntax is less common but covers more uses (e.g., if the key contains spaces, or is inside a variable).

```javascript
> let capitals = {}
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

Given this code ...

```js
let items = {
    brick: 'red'
}
let item = 'brick'
```

... two of the following expressions look for *a key named `item`*, but only one looks for a key named *the value of the variable named item*:

| code            | value       | explanation                         |
|-----------------|-------------|-------------------------------------|
| `items.item   ` | `undefined` | "get me the property named 'item'"  |
| `items['item']` | `undefined` | "get me the property named 'item'"  |
| `items[item]  ` | `'red'`     | "get me the property named 'brick'" |

> This can be confusing!

# An Object is a Data Structure

Objects are good for a lot more than mere one-to-one maps. They allow you to design *data structures* that are as complicated and as deeply nested as you can imagine...

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
    }
  },
  pets: ['Mittens', 'Fido']
}
```

Given the above, the value of `alice.homeAddress.zipCode` is `'05401'`

> Note: The above shows the essence of [JSON](./json):
> a syntax for representing data structures containing primitive values,
> including nested objects and arrays.

# `Object.keys`

`Object.keys` is a special function that:

  * takes any object
  * returns an array
  * containing that object's keys

Example:

```javascript
Object.keys(states)  //=> [ 'CA', 'MA', 'NY' ]
```

# LAB: Looping through an object with for...in

Here's a way to loop through every property in an object.

This `for..in` loop grabs every property in the `states` object, 
one at a time,
and inside the loop,
sets the `state` value to that property's *key*

```js
for (let state in states) {
    
}
```

In a new JS file, try to write code that outputs:

```
VT is short for Vermont
CA is short for California
MA is short for Massachusetts
NY is short for New York
```

<details>
<summary>Solution:</summary>
<div>

```js
let states = {
  'VT': 'Vermont',
  'CA': 'California',
  'MA': 'Massachusetts',
  'NY': 'New York'
}

for (let state in states) {
    console.log(state + ' is short for ' + states[state]);
}
```

</div>
</details>

**Note:** use "`for...of`" for arrays, use "`for...in`" for objects -- see [this article](https://bitsofco.de/for-in-vs-for-of/) for more detail about **of** vs. **in**.

**WARNING:** remember the `let` or you will be defining a *global variable* named `state`

# LAB: Class GPA

Please create a new file called `gpa.js`, and type in the following code
(which defines a `grades` object and calls a `gpa` function):

```javascript
let grades = {
  'midterm': 3.3,
  'project': 4.0,
  'final': 3.2
}

console.log('The GPA is ' + gpa(grades));
```

* Now write the `gpa` function, and run `node gpa`!
* Assume that all grades carry equal weight toward the GPA.
* The answer is 3.5 ... but don't just return 3.5, make it work for real.

> Hint: There's more than one way to solve this!

# Class GPA solution

<details>
<summary>Hint</summary>
<div>
You can use dot notation to access properties on an object

```js
grades.midterm // => 3.3
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
let grades = {
  'midterm': 3.3,
  'project': 4.0,
  'final': 3.2
}

function gpa(object) {
  return (object.midterm + object.project + object.final) / 3
}

console.log('The GPA is ' + gpa(grades));
```

</div>
</details>

# All keys are strings, even nulls

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

> note that `delete` is **not** a function; it's a keyword

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

> Remember, this only removes the *value*, but not the *key*, from the property list.
> This can be dangerous!

# LAB: A Menu Order

* Write a program that accepts a food order based on a menu.
  * Name your program `order.js`.
  * Create an object to store all the item names and their prices.
  * Accept an order on the command line and calculate the total for all items.
  * Print the total order price and exit.

| Item   | Price |
|--------|-------|
| Burger | $5.00 |
| Fries  | $3.50 |
| Shake  | $1.11 |
| Salad  | $4.25 |

## Example Program Usage

```
$ node order burger fries

Your order total is $8.50

$ node order burger burger shake fries burger

Your order total is $19.61
```

# Menu Order solution

<details>
<summary>Hint 1</summary>
<div>

You can get an array of arguments form the command line by using `process.argv.slice(2)`

</div>
</details>

<details>
<summary>Hint 2</summary>
<div>
Create an object that represents your menu

```js
menu = {
  burger: 5,
  fries: 3.5,
  //etc.
}
```

</div>
</details>

<details>
<summary>Hint 3</summary>
<div>
You can access the value of a key using a string with square bracket notation

```js
menu["burger"] // => 5
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
let order = process.argv.slice(2)

let menu = {
  burger: 5,
  fries: 3.5,
  shake: 1.11,
  salad: 4.25
}

let orderPrice = 0

order.forEach((item) => {
  orderPrice += menu[item]
})

console.log("Your order total is $" + orderPrice)
```

</div>
</details>

# Object Instance Methods

Here's a taste of [object instance methods](/lessons/javascript-track/methods).

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

# More About JS Objects

* Eloquent JavaScript: [Chapter 4](https://eloquentjavascript.net/04_data.html)

* FreeCodeCamp:
  * From [Build JavaScript Objects](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/build-javascript-objects)
  * to [Accessing Nested Objects](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/accessing-nested-objects)
