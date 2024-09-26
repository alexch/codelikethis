# OOJS: Prototypes

(this lesson is very technical; [inheritance](oo_js_inheritance) is a better place to start)

# Prototypes

* Every JS object has a prototype
* If a property lookup ("." or "[]") fails, then JS looks in the object's prototype also
  * recursively up the "prototype chain"
  * until you find a property with the right name, or you reach Object.prototype
* Prototypes work on all properties, not just functions

Example:

```javascript

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
```

* Side note: `Object.create` was recently added to the JS spec and may not be present in all browsers. You can implement it like this:

```javascript

if (!Object.create) {
    (function() {
        function F() {}
        Object.create = function(parent) {
            F.prototype = parent;
            return new F();
        };
    }());
}
```

# Names and Types

* By convention, constructors are capitalized, and represent a type name (or class name)
* You can use `instanceof` to check an object's type

```js
circle instanceof Circle  // true
circle instanceof Object  // also true
```

  * note: no parens required



# Using prototypes to extend core objects

* Remember, every object has a prototype, which is usually a *pointer* to a shared prototype defined on the constructor
* So if you add a property to these shared prototypes, it magically appears on all objects of that type
* Example: `Array.sum` -- adds all elements of an array together

```javascript
Array.prototype.sum = function() {
    var total = 0;
    for (var i=0; i<this.length; ++i) {
        total += this[i];
    }
    return total;
};
[1,2,3].sum()  // 6
```

> Q: what is "this" in the above code?

* Example: `String.reverse`

```javascript
String.prototype.reverse = function() {
    return this.split('').reverse().join('');
}
"abc".reverse() // returns "cba"
```

> Q: What object is actually doing the reversing?
  
# `apply` Yourself

* `apply` is a function that calls a function
* `apply` allows you to dynamically set `this` and `arguments`
* `apply` is called on the function itself using "."

```javascript
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
```