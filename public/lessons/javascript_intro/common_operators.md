# What is an Operator?

A character or group of characters that represent an action to be taken on one or more values

# Types of Operators

* Arithmetic Operators

* Logical Operators

* Comparison Operators

* Assignment Operators

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

# Logical Operators

Evaluates two values or expressions and returns a boolean

* `&&` **and**; evaluates true if BOTH sides are truthy

* `||` **or**; evaluates true if EITHER side is truthy

* `!` **not**; inverts the truthyness/falsyness of the preceding value or expression

```javascript
'dog' && 'cat' // => 'cat'
null && 'cat' // => false
'dog' || 'cat' // => true
undefined || 'cat' // => true
!true // => false
!(7 < 5) // => true
```

# Comparison Operators

Compares two values and returns a boolean

* `>` greater than

* `<` less than

* `>=` greater than or equal to

* `<=` less than or equal to

* `==` equal to

* `===` REALLY equal to

* `!=` not equal

* `!==` REALLY not equal

```javascript
5 > 3 // => true
5 < 3 // => false
5 >= 3 // => true
5 <= 5 // => true
5 == '5' // => true
5 === '5' // => false
'cat' != 'dog' // => true
'cat' !== 'cat' // => false
```

# Assignment Operators

Modifies an existing value
MUTATES the value

* `=` sets the variable on the left equal to the value on the right

* `+=` adds the value to the right to the variable on the left

* `-=` subtracts the value to the right from the variable on the left

```javascript
let x = 7
let y = 3

x = y // x => 3
x += y // x => 6
x -= y // x => 3
```
