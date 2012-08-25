# Object-Oriented JavaScript

"I think if one wants to make real progress in JS one needs to drag one's class-based-OO self out back and beat him to death." - Steve Conover

# Object vs. Object

* In JS, an "object" is just a hash
  * not very object-oriented
* To be object-oriented you need to add a few things
  * the "this" variable
  * constructors
  * prototypes

# Definition of Object

* An object encapsulates state and behavior
    * *state* aka data, properties, variables
    * *behavior* aka functions, methods, messages
    * *encapsulation* = put similar things together; keep dissimilar things apart

# True Object-Oriented Programming

* In pure OO, a method only directly uses two sources of data
    * parameters of the method
    * properties of the method's own object
    * cf. the Law Of Demeter
* All other data are manipulated via *messages* to other objects
    * i.e. methods

# "this" is it

* "this" is a magic variable that always points to the current object

        @@@ javascript
        var circle = {radius: 2};
        circle.circumference = function() {
            return Math.PI * 2 * this.radius;
        }
        console.log(circle.circumference()); // 12.566370614359172

* "this" allows one function (method) to operate on many states (instances)

        @@@ javascript
        var biggerCircle = {radius: 4};
        biggerCircle.circumference = circle.circumference;
        console.log(biggerCircle.circumference()); // 25.132741228718345

# ...but "this" isn't always it

* "this" is only set when you call a function *via* an object

        @@@ javascript
        circle1.circumference()      // OK -- this = circle1
        circle2['circumference']()   // OK -- this = circle2

* when called *sans* object, `this` points to the **global object** (usually `window`)

        @@@ javascript
        var g = circle.circumference;
        g();                        // BAD -- this = window, so this.radius = undefined, so result is NaN

  * this is a **terrible** mistake in the language design, even worse than that variables without "var" are global


# "this" and callbacks

TODO

* a "callback" is a function that will be called later, by someone else
* usually "this" is different

# `apply` Yourself

* `apply` is a function that calls a function
* `apply` allows you to dynamically set `this` and `arguments`
* `apply` is called on the function itself using "."

        @@@ javascript
        var add = function(x,y) { return x+y; }
        add.apply(null, [2, 3]); // returns 5

        var square = function() { return this.value * this.value; }
        var x = {value: 10}
        square.apply(x);  // returns 100
        var y = {value: 20}
        square.apply(y);  // returns 400

        var increaseBy = function(amount) { return this.value + amount; }
        increaseBy.apply(x, [4]); // returns 14
        increaseBy.apply(y, [5]); // returns 25

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

# Making an object from scratch, with literals

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
  * Protip: make a "done" element, so you don't have to remember, e.g.:

           DONE: null

# Constructors and "new"

* A constructor is a **function** that's called with the **new** keyword
* **new** says:
  * make a new empty object
  * set the object's *prototype* to be the function's prototype (more later)
  * set `this` to point to the object
  * invoke the function
  * return the object (unless the function returns a different object (more later))

# Making an object with a constructor

    @@@ javascript
    var Circle = function(radius) {
        this.radius = radius;
        this.circumference = function() {
            return Math.PI * 2 * this.radius;
        }
        this.area = function() {
            return Math.PI * this.radius * this.radius;
        }
    };
    var circle = new Circle(2);
    circle.radius; // 2
    circle.area;   // function () { ...
    circle.area(); // 12.566370614359172

* A Note On Spelling:
  * "Circle" with a capital C is the constructor
  * "circle" with a lowercase C is the object (instance)

* This is the first time we've seen **classes** in JavaScript
  * class ~= cookie cutter; instance ~= cookie
  * for making lots of objects with the same methods and different data

# Making an object with private data using closures

* Remember that every function makes a closure
  * comprising its parameters and local variables
  * pointing to its enclosing scope(s)

* We will use the radius **parameter** as private data

        @@@ javascript
        var Circle = function(radius) {
            this.circumference = function() {
                return Math.PI * 2 * radius;
            }
            this.area = function() {
                return Math.PI * radius * radius;
            }
        };
        var circle = new Circle(2);
        circle.radius; // undefined
        circle.area(); // 12.566370614359172

* "radius" is private to the scope of the Circle function's closure
* "circumference" and "area" are public (exposed) on each circle object
  * but since they were defined inside the constructor, they can see "radius"
* Totally bizarre, huh?

# You can also make private methods using closures

    @@@ javascript
    var Circle = function(radius) {
        var rSquared = function {
            return radius * radius;
        }
        this.circumference = function() {
            return Math.PI * 2 * radius;
        }
        this.area = function() {
            return Math.PI * rSquared();
        }
    };


# A digression: Getters and Setters

* If the data is public, you can set the property directly

        @@@ javascript
        circle.radius = 7

