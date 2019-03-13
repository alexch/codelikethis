# OOJS: Object Creation

# How To Make An Object

* from scratch
* with `new` and a constructor
* with a "factory function" or "factory method"

# Making an object from scratch

```javascript
let circle = {};
circle.radius = 2;
circle.circumference = function() {
    return Math.PI * 2 * this.radius;
};
circle.area = function() {
    return Math.PI * this.radius * this.radius;
};
circle.radius; // 2
circle.area;   // function () { ... }
circle.area(); // 12.566370614359172
```

# Making an object from scratch, literally

The following code is equivalent to the previous slide, but easier to read:

```javascript
let circle = {
    radius: 2,
    circumference: function() {
        return Math.PI * 2 * this.radius;
    },
    area: function() {
        return Math.PI * this.radius * this.radius;
    }
};
circle.radius; // 2
circle.area;   // function () { ... }
circle.area(); // 12.566370614359172
```
* Note: remember the commas between elements
* Note: remember to **omit** the comma on the last element

# Methods are Functions, Not Values

> **Beware** of the difference between value properties and method properties!

* `circle.radius` is a *value* and evaluates to `2`
* `circle.area` is a *method* and evaluates to `function() {...}`
* `circle.area()` is a *method call* and evaluates to `12.566370614359172`

# the `class` keyword

In 2015, JavaScript introduced the `class` keyword which is syntactic sugar on top of JavaScript's existing prototype system. 

This new `class` syntax is much easier to understand than the previous system.

```javascript
class Circle {
  circumference() {
    return Math.PI * this.radius * 2;
  }
  area() {
    return Math.PI * this.radius * this.radius;
  }
}
```

Use it like this:

```javascript
let circle = new Circle();  // create a new Circle instance
circle.radius = 2;          // set its radius to 2
circle.area();              // call the area method, which
                            // returns 12.566370614359172 
```

* A Note On Spelling:
  * "Circle" with a capital C is the constructor
  * "circle" with a lowercase C is the object (instance)

[MDN: classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)

# Stay classy, JavaScript

This is the first time we've seen **classes** in JavaScript

Classes are for making lots of objects with the same methods, but different data

A *class* defines a **type** of object.

An *instance* is an **individual** object of that type.

> For example, there are many houses, but my house is yellow.

## The Cookie Analogy:

  * class ~= cookie cutter
  * instance ~= cookie
  * instance data ~= icing and sprinkles

# Constructors and "new"

* A constructor is a **function** that's called when you use the **new** keyword
* It's the very first method that's ever called on that particular instance

## What `new` does, in detail:

  * make a new empty object
  * set the object's class
  * set `this` to point to the object
  * call the constructor function
  * set `this` back to whatever it was before
  * return a reference to the object

# Constructors are for Initialization

the principle of *Complete Construction* says that after the constructor executes, the object is in a *valid* state

in practice, this means "pass all initial values into the constructor"

## A Better Circle:

```js
class Circle {
  constructor(radius) {
    this.radius = radius;
  }
  circumference() {
    return Math.PI * this.radius * 2;
  }
  area() {
    return Math.PI * this.radius * this.radius;
  }
}
```

Use it like this:

    let circle = new Circle(2);  // create a new Circle instance
                                 // with radius 2
    circle.area();              // call the area method, which
                                // returns 12.566370614359172 

## Q: Why is this better?

A: because it preserves *encapsulation* -- the idea that an object should be responsible for setting its own properties

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

# Factory Town

Sometimes one constructor just isn't enough.

When the constructor accepts different parameters from the ones that you have on hand, you could define a *factory function* like this:

```javascript
function circleFromDiameter(diameter) {
    return new Circle(diameter / 2);
}
```

The above is called a "factory function" since it constructs objects for you, based on your specifications. 

# Factory Methods

For convenience and code organization, factory functions are often attached to the *class* -- **not the instance** -- of the objects they create.

| Factory Function | Factory Method |
|---|---|
| `let c = circleFromDiameter(2)` | `let c = Circle.fromDiameter(2)` |

The factory method works *exactly the same way* as the factory function, but

* the factory function is in the *global namespace*
* the factory method is in the *class namespace* so it's more clear that it is meant to create one of *this class* of objects
 
 # Static Factory Methods 

To make a *factory method* in JavaScript, use the [`static`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/static) keyword:

```javascript
class Circle {
  static fromDiameter(diameter) {
    return new Circle(diameter / 2);
  }
  
  constructor(radius) {
    if (radius <= 0) {
        throw('radius must be a positive number')
    }
    this.radius = radius;
  }
  
  circumference() {
    return Math.PI * this.radius * 2;
  }
  
  area() {
    return Math.PI * this.radius * this.radius;
  }
}
```

and call it like this:

```javascript
let circle = Circle.fromDiameter(4)
```

> Note that (lowercase "c") `circle.fromDiameter()` does **not** work. **Static methods are attached to classes**, not instances.

# Classes and Constructors (old way)

Prior to 2015 -- and still today under the hood -- a class is really a pointer to a constructor function.

Defining a class required writing code like this:

```javascript
var Circle = function(radius) {
    this.radius = radius;
    this.diameter = function() {
      return this.radius * 2;
    }
    this.circumference = function() {
        return Math.PI * 2 * this.radius;
    }
    this.area = function() {
        return Math.PI * this.radius * this.radius;
    }
};
```

You shouldn't need to write code like this anymore, but you should be able to recognize it if you see it.