    topic name: "numbers"
    topic name: "type-coercion"
    link href: "https://floating-point-gui.de/"

# Numbers

- JavaScript has a default built-in type called `Number`.
- `Number` represents **decimal numbers**, such as `0`, `1`, `42`, `3.14159`, or `-2.71828`.
- JavaScript does **NOT** have a special type for Integers, like many other languages.

[MDN: JavaScript Numbers](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)

# Numerical Operators

The following operations work on numbers:

|Operand| Name                        |Example |=    |
|-------|-----------------------------|--------|-----|
| +     | addition                    | 3 + 2  | 5   |
| -     | subtraction                 | 3 - 2  | 1   |
| *     | multiplication              | 3 * 2  | 6   |
| /     | division                    | 3 / 2  | 1.5 |
| %     | modulus ("remainder")       | 3 % 2  | 1   |
| **    | exponentiation ("power of") | 3 ** 2 | 9   |

# LAB: Age Calculator

Answer the following questions using interactive `node`, or a JavaScript file.

- How many seconds are in an hour?
- How many seconds are in a week?
- How many seconds are in a year?
- How many seconds old are you this year?
- How many years old is someone who is 1 billion seconds old?

# Order of operations

**Question**: What is `1` plus `2` times `3`?

>**Answer**: It depends on if there are parenthesis or not.

```js
(1 + 2) * 3 == 9
1 + (2 * 3) == 7
```

# Parentheses are Explicit

```js
4 + 5 * 6 ** 2 / 4
```

```js
(((4 + 5) * 6) ** 2) / 4
```

> When in doubt, use parentheses to make operation order explicit.
> Alternatively, break the expression up, and use variables.

# LAB: Is Divisible By

One number is **divisible** by another if you divide them and the **remainder** is 0.

Write some code to check the following

- Is `100` is divisible by `5`
- Is `100` is divisible by `8`
- Is `330` is divisible by `11`
- Is `337` is divisible by `7`

> Hint: remember the `modulus` operator `%`
  
# Strings vs. Numbers

Sometimes Strings and Numbers combine in ways that are unexpected.

```js
1 + 2
"1" + "2"
"1 + 2"
```

> In the above examples, Strings are **coerced** into Numbers. Why?

# Strings and Numbers Combined

Coercion of Strings to Numbers, or Numbers to Strings can be confusing.

Even though Strings and Numbers are different TYPES, JavaScript will convert one to the other.

```js
"1" + 2
// 12
```

> Why do you think the Number is converted to a String this time?

# Type Conversion

Instead of depending on implicit **coercion**, you can explicitly convert a Number to a String, or vice-versa.

```js
(12).toString()
// "12"
```

> Can you think of other ways to convert a Number to a String?

# Converting a String to a Number

There are also many ways to convert a String to a Number

One of the easiest and cleanest is the `unary +` operator

|expression |value|
|-----------|-----|
| +"12"     |  12 |
| +"012"    |  12 |
| +"0.2"    | 0.2 |
| +"cheese" | NaN |
| +"0"      |  0  |
| +""       |  0  |
| +" "      |  0  |

> See also: [MDN: String  to Number Conversion](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#convert_numeric_strings_and_null_to_numbers)

# Large Floating-Point Numbers

Some large numbers cannot be represented **accurately** in floating-point.

For instance, look closely at the results below.

```js
2 ** 53
// 9007199254740992


2 ** 53 + 1
// 9007199254740992
```

> This problem is not unique to JavaScript, but is more obvious because all numbers are floating-point decimals. More information at [IEEE 754 Double-Precision](https://en.wikipedia.org/wiki/Double-precision_floating-point_format)

# Decimal and Binary are Different

Try the following in `node`

```js
7 / 8
// 0.875
2 / 3
// 0.6666666666666666
7 / 9
// 0.7777777777777778
```

> Why would `7 / 9` round up, but `2 / 3` not?

# Some Decimals are Inaccurate

Try the following in `node`

```js
0.1 + 0.2
// 0.30000000000000004

0.3 - 0.2 - 0.1
// -2.7755575615628914e-17
```

> Why are these calculations inaccurate?

# Optional Number Exercises

- [FreeCodeCamp](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures)
  - Start with the challenge [Add Two Numbers](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/add-two-numbers-with-javascript)
  - Continue through the challenge [Compound Assignment With Augmented Division](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/compound-assignment-with-augmented-division)
