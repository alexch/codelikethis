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

# Objects Contain Properties

```javascript
let fido = {
  species: 'dog',
  color: 'brown',
  spayed: true,
  weight: 40,
  favoriteActivities: [
    'sleeping',
    'chasing squirrels'
  ]
}
```

* Object **properties** are **KEY** and **VALUE** pairs
* The **key** is on the left and the **value** on the right; the two together are called a *property*.
* JavaScript object keys are always strings. If the key has no spaces you can omit surrounding quotes.
* `let fido = {...}` is an assignment, setting the variable `fido` to point to the object we just defined

# An Object is like a Lookup Table

Objects are useful for putting many similar values together.

Let's make an object that binds a state *abbreviation* to its *full name*

*Type this in a NodeJS console, or a JavaScript file*:

```javascript
let states = {
  'VT': 'Vermont',
  'CA': 'California',
  'MA': 'Massachusetts',
  'NY': 'New York'
}
```

# Getting Object Properties

You can get the properties of an object using either *dots* or *brackets*:

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

* You can set the properties of an object with either *dots* or *brackets* followed by `=` ( a single equal sign)
* Adding properties works even after the object has been created.

```javascript
states.WY = 'Wyoming'

states['FL'] = 'Florida'
```

* Setting a property with a key that already exists *updates* the original value
```javascript
states.VT = 'The Green Mountain State'
```

# Dots vs. Brackets 1

Dots are *prettier* than square brackets, but less versatile, since some keys simply cannot be represented using dot notation, and trying to use them causes syntax errors.

The bracket `[]` syntax is less common but covers all uses (e.g., if the key contains spaces, or is **a variable**).

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

# Dots vs. Brackets 2

If you get an error when setting a property, revert to brackets, which are more reliable:

```javascript
> capitals['New York'] = 'Albany'
'Albany'
> capitals
{ 'New York': 'Albany' }
```

# Dots vs. Brackets with Variables 1

You can use **variables** instead of values to get and set properties.

Given this code ...

```js
let materials = {
  brick: 'a red brick',
  siding: 'some wooden clapboards'
}

let desired = 'brick'
console.log(materials[desired]);
// => 'a red brick'
```

# Dots vs. Brackets with Variables 2

The last two expressions look for *a key named `desired`*, but only the first one looks for a key named *the value of the variable named desired*:

| code            | value       | explanation                         |
|-----------------|-------------|-------------------------------------|
| `materials[desired]  ` | `'a red brick'`     | "get me the property named 'brick'" |
| `materials.desired   ` | `undefined` | "get me the property named 'desired'"  |
| `materials['desired']` | `undefined` | "get me the property named 'desired'"  |

> NOTE: This can be confusing!

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
};

console.log(alice.homeAddress.zipCode);
// => '05401'
```

Given the above, the value of `alice.homeAddress.zipCode` is `'05401'`

# LAB: Looping through an object with for...in

There is a way to loop through every property in an object.

This `for..in` loop:
* Grabs every property in the `states` object, one at a time
* And inside the loop
* Sets the `state` value to that property's *key*

```js
for (let state in states) {
// write code here 
// using the state variable
// and the states object
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
<pre>
<code class="language-javascript">
let states = {
  'VT': 'Vermont',
  'CA': 'California',
  'MA': 'Massachusetts',
  'NY': 'New York'
}

for (let state in states) {
    console.log(state + ' is short for ' + states[state]);
}
</code>
</pre>
</details>

> NOTE: Use `for...in` for objects, and not `for..of`.
> See [this article](https://bitsofco.de/for-in-vs-for-of/) for more detail about **of** vs. **in**.

> WARNING: remember to use the `let` keyword or you will be defining a *global variable* named `state`

# Object Properties as an Array

It is also possible to convert an Object's properties into an Array of Strings, and then loop over that Array

[`Object.keys(someObject)`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) is a function that

  * Receives any object as an argument
  * Returns an array of **all** the object's property names

Example:

```javascript
let states = {
  CA: 'California',
  MA: 'Massachusetts',
  NY: 'New York'
}

Object.keys(states)
//=> [ 'CA', 'MA', 'NY' ]
```

[MDN Documentation on Object.keys](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)


# LAB: Class GPA

Create a new JavaScript file called `gpa.js`, with the following code:

```javascript
let grades = {
  midterm: 3.3,
  project: 4.0,
  final: 3.2
}

function gpa(someGrades) {
  // write your code here
}

console.log('The final GPA is ' + gpa(grades));
```

* Write the `gpa` function
* Assume that all grades carry equal weight toward the GPA

> The answer is 3.5 ... but don't just return 3.5, make it work for real. There is more than one way to solve this.

# Class GPA solution

<details>
<summary>Hint 1</summary>
<div>
You can use `for..in` to loop over an object's properties
</div>
</details>

<details>
<summary>Hint 2</summary>
<div>
You can use `Object.keys(someObject) to get all an object's properties as an Array, then check their length with `.length`
</div>
</details>

<details>
<summary>Solution</summary>
<pre>
<code class="language-javascript">
let grades = {
  midterm: 3.3,
  project: 4.0,
  final: 3.2
}

function gpa(gradeObject) {
  let total = 0;
  let gradeCount = Object.keys(gradeObject).count;
  for (let grade in gradeObject) {
    total = total + gradeObject[grade];
  }
  return total / gradeCount;
}

console.log('The GPA is ' + gpa(grades));
</code>
</pre>
</details>

# All keys become Strings

* In a JavaScript object, keys must be strings, even `null`, `0`, and `undefined`

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
