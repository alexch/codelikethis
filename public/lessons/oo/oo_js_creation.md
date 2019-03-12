# OOJS: Object Creation

# How To Make An Object

* from scratch
* with `new` and a constructor
* with a prototypes

# Making an object from scratch

```javascript
var circle = {};
circle.radius = 2;
circle.circumference = function() {
    return Math.PI * 2 * this.radius;
}
circle.area = function() {
    return Math.PI * this.radius * this.radius;
}
circle.radius; // 2
circle.area;   // function () { ...
circle.area(); // 12.566370614359172
```

# Making an object from scratch, literally

The following code is equivalent to the previous slide, but easier to read:

```javascript
var circle = {
    radius: 2,
    circumference: function() {
        return Math.PI * 2 * this.radius;
    },
    area: function() {
        return Math.PI * this.radius * this.radius;
    }
}
circle.radius; // 2
circle.area;   // function () { ...
circle.area(); // 12.566370614359172
```
* Note: remember the commas between elements
* Note: remember to **omit** the comma on the last element

# Constructors and "new"

* A constructor is a **function** that's called with the **new** keyword
* **new** says:
  * make a new empty object
  * set the object's *prototype* (more on this later)
  * set `this` to point to the object
  * invoke the function
  * return the object
      * <small> (unless the function returns a different object) </small>

# the `class` keyword

In 2015, JavaScript introduced a `class` keyword which is syntactic sugar on top of JavaScript's existing prototype-based inheritance. This new `class` syntax is much easier to understand than the previous system.

```js
class Circle {
  constructor(radius) {
    this.radius = radius;
    this.diameter = radius * 2;
  }
  circumference() {
    return Math.PI * this.diameter;
  }
  area() {
    return Math.PI * this.radius * this.radius;
  }
}
```

Use it like this:

    var circle = new Circle(2);
    circle.radius; // 2
    circle.area;   // function () { ...
    circle.area(); // 12.566370614359172

* A Note On Spelling:
  * "Circle" with a capital C is the constructor
  * "circle" with a lowercase C is the object (instance)

[MDN: classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)

# Stay classy, JavaScript

* This is the first time we've seen **classes** in JavaScript
* classes are for making lots of objects with the same methods and different data
* cookie analogy:
  * class ~= cookie cutter
  * instance ~= cookie
  * instance data ~= icing and sprinkles

# Constructors are for Initialization

the principle of *Complete Construction* says that after the constructor executes, the object is in a *valid* state

in practice, this means "pass all initial values into the constructor"

# Constructors are for Validation

constructors are a great place to *validate* your values

```javascript
class Circle {
    constructor(radius) {
        if (radius <= 0) {
            throw('radius must be a positive number')
        }
        this.radius = radius;
    }
```

* that `if` statement is known as a "guard clause"
  * it guards against bad values entering your algorithm
  * also known as "asserting your arguments" or "design by contract"
* validation is one of the most valuable features of object-oriented programming
  * it lets you *write less code* in other methods, confident that you don't have to check for bad data or boundary conditions


