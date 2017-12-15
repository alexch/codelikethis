# Variables

* A **variable** is a **name** for a value. 
* You give a value a name using the **assignment** operator 
    * It looks like an equal sign but is *not* a comparison.
    * often preceded by `let` as in "Let there be light" or "Let X equal 10".

```js
@@@ js
let color = "blue"
let fruit = "berry"
```

* Anywhere you would use a literal value, you can use a variable instead.

```js
@@@ js
color + fruit       // "blueberry"
fruit.toUpperCase() // "BERRY"
```

# Let there be confusion

* `let` is just one way to declare a variable in JavaScript
* `var` is a lot like `let` but has wider *scope* which is sometimes bad
* if you don't use either `let` or `var` then the variable becomes *global* which is usually bad
* Moral: *always use let* unless you have a good reason not to
  * but only use it once per variable name
  
```js
@@@js
> let x = 1
undefined
> let x = x + 2
SyntaxError: Identifier 'x' has already been declared
> x = x + 2
4
```

# The Warehouse Metaphor

![Warehouse from Raiders of the Lost Ark](warehouse.jpg)

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

    let seconds_per_minute = 60
    let minutes_per_hour = 60
    let hours_per_day = 24
    let seconds_per_day = seconds_per_minute * minutes_per_hour * hours_per_day

?

# Lab: Play In node

Let's spend a few minutes just playing around in node. Some things to try:

* write a poem and put it in a variable
* YELL THE POEM
* calculate 2 + 2 and more complicated things
* assign your best friend to a variable
* yell your best friend's name
* get a new best friend and yell her name too

# The Pointer Metaphor

    let snack = "Apple"

![snack-apple](snack-apple.svg)

Think of a variable as an arrow **pointing** to an object.

(Here "object" means generally "a location in memory" not necessarily a JavaScript "object" which we will get to shortly.)

# Changing Variables

You can assign and reassign variables at will.

```js
@@@ js
let color = "blue"
let fruit = "berry"
color + fruit           // 'blueberry'

color = "black"         // 'black'
color + fruit           // 'blackberry'
```

Changing a variable (using ASSIGNMENT) just changes the name of an object. It does *not* change the data inside the object.

This is analogous to a label being removed from one box and placed on a different box.

# Many pointers can point to the same thing

    @@@ js
    let fruit = "Apple"
    let snack = fruit

![snack-fruit](snack-fruit.svg)

After this both `snack` and `fruit`...

  * are *pointing* to the same *object*
  * have the same *value*

This is analogous to two labels being placed on the same box.

# Return values are new

most messages return *new* values

    @@@ js
    let fruit = "banana"
    let snack = fruit.toUpperCase()

![fruit-banana-snack-banana](fruit-banana-snack-banana.svg)

`"banana"` and `"BANANA"` are two *different objects* in memory

# Changing Values

Most messages do not change the data inside the object.

    let color = "blue"
    color.toUpperCase()     // "BLUE"
    color                   // "blue"

This is true for all strings, since strings in JavaScript are *immutable*. Any message that transforms a string will return you an entirely new string.

But some messages to some objects **do** change the contents!

```js
@@@ js
let a_day_in_1990 = new Date(1990, 2, 4)
let joes_birthday = a_day_in_1990

// then we learn that Joe is younger than we thought
joes_birthday.setYear(1999)
joes_birthday.toDateString()     // 'Thu Mar 04 1999'

// but what happened to the original date?
a_day_in_1990.toDateString()     // 'Thu Mar 04 1999' -- oops?
```    

# Summary: Variables

* variables are names for memory locations, which hold values
* *declaring* a variable says what its *scope* is
* *assigning* a variable changes which location it points to
* you can have many names for the same location
* sometimes values can change on the inside of a location
