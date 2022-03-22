    topic name: "values"
    topic name: "operators"
    topic name: "assignment"
    topic name: "return-values"

# Variables

* A **VARIABLE** is a **NAME** for a **VALUE**.
* You give a value a name using the **assignment** operator `=`
* Anywhere you use a value, you can use a variable instead.

```js
let color = "blue"
let fruit = "berry"
color + fruit       // "blueberry"
fruit.toUpperCase() // "BERRY"
```

# Let vs Var vs Cont

* `let`  declares a variable in JavaScript
* `const` declares a variable that cannot be reassigned
* `var` is like `let` but is no longer recommended

# Rebinding Let

You can only use `let` once per variable name, per **scope**

```js
let name = 'Grace';
let name = 'Hopper';
// Identifier 'name' has already been declared
```

# The Warehouse Metaphor

Think of memory as a giant warehouse. Computer memory is vast and filled with boxes of various sizes.

![Warehouse from Raiders of the Lost Ark](https://res.cloudinary.com/btvca/image/upload/v1574445214/curriculum/warehouse_ob5utf.jpg)

# The Warehouse Metaphor Explained

If memory is a giant warehouse...

* Memory locations are **boxes** in that warehouse
* Then a **value** is the **contents** of a box
* And a **variable** is a **label** you apply to the outside of the box

# Variables as Documentation

Which is clearer?

```js
60 * 60 * 24
```

```js
let secondsPerMinute = 60;
let minutesPerHour = 60;
let hoursPerDay = 24;
let secondsPerDay = secondsPerMinute * minutesPerHour * hoursPerDay;
```

# Lab: Play In Console

Let's spend a few minutes just playing around with variables in the JavaScript console.

Some things to try:

* Assign your birth year to a variable, then calculate your current age in years
* Write a poem (with at least two lines) and assign it to a variable
* Print the poem to the console *with proper line formatting*
* Assign your best friend's name to a variable
* YELL YOUR BEST FRIEND'S NAME
* Get a new best friend
* And YELL THEIR NAME TOO

# Variables Point at Values

```js
let snack = "Apple"
```

![snack-apple](https://res.cloudinary.com/btvca/image/upload/v1574445202/curriculum/snack-apple_ltysdv.svg)

Think of a variable as an arrow **pointing** to a value.

# Changing Variables

You can assign and reassign variables at will

* Reassignment changes the name of an object. It does *not* change the data inside the object
* This is analogous to removing a label from one box and placing it on a different box

```js
let color = "blue" // assign 'blue' to color
let fruit = "berry"// assign 'berry' to fruit
color + fruit      // 'blueberry'

color = "black"    // 'black'
color + fruit      // 'blackberry'
```

# Many Variables One Value

```js
let fruit = "Apple"
let snack = fruit
```

![snack-fruit](https://res.cloudinary.com/btvca/image/upload/v1574445202/curriculum/snack-fruit_momdep.svg)

After this both `snack` and `fruit` are *pointing* to the same *value*

This is analogous to placing two labels on the same box.

# Return values

Most messages return *new* values:

```js
let fruit = "banana"
let snack = fruit.toUpperCase()
```

![fruit-banana-snack-banana](https://res.cloudinary.com/btvca/image/upload/v1574445175/curriculum/fruit-banana-snack-banana_fbbd8h.svg)

`"banana"` and `"BANANA"` are two *different values* in memory. The original value is still sitting around and still pointed to by `fruit`.

# Changing Values

Many messages do not change the data inside the object.

```js
let color = "blue"
color.toUpperCase()     // "BLUE"
color                   // "blue"
```

This is true for all primitive values.

# Constants: Variables that Aren't Variable

* `const` is just like `let`, but also *prevents reassignment*
* The value of a `const` is *constant* after it's been set once

```javascript
const pi = 3.14159;
```

```javascript
pi = 7;
TypeError: Assignment to constant variable.
```

> WARNING: `const` prevents *reassignment* but does not prevent changing the *insides* of objects (like the dates in the previous slide).

# Summary: Variables

* variables are names for memory locations, which hold values
* *declaring* a variable says what its *scope* is
* *assigning* a variable changes which location it points to
* you can have many names for the same location
* sometimes values can change on the inside of a location
  * (which is useful but could cause bugs)
