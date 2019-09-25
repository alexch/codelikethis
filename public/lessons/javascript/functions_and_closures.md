# Functions and Closures

"[JavaScript] is Lisp in C's clothing."
 - Douglas Crockford, JavaScript: The Good Parts

# Functions

http://kangax.github.com/nfe/ - Named function expressions demystified / Function expressions vs. Function declarations

A few ways to define a function:

## Function Declaration aka Named Function

```javascript
function add(x,y) { return x + y; }
```

## Function Expression

```javascript
let subtract = function(x,y) { return x - y; }
```

## Named Function Expression

```javascript
let factorial = function fact(x) {
  if (x == 1) {
    return 1;
  } else {
    return x * (fact(x-1));
  }
}
```

## Method

```javascript
let student = {
    gpa: 4.0,
    grade: function() {
        let gradeLetters = ["F", "D", "C", "B", "A"];
        return gradeLetters[Math.floor(this.gpa)];
    }
};
// or...
student.grade = function() { ... }
```

# Methods

* A method is a function "on" an object
* When a method is called via the dot operator, the "this" variable points to the object it was called on

## Technical definition of object:
* An object encapsulates state and behavior
    * state = properties
    * behavior = methods

## Sample code

```javascript
let alice = {firstName: 'Alice', lastName: 'Liddell'};
let bob = {firstName: 'Bob', lastName: 'Jones'};
alice.fullName = function() { return this.firstName + " " + this.lastName; }
bob.fullName = alice.fullName;  // Whoa, trippy!
alice.fullName(); //=> "Alice Liddell"
bob.fullName(); //=> "Bob Jones"
```

# Closures

<http://jibbering.com/faq/notes/closures/>

"lexical scope" vs. "[compiled?] scope"

# Map Filter Reduce in Emoji

![map filter reduce in emoji](/images/map-filter-reduce-in-emoji.png)

(source unknown)
