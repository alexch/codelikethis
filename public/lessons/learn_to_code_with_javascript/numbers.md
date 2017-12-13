# Number

* JavaScript has a built-in type called `Number`.
* It represents decimal numbers, aka *floating-point* decimals.
* JavaScript does not have a special type for integers, unlike most other languages.

[MDN Docs for Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)

# Numbers

The following operations work on numbers:

|operand|name|example|=|
|---|---|---|---|
| + | addition |     3 + 2 | 5 |
| - | subtraction |  3 - 2 | 1 |
| * | multiplication | 3 * 2 | 6 |
| / | division | 3 / 2 | 1.5 |
| % | modulus ("remainder") | 3 % 2 | 1 |
| **| exponentiation | 3 ** 2 | 9 |

# LAB: Playing With Numbers

Answer the following questions using `node`:

* How many seconds are in an hour?
* How many minutes are in a week?
* How many seconds old are you?
* How many years old is someone who is 1 billion seconds old?

# Order of operations

Q: What is 1 plus 2 times 3?

# Order of operations

Q: What is 1 plus 2 times 3?

A: *It depends!*

    @@@ js
    (1 + 2) * 3 == 9
    1 + (2 * 3) == 7

# Parentheses Are Free

When in doubt, use parentheses!

# Strings vs. Numbers

Hmmm....

    1 + 2
    "1" + "2"
    "1 + 2"

# Strings plus Numbers

Hmmm again...

    "1" + 2

Even though Strings and Numbers are different TYPES, JavaScript converts one to the other.

But when two types meet, which one wins? 

# Type Conversion

The clearest solution is that you, the programmer, explicitly declare which type you want to win.

# Converting a Number to a String

    @@@ js
    (12).toString() // "12"
   
# Converting a String to a Number

There are [many ways to convert a string to a number in JavaScript](https://coderwall.com/p/5tlhmw/converting-strings-to-number-in-javascript-pitfalls).

The easiest and cleanest is `unary +`:

|expression|value|
|---|---|
| +"12" | 12 |
| +"0.2" | 0.2 |
| +"cheese" | NaN |
| +"" | 0 |

(Other methods can give bizarre results if the string contains letters or begins with a 0.)

# Type Coercion

If you don't explicitly do *type conversion* then JavaScript will "helpfully" convert the types for you.

This is called *type coercion* and just like with people, it's unethical and often backfires.

[todo: examples of type coercion, and unexpected results]

# Advanced Number Theory (optional)

# Math is hard

There are many types of numbers!

Each is useful in different situations.

In elementary school, we learned
 * *natural numbers* (aka *counting numbers*)
 * *integer numbers* (naturals, negatives, and zero)
 * *rational numbers* (aka *fractions* or *ratios*)

In high school, we learned *irrational*, *complex*, and *imaginary* numbers.

JavaScript numbers are different from all of those!

# Floating-Point Numbers

JavaScript numbers...

  * are decimals
  * stored in binary
  * with a fixed length 

This means that some rational numbers cannot be represented, which means that simple arithmetic may give unexpected results.

For instance, you can't go higher than about 9 quadrillion without seeing glitches in the matrix...

```
@@@ js
> 2**53 == 2**53+1
true
```

(This problem is not unique to JavaScript, but the fact that *all* numbers in JS are floating-point means that beginners can't avoid it.)

see [Wikipedia on IEEE 754 double](https://en.wikipedia.org/wiki/Double-precision_floating-point_format) aka Double-precision floating-point format or binary64

# Arithmetic

Try this in node:

    1 + 2
    3 - 4
    5 * 6
    7 / 8
    7 / 9

Whoa! What just happened?

# Floating Point Arithmetic is Bizarre

```
> 7/9 
0.7777777777777778

> 0.5 - 0.4 - 0.1
-2.7755575615628914e-17

> (0.8 - 0.7 - 0.1)/(0.5 - 0.4 - 0.1)
-3
```

# Okay, that's enough math!

