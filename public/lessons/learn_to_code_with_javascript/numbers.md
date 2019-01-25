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
| **| exponentiation ("power of") | 3 ** 2 | 9 |

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

```js
(1 + 2) * 3 == 9
1 + (2 * 3) == 7
```

# Parentheses Are Free

> When in doubt, use parentheses!

(or, when there's any doubt, make your assumptions explicit)

# LAB: one nation, divisible

One number is *divisible* by another if you divide them and the *remainder* is 0.

Write code in `node` to figure out if...

  * 100 is divisible by 5
  * 100 is divisible by 8
  * 330 is divisible by 11
  * 337 is divisible by 7
  
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

The clearest answer is that you, the programmer, explicitly declare which type you want to win.

# Converting a Number to a String

```js
(12).toString() // "12"
```

# Converting a String to a Number

There are [many ways to convert a string to a number in JavaScript](https://coderwall.com/p/5tlhmw/converting-strings-to-number-in-javascript-pitfalls).
 
The easiest and cleanest is `unary +`:

|expression|value|
|---|---|
| +"12"  | 12 |
| +"012" | 12 |
| +"0.2" | 0.2 |
| +"cheese" | NaN |
| +"0"   | 0 |
| +""    | 0 |
| +" "   | 0 |

(Other ways can give bizarre results if the string contains letters or begins with a 0.)

# Type Coercion

If you don't explicitly do *type conversion* then JavaScript will "helpfully" convert the types for you.

This is called type *coercion* and just like with people, coercion is stressful and often backfires.

For instance, if you ask the user their age, and read it from a web form or keyboard input, it will be in a string. If you forget to explicitly convert that to a number before using it in a calculation, the results can be unexpected...

      > "30" - 1              // "30" is coerced into a number
      29            
      > "30" + 1              // 1 is coerced into a string
      '301'

([You Don't Know JS](https://github.com/getify/You-Dont-Know-JS/blob/master/types%20%26%20grammar/ch4.md) has way more information than you wanted to know on this subject.)

# Randomize it!

[Math.random](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) is your way to make things unpredictable!

Calling `Math.random()` returns a random *decimal* number between 0 and 1.

If you want a random *integer* you can multiply that decimal by a range, like this: 

```js
function randomInteger(min, max) {
  let range = max - min + 1; 
  return min + Math.floor(Math.random() * range);
}

console.log(randomInteger(1, 3));
```

# Math is hard

There are many types of numbers!

Each is useful in different situations.

In elementary school, we learned

 * *natural numbers* (aka *counting numbers*)
 * *integer numbers* (naturals, negatives, and zero)
 * *rational numbers* (aka *fractions* or *ratios*)

In high school, we learned *irrational*, *complex*, and *imaginary* numbers.

> JavaScript numbers are different from all of those!

# Floating-Point Numbers

JavaScript numbers...

  * use decimal notation
  * are stored in binary
  * have a fixed bit-length

Some rational numbers *cannot be represented* in floating-point, which means that simple arithmetic may give unexpected results.

For instance, you can't go higher than about 9 quadrillion without glitching...

```js
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
    2 / 3
    7 / 9

Wait a second...

```js
> 2/3
0.6666666666666666
> 7/9
0.7777777777777778
```

Why did it round up the last digit for `7/9` but not for `2/3`?

# Floating Point Arithmetic is Bizarre

```
> 7/9 
0.7777777777777778

> 0.5 - 0.4 - 0.1
-2.7755575615628914e-17

> (0.8 - 0.7 - 0.1)/(0.5 - 0.4 - 0.1)
-3

> 2**53 == 2**53+1
true

> 2**10000
Infinity
```

# Okay, that's enough math for now!
 
# LAB: exercises about numbers

* [FreeCodeCamp](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures)
    - start with the challenge [Add Two Numbers](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/add-two-numbers-with-javascript)
    - continue through the challenge [Compound Assignment With Augmented Division](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/compound-assignment-with-augmented-division)

