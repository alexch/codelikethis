# What is an Operator?

A character or group of characters that represent an action to be taken on one or more values

---

# Types of Operators

* Unary Operators

  * `+`

  * `delete`

  * `typeof`

  * `void`

  * Incrementers/Decrementers

* Binary Operators

  * Arithmetic Operators

  * Logical Operators

  * Comparison Operators

  * Assignment Operators

* Trinary Operators

  * The Ternary Operator

---

# The Unary `+`

The `+` operator can be used on an operand to convert that operand into a number.

```js
+"33"     // => 33
+"0"      // => 0
+""       // => 0
+" "      // => 0
+"cheese" // => NaN
```

---

# Delete

The `delete` operator removes the property passed as an operand

However `delete` cannot be used to completely remove objects

```js
let somePerson = { name: 'John', age: 42 };
let people = ['peter', 'paul', 'mary'];

delete somePerson 
// returns false, objectName still exists

delete somePerson.name
// deletes the property `name` on the object `somePerson`

delete arrayName[2]
// deletes the element mary at index two of the array `people`
```

---

# typeof

The keyword `typeof` is a unary operator that returns the type of the operand it's called on as a string.

```js
typeof function() {...}   // => 'function'
typeof "Hello, world!"    // => 'string'
typeof [1, 2, 3, "red"]   // => 'object'
typeof unassignedVariable // => 'undefined'
typeof false              // => 'boolean'
typeof null               // => 'object'
```

---

# Void

The `void` keyword takes an expression as an operand and causes it to return `undefined` rather than the normal return value of the expression.

```js
1 + 1           // => 2
void (1 + 1)    // => undefined
void sayHello() // => undefined

function sayHello() { 
  return "Hello, world!";
}

```

---

# Increment & Decrement

Increment and decrement are a special classification since they change their variable operand. Because they only accept one operand they are, by definition unary operators.

* `++` increments the value to the left by one

* `--` decrements the value to the left by one

```js
let myNumber = 3;

myNumber++
console.log(myNumber); // => 4

myNumber--
console.log(myNumber); // => 3

"cheese"++ // => NaN
```
> NOTE: increment and decrement only work on the numbers

---

# Arithmetic Operators

Takes two numbers and performs an operation on them

Returns a **new** number

* `+` addition

* `-` subtraction

* `*` multiplication

* `/` division

* `%` modulus

* `**` exponent

```javascript
2 + 1 // => 3
2 - 1 // => 1
2 * 2 // => 4
6 / 2 // => 3
6 % 3 // => 0
5 ** 2 // => 25
```

---

# Lab: Arithmetic

In the terminal go into a node environment, and try to figure out the answers to the following questions using arithmetic operators

  * Does JavaScript follow order of operations when parsing equations?

  * What happens when you try to add a string number (e.g. `"12"`) to an actual number?

  * What happens when you try and subtract a string number from an actual number?

  * What happens when you perform arithmetic operations on strings?

    * addition?

    * subtraction?

    * multiplication?

    * division?

  * Can you perform operations on `NaN`?

  * Assign a variable `x` to a numerical value

    * perform an operation on `x`, what is the return value? What is the value of x?

---

# Logical Operators

Evaluates two values or expressions and returns a boolean

* `&&` **and**; evaluates true if BOTH sides are truthy

* `||` **or**; evaluates true if EITHER side is truthy

* `!` **not**; inverts the truthyness/falsyness of the preceding value or expression

```javascript
'dog' && 'cat'     // => 'cat'
null && 'cat'      // => false
'dog' || 'cat'     // => 'dog'
undefined || 'cat' // => 'cat'
!true              // => false
!(7 < 5)           // => true
```

---

# Comparison Operators

Compares two values and returns a boolean

* `>` greater than

* `<` less than

* `>=` greater than or equal to

* `<=` less than or equal to

```javascript
5 > 3 // => true
5 < 3 // => false
5 >= 3 // => true
5 <= 5 // => true
```

---

# Equality Operators

* `==` equal to

* `===` identity

* `!=` not equal

* `!==` REALLY not equal

```javascript
5 == '5'        // => true
true == '1'     // => true

5 === '5'       // => false
true === '1'    // => false

'cat' != 'dog'  // => true
'cat' !== 'cat' // => false
```

---

# Equals vs Identity

There is a difference between the double equals `==` and triple equals `===`.

The double equals will try and **coerce** the operands so that are comparable. 

The triple equals will only perform a comparison on the values as they are.  

When comparing two values you should **always** use the triple equals.

---

# Lab: Compare and Contrast

Open up a node environment in your terminal, and let's play around with some comparison operators.

* What happens when you compare two strings with greater than `>`?

  * Did it give you the value you expected?

  * What do you think it's using to compare the two?

* What's the difference between the double equals `==` and triple equals `===`?

* Are two empty arrays equal to each other? How about two arrays with identical content?

---

# Assignment Operators

Modifies an existing  value by some amount.

* `=` sets the variable on the left equal to the value on the right

* `+=` adds the value to the right to the variable on the left

* `-=` subtracts the value to the right from the variable on the left

```javascript
let x = 7
let y = 3

1 += 2 // => 3
x = y  // x => 3
x += y // x => 10
x -= y // x => 4
```

---

# Lab: Assignments
Let's take a few minutes to play around with assignment operators, so go ahead open up a node environment in your terminal, and let's figure some things out.

* assign a variable `x` using the `let` keyword to a numerical value.

* assign a variable `y` using the `const` keyword to a numerical value.

* add a value to x using the `+=` operator. What's the value of `x`?

* add a value to y using the `+=` operator. Did you get the value you expected?

* create a variable named `string` that is a string.

  * add a value to `string` using `+=`, what is the value of `string`?

  * What is the value of `string` if you use `-=` instead?

---

# The Ternary Operator

The ternary operator, also called the conditional operator, is the only trinary operator in JavaScript, and is a way of handeling control flow.

```js
expression ? valueOne : valueTwo // If the expresion evaluates to true returns valueOne, otherwise returns valueTwo
```

---

# Documentation
[MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators#Unary)

---
