# OOJS: Object Creation

# A Million Ways To Make An Object

* from scratch
* constructors
* prototypes

# Making an object from scratch

    @@@ javascript
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

# Making an object from scratch, literally

The following code is equivalent to the previous slide, but easier to read:

    @@@ javascript
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
@@@js
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

# Classes and Constructors (old way)

Prior to 2015, and still today under the hood, a class *is* a pointer to a constructor function:

    @@@ javascript
    var Circle = function(radius) {
        this.radius = radius;
        this.diameter = radius * 2;
        this.circumference = function() {
            return Math.PI * 2 * this.radius;
        }
        this.area = function() {
            return Math.PI * this.radius * this.radius;
        }
    };

You shouldn't need to write code like this anymore, but you should be able to recognize it if you see it.

# Encapsulation?

Unfortunately, in JavaScript, *any* code with a pointer to an object can see *all properties* of that object.

This means that true encapsulation is difficult, since all instance variables are public, not private.

One way to make truly private variables is below, however...

> you probably should use public instance variables for a while 

since it will make your code easier to read and more compatible with the rest of your codebase, even if you lose some protection from information leakage

# Sidebar: private instance data using closures

* Remember that every function makes a closure
  * comprising its parameters and local variables
  * pointing to its enclosing scope(s)

        @@@ javascript
        var Circle = function(radius) {
            let diameter = radius * 2;
            this.circumference = function() {
                return Math.PI * diameter;
            }
            this.area = function() {
                return Math.PI * radius * radius;
            }
        };

        var circle = new Circle(2);
        circle.radius; // undefined!
        circle.area(); // 12.566370614359172

* "radius" and "diameter" are private to the scope of the `Circle` function's closure
* "circumference" and "area" are public (exposed) on each circle object
  * since they were defined inside the constructor, they can see "radius" and "diameter"
  * but their *callers* still can't see them
* this technique *cannot* be used with the `class` keyword
  * if someone's figured out a way to do it, please let me know :-)

# Constructors are for Initialization

the principle of *Complete Construction* says that after the constructor executes, the object is in a *valid* state

in practice, this means "pass all initial values into the constructor"

# Constructors are for Validation

constructors are a great place to *validate* your values

```
class Circle {
    constructor(radius) {
        if (radius <= 0) {
            throw('radius must be a positive number')
        }
        this.radius = radius;
    }
```

* that `if` statement is known as a "guard clause"
  * it guards against bad values
  * also known as "asserting your arguments" or "design by contract"
* validation is one of the most valuable features of object-oriented programming
  * it lets you write less code in other methods, confident that you don't have to check for bad data or boundary conditions

