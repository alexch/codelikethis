# What is an Operator?

An OPERATOR is a SYMBOL that represent an OPERATION to be taken on one or more VALUES

Operators can be represented by one or more characters.

> e.g. `+`, `-`, `*`, `||`, `&&`

---

# Types of Operators

- Unary Operators
  - **One operator with one value**

- Binary Operators
  - **One operator with two values**
  - Arithmetic Operators
  - Logical Operators
  - Comparison Operators
  - Assignment Operators

- Trinary Operators
  - **One operator with three values**
  - The Ternary Operator

---

# The Unary `+`

The `+` operator can be used on a single value to convert that value into a number.

```js
+'33'     // => 33
+'0'      // => 0
+''       // => 0
+' '      // => 0
+'cheese' // => NaN
```

---

# typeof

`typeof` is a unary operator that returns the **type** of the operand

```js
typeof function() {...}   // => 'function'
typeof "Hello, world!"    // => 'string'
typeof [1, 2, 3, "red"]   // => 'object'
typeof unassignedVariable // => 'undefined'
typeof false              // => 'boolean'
typeof null               // => 'object'
```

---

# Increment and Decrement

Increment and decrement change their variable operand.

- `++` increment the **variable** by one
- `--` decrement the **variable** by one

```js
let myNumber = 3;

myNumber++
console.log(myNumber); // => 4

myNumber--
console.log(myNumber); // => 3

"cheese"++             // => NaN
```

> NOTE: Increment and decrement only work on variables which have a Number value.

---

# Arithmetic Operators

Accept two number values and perform an operation on them.

Returns a **NEW** number as a result.

- `+` Addition
- `-` Subtraction
- `*` Multiplication
- `/` Division
- `%` Modulus
- `**` Exponent

```js
2 + 1  // => 3
2 - 1  // => 1
2 * 2  // => 4
6 / 2  // => 3
6 % 3  // => 0
5 ** 2 // => 25
```

---

# Lab: Arithmetic

Open a terminal and start `node`, or create a new JavaScript file.

Determine answers to the following questions using arithmetic operators.

- Does JavaScript follow order of operations when parsing equations?
- What happens when you try to add a string number (e.g. `"12"`) to a number?
- What happens when you try and subtract a string number from a  number?
- What happens when you perform arithmetic operations on strings?
  - Addition?
  - Subtraction?
  - Multiplication?
  - Division?
- Can you perform operations on `NaN`?

---

# Logical Operators

Evaluate two expressions and return a boolean

- `&&` **and**; returns `true` if BOTH sides are considered truthy
- `||` **or**; returns `true` if EITHER side is considered truthy
- `!` **not**; inverts the result of the preceding expression

```js
'dog' && 'cat'     // => 'cat'
null && 'cat'      // => false
'dog' || 'cat'     // => 'dog'
undefined || 'cat' // => 'cat'
!true              // => false
!(7 < 5)           // => true
```

---

# Comparison Operators

Compare two values and returns a boolean

- `>` greater than
- `<` less than
- `>=` greater than or equal to
- `<=` less than or equal to

```js
5 > 3 // => true
5 < 3 // => false
5 >= 3 // => true
5 <= 5 // => true
```

---

# Equality Operators

- `==` equal to
- `===` identical
- `!=` not equal
- `!==` not identical

```js
5 == '5'        // => true
true == '1'     // => true

5 === '5'       // => false
true === '1'    // => false

'cat' != 'dog'  // => true
'cat' !== 'cat' // => false
```

---

# Equals vs. Identity

There is a difference between the double equals `==` and triple equals `===`.

The double equals will try and **coerce** the operands so that are comparable.

The triple equals will only perform a comparison on the values as they are.

When comparing two values you should **always** use the triple equals.

---

# Lab: Compare and Contrast

Open up a node environment in your terminal, and let's play around with some comparison operators.

- What happens when you compare two strings with greater than `>`?
  - Did it result in the value you expected?
  - How are they being compared?
- Find a difference between the double equals `==` and triple equals `===`

---

# Assignment Operators

Modify an existing value by some other value.

- `=` sets the variable on the left equal to the value on the right
- `+=` adds the value to the right to the variable on the left
- `-=` subtracts the value to the right from the variable on the left

```js
let x = 7
let y = 3

x += 1 // x => 8
y += 3 // y => 6

x += y // x => 14
y -= x // x => -8
```

---

# Lab: Assignment

Open a terminal and start `node`, or create a new JavaScript file.

- Assign a variable `x` using the `let` keyword to a numerical value.
- Assign a variable `y` using the `const` keyword to a numerical value.
- Add a value to x using the `+=` operator. What's the value of `x`?
- Add a value to y using the `+=` operator. Did you get the value you expected?
- Create a variable named `string` that is a string.
  - Add a value to `string` using `+=`, what is the value of `string`?
  - What is the value of `string` if you use `-=` instead?

---

# The Ternary Operator

The **ternary** operator is the only **trinary** operator in JavaScript

```js
expression ? valueOne : valueTwo 
// If the expression evaluates to true returns valueOne
//   otherwise returns valueTwo
```

```js
let isAllowed = true;

return isAllowed ? 'You are allowed' : 'You are denied';
// => 'You are allowed'
```