* But sometimes you want to validate or modify the data; in that case you use a setter method

        @@@ javascript
        circle.setRadius = function(newRadius) {
            if (newRadius < 0) {
                throw {name: "Bad Parameter", message: "A circle's radius may not be negative"}
            }
            this.radius = newRadius;
        };

* You may also want to use a getter method for public data; this allows you to change the internal representation without changing all the calling code

        @@@ javascript
        circle.getRadius = function() {
            return this.radius;
        };
        // then later...
        circle.getRadius = function() {
            return this.diameter / 2;
        };

* private data must be get and set via getters and setters

        @@@ javascript
        var Circle = function(radius) {
            this.setRadius = function(newRadius) {
                radius = newRadius;
            }
            this.getRadius = function() {
                return radius;
            }
            //...
        }

* Some people use a single method as a setter and a getter

        @@@ javascript
        var Circle = function(radius) {
            this.radius = function(r) {
                if (typeof(r) == 'undefined') {
                    return radius;
                } else {
                    radius = r;
                }
            }
            // ...
        }
        c = new Circle(2);
        c.radius();     // getter returns 2
        c.radius(4);    // setter returns nothing
        c.radius();     // getter returns 4

  * but be careful, since it's easy to mistakenly use = instead of ()

            @@@ javascript
            c = new Circle(2);
            c.radius = 4;    // OOPS! setting a property instead of calling a setter
            c.radius();      // YIKES! "radius" is not a function any more
            // => TypeError: Result of expression 'c.radius' [4] is not a function.

    * this is especially gnarly since the error doesn't occur until long after you make the actual mistake

# Prototypes

* Every JS object has a prototype
* If a property lookup ("." or "[]") fails, then JS looks in the object's prototype also
  * recursively up the "prototype chain"
  * until you find a property with the right name, or you reach Object.prototype
* Prototypes work on all properties, not just functions
* An object's prototype can only be set when it is created (mostly)
* Example:

        @@@ javascript

        var mammal = {lactates: true, legs: 4};

        var bat = Object.create(mammal);
        bat.legs = 2;
        bat.legs;     // 2
        bat.lactates; // true

        var horse = Object.create(mammal);
        horse.legs;     // 4
        horse.lactates; // true

        octohorse = Object.create(horse);
        octohorse.legs = 8;
        octohorse.legs  // 8


* Side note: `Object.create` was recently added to the JS spec and may not be present in all browsers. You can implement it like this:

        @@@ javascript

        if (!Object.create) {
            (function() {
                function F() {}
                Object.create = function(parent) {
                    F.prototype = parent;
                    return new F();
                };
            }());
        }

# Using `new` to set an object's prototype

* Reminder: **new** says:
  * make a new empty object
  * set the object's *prototype* to be the constructor function's prototype
  * set `this` to point to the object
  * invoke the function
* OK, so what is the function's prototype?
  * Answer: it's the value of the property named `prototype` on that function object
  * Every function has one

            @@@ javascript
            function add(x,y) { return x+y; }
            add.prototype;    // some weird object with a "constructor" property pointing to add

* So, we can either replace the prototype

        @@@ javascript
        var Bat = function() {
            this.legs = 2;
        }
        Bat.prototype = mammal;
        bat = new Bat();
        bat.lactates;     // true

* Or we can add properties to the prototype

        @@@ javascript
        var Whale = function() {
            this.legs = 0;
        }
        Whale.prototype.locomotion = "swimming";
        Whale.prototype.lactates = true;
        whale = new Whale();
        whale.lactates;     // true

* And some of those properties can be functions

        @@@ javascript

        var Circle = function(radius) {
            this.radius = radius;
        }
        Circle.prototype.circumference = function() {
            return Math.PI * 2 * this.radius;
        }
        Circle.prototype.area = function() {
            return Math.PI * this.radius * this.radius;
        }

        var circle = new Circle(2);
        circle.radius;  // this is 2; it's stored on the circle
        circle.area;    // this is a function; it's stored on Circle.prototype
        circle.area();  // this is a function call; inside it, "this" points to the circle

# When is a prototype not a prototype?

* The prototype of a function is not really that function's prototype
* Two properties
  * `__proto__` or `[[Proto]]` -- the hidden link to the prototype chain
  * `prototype` -- specifies the hidden link for objects created using this function and `new`
* Yes, this is maddening
  * but only if you think about it `:-)`

# Names and Types

* By convention, constructors are capitalized, and represent a type name (or class name)
* You can use `instanceof` to check an object's type

        @@@ javascript
        circle instanceof Circle  // true
        circle instanceof Object  // also true

  * note: no parens required

# Using prototypes to extend core objects

