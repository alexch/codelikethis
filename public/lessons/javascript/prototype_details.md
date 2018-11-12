[old slides, should probably delete]

# Using `new` to set an object's prototype

* Reminder: **new** says:
  * make a new empty object
  * set the object's *prototype* to be the constructor function's prototype
  * set `this` to point to the object
  * invoke the function
* OK, so what is the function's prototype?
  * Answer: it's the value of the property named `prototype` on that function object
  * Every function has one

            function add(x,y) { return x+y; }
            add.prototype;    // some weird object with a "constructor" property pointing to add

* So, we can either replace the prototype

        var Bat = function() {
            this.legs = 2;
        }
        Bat.prototype = mammal;
        bat = new Bat();
        bat.lactates;     // true

* Or we can add properties to the prototype

        var Whale = function() {
            this.legs = 0;
        }
        Whale.prototype.locomotion = "swimming";
        Whale.prototype.lactates = true;
        whale = new Whale();
        whale.lactates;     // true

* And some of those properties can be functions

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

---
# Prototypical Inheritance

* Let's say we want to make a simple class hierarchy
  * Mammal > Cat

              function Mammal() {}
              function Cat() {}
* We want every cat to contain all properties of Mammal

        Cat.prototype = Mammal.prototype; // BAD
  * now setting properties on Cat.prototype will **also** set them on Mammal.prototype
* We want the cat's prototype to be a **new object** whose prototype is Mammal's prototype

        Cat.prototype = new Mammal(); // GOOD
  * Each cat has its own properties
  * All cats share a single prototype
  * All mammals share a separate, single prototype
  * cat.x will look first on cat, then on Cat's prototype, then on Mammal's prototype
* Yes, it's weird that the cat's prototype *is* a mammal, but so it goes
* Note: we probably want to clean up the "constructor" property so `instanceof` works

        Cat.prototype.constructor = Cat; // sigh

# Calling superclass methods

* One class can call its parent class' methods using `apply`

```javascript
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
```

* You can set a "superclass" (aka "_super" or "uber") property so you don't have to name the superclass every time

```javascript
Cube.prototype._super = Square.prototype;
Cube.prototype.area = function() {
    return this._super.area.apply(this) * 6;
}
```

# Disposable Function

* If you don't want to "waste" an instance of the superclass, you can make a new disposable function and steal its prototype

```javascript
function Square(){};
var F = function(){};
F.prototype = Rectangle.prototype;
Square.prototype = new F();
```

# extend

* Write a function that does all these bothersome steps in one

```javascript
function extend(Child, Parent) {
    var F = function(){};
    F.prototype = Parent.prototype;
    Child.prototype = new F();
    Child.prototype.constructor = Child;
    Child.prototype._super = Parent.prototype;
}
```

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

