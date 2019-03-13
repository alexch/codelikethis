[old slides, should probably delete, or revise to use ES6 getter syntax]

# A digression: Getters and Setters

* If the data is public, you can set the property directly

```javascript
circle.radius = 7
```

* But sometimes you want to validate or modify the data; in that case you use a setter method

```javascript
circle.setRadius = function(newRadius) {
    if (newRadius < 0) {
        throw {name: "Bad Parameter", message: "A circle's radius may not be negative"}
    }
    this.radius = newRadius;
};
```

* You may also want to use a getter method for public data; this allows you to change the internal representation without changing all the calling code

```javascript
circle.getRadius = function() {
    return this.radius;
};
// then later, after changing the design
// to store "diameter" instead of "radius"...
circle.getRadius = function() {
    return this.diameter / 2;
};
```

* private data must be get and set via getters and setters

```javascript
var Circle = function(radius) {
    this.setRadius = function(newRadius) {
        radius = newRadius;
    }
    this.getRadius = function() {
        return radius;
    }
    //...
}
```

* Some people use a single method as a setter and a getter

```javascript
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
```

* but be careful, since it's easy to mistakenly use = instead of ()

```javascript
c = new Circle(2);
c.radius = 4;    // OOPS! setting a property instead of calling a setter
c.radius();      // YIKES! "radius" is not a function any more
// => TypeError: Result of expression 'c.radius' [4] is not a function.
```

   * this is especially gnarly since the error doesn't occur until long after you make the actual mistake