* Remember, every object has a prototype, which is usually a *pointer* to a shared prototype defined on the constructor
* So if you add a property to these shared prototypes, it magically appears on all objects of that type
* Example: Array.sum -- adds all elements of an array together

        @@@ javascript
        Array.prototype.sum = function() {
            var total = 0;
            for (var i=0; i<this.length; ++i) {
                total += this[i];
            }
            return total;
        };
        [1,2,3].sum()  // 6

  * Q: what is "this"?

* Example: Array.each -- apply a function to each element of an array

        @@@ javascript
        Array.prototype.each = function(operation) {
            for (var i=0; i<this.length; ++i) {
                operation(this[i]);
            }
        };
        [1,2,3].each(function(x) { console.log(10-x); }) // prints 9, 8, 7 to console

  * ...so now we can rewrite `sum` in terms of `each`

            @@@ javascript
            Array.prototype.sum = function() {
              var total = 0;
              this.each(function(x) {
                  total += x;
              })
              return total;
            };
            [1,2,3].sum()  // 6
            [4,5,6].sum()  // 15

  * Gotcha: this breaks "for x in a" for arrays

* Example: String.reverse

        @@@ javascript
        String.prototype.reverse = function() {
            return Array.prototype.reverse.apply(this.split('')).join('');
        }
        "abc".reverse() // "cba"

  * Q: What's actually doing the reversing?
  * Q: Why are we using "apply"?

# Prototypical Inheritance

* Let's say we want to make a simple class hierarchy
  * Mammal > Cat

              function Mammal() {}
              function Cat() {}
* We want every cat to contain all properties of Mammal

        @@@ javascript
        Cat.prototype = Mammal.prototype; // BAD
  * now setting properties on Cat.prototype will **also** set them on Mammal.prototype
* We want the cat's prototype to be a **new object** whose prototype is Mammal's prototype

        @@@ javascript
        Cat.prototype = new Mammal(); // GOOD
  * Each cat has its own properties
  * All cats share a single prototype
  * All mammals share a separate, single prototype
  * cat.x will look first on cat, then on Cat's prototype, then on Mammal's prototype
* Yes, it's weird that the cat's prototype *is* a mammal, but so it goes
* Note: we probably want to clean up the "constructor" property so `instanceof` works

        @@@ javascript
        Cat.prototype.constructor = Cat; // sigh

# Calling superclass methods

* One class can call its parent class' methods using `apply`

        @@@ javascript
        var Rectangle = function(height, width) {
            this.height = height;
            this.width = width;
        }
        Rectangle.prototype.area = function() {
            return this.height * this.width;
        }

        var Square = function(side) {
            Rectangle.apply(this, [side, side]);
        }
        Square.prototype = new Rectangle();
        Square.prototype.constructor = Square;

        s = new Square(10);
        s.area(); // 100

        var Cube = function(side) {
            Square.apply(this, [side]);
        }
        Cube.prototype = new Square();
        Cube.prototype.constructor = Cube;
        Cube.prototype.area = function() {
            return Square.prototype.area.apply(this) * 6;
        }
        Cube.prototype.volume = function() {
            return Rectangle.prototype.area.apply(this) * this.height;
        }

        c = new Cube(10);
        c.area();     // 600
        c.volume();   // 1000

* You can set a "superclass" (aka "_super" or "uber") property so you don't have to name the superclass every time

        @@@ javascript
        Cube.prototype._super = Square.prototype;
        Cube.prototype.area = function() {
            return this._super.area.apply(this) * 6;
        }

# Disposable Function

* If you don't want to "waste" an instance of the superclass, you can make a new disposable function and steal its prototype

        @@@ javascript
        function Square(){};
        var F = function(){};
        F.prototype = Rectangle.prototype;
        Square.prototype = new F();


# extend

* Write a function that does all these bothersome steps in one

        @@@ javascript
        function extend(Child, Parent) {
            var F = function(){};
            F.prototype = Parent.prototype;
            Child.prototype = new F();
            Child.prototype.constructor = Child;
            Child.prototype._super = Parent.prototype;
        }

* Several libraries have done it, in slightly different ways
  * prototype.js
  * Yahoo User Interface (YUI)
  * ...
* jQuery's extend does *not* do this; instead it merges the contents of two or more objects together into the first object
  * as it turns out, this is a completely different way to do inheritance in JS

# Resources

* <http://killdream.github.com/blog/2011/10/understanding-javascript-oop/index.html>
* <http://javascriptweblog.wordpress.com/2010/08/30/understanding-javascripts-this/>
* <http://yehudakatz.com/2011/08/11/understanding-javascript-function-invocation-and-this/>

# The Fine Print

> This work is copyright (C) 2010-2011 by Alex Chaffee. All rights reserved. Permission is granted to use this material for non-profit educational purposes, including self-education and open workshops. Use by educational institutions or for-profit classes must be licensed. For permission, please contact Alex Chaffee at alex@stinky.com.
