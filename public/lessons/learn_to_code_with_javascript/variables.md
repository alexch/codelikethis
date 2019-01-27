    topic name: "values"
    topic name: "operators"
    topic name: "assignment"
    topic name: "return-values"

# Variables

* A **variable** is a **name** for a value.
* You give a value a name using the **assignment** operator 
    * It looks like an equal sign but is *not* a comparison.
    * often preceded by `let` as in "Let there be light" or "Let X equal 10".

```js
let color = "blue"
let fruit = "berry"
```

* Anywhere you would use a literal value, you can use a variable instead.

```js
color + fruit       // "blueberry"
fruit.toUpperCase() // "BERRY"
```

* ...so pick good names :-)

# Let there be confusion

* `let` is just one way to declare a variable in JavaScript
* `var` is a lot like `let` but has wider *scope* which is sometimes bad
* If you don't use either `let` or `var` then the variable becomes *global* (which is dangerous)
* Moral: *always use let* unless you have a good reason not to

# Don't let me down 

Unfortunately, in JavaScript you can only use `let` once per variable name (in a given *scope*), otherwise you will get an error:

```js
Identifier 'x' has already been declared
```

That means that when you're in the JavaScript console, if you see this error then try again without the `let`

```js
> let x = 1
undefined
> let x = x + 2
SyntaxError: Identifier 'x' has already been declared
> x = x + 2
3
```

* also confusing: the value of a `let` is `undefined`, but the value of a normal assignment is the value being assigned

# The Warehouse Metaphor

![Warehouse from Raiders of the Lost Ark](../images/warehouse.jpg)

Think of memory as a giant warehouse.

# The Warehouse Metaphor Explained

If memory is a giant warehouse...

...and memory locations are **boxes** in that warehouse

...then a *value* is the **contents** of a box

...and a *variable* is a **label** you stick on the outside of the box


# Variables are documentation

Which is clearer, this:

    60 * 60 * 24

or this:

    let secondsPerMinute = 60
    let minutesPerHour = 60
    let hoursPerDay = 24
    let secondsPerDay = secondsPerMinute * minutesPerHour * hoursPerDay

?

# Lab: Play In Console

Let's spend a few minutes just playing around with variables in the JavaScript console.

Some things to try:

* assign your birth year to a variable, then calculate your current age in years
* write a poem (with at least two lines) and assign it to a variable
* print the poem to the console *with proper line formatting*
* assign your best friend's name to a variable
* YELL YOUR BEST FRIEND'S NAME
* get a new best friend
* and YELL HER NAME TOO

# The Pointer Metaphor

    let snack = "Apple"

![snack-apple](snack-apple.svg)

Think of a variable as an arrow **pointing** to a value.

# Changing Variables

You can assign and reassign variables at will.

```js
color = "blue"     // assign 'blue' to color
fruit = "berry"    // assign 'berry' to fruit
color + fruit      // 'blueberry'

color = "black"    // 'black'
color + fruit      // 'blackberry'
```

*Reaassignment* only changes the name of an object. It does *not* change the data inside the object.

This is analogous to removing a label from one box and placing it on a different box.

**Tip:** Did you get an `Identifier 'color' has already been declared` error? Try again without the `let`, or restart your JavaScript console (in a Browser, Reload the page; in a Terminal, quit and relaunch `node`).

# Many pointers can point to the same thing

```js
let fruit = "Apple"
let snack = fruit
```

![snack-fruit](snack-fruit.svg)

After this both `snack` and `fruit` are *pointing* to the same *value*

This is analogous to placing two labels on the same box.

# Return values are new

Most messages return *new* values:

```js
let fruit = "banana"
let snack = fruit.toUpperCase()
```

![fruit-banana-snack-banana](fruit-banana-snack-banana.svg)

`"banana"` and `"BANANA"` are two *different values* in memory. The original value is still sitting around and still pointed to by `fruit`.

# Changing Values

Most messages do not change the data inside the object.

```javascript
let color = "blue"
color.toUpperCase()     // "BLUE"
color                   // "blue"
```

This is true for all strings, since strings in JavaScript are *immutable*. Any message that transforms a string will return you an entirely new string.

But some messages **do** change the contents!

# Changing Values Example

Let's say we have a friend named Joe and his birthday is Independence Day, 1990.

We will use the built-in JavaScript `Date` type to represent a year+month+day.

```js
let independenceDay1990 = new Date(1990, 6, 4)
independenceDay1990.toDateString()    // 'Wed Jul 04 1990'
let joesBirthday = independenceDay1990
```

Then we learn that Joe's birthday is actually Bastille Day. No problem, we'll just tweak the variable.

```js
joesBirthday.setDate(14)
joesBirthday.toDateString()           // 'Sat Jul 14 1990'
```

But what happened to the original date?

```js
independenceDay1990.toDateString()    // 'Sat Jul 14 1990'
```

**Oops!** Our program now thinks Independence Day 1990 was on July 14.
This is a problem. What's the solution?

# Constants: Variables that Aren't Variable

* the keyword `const` is just like `let`, but also *prevents reassignment*

```javascript
const pi = 3.14159;
```

* the value of a `const` is *constant* after it's been set once
  * if you try to change it, you get an error

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
