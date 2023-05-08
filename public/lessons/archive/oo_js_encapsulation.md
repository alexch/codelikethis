
# Encapsulation?

Unfortunately, in JavaScript, *any* code with a pointer to an object can see *all properties* of that object.

This means that true encapsulation is difficult, since all properties are public, and none are private.

One way to make truly private variables is below, however...

> you probably should use public instance variables for a while 

since it will make your code easier to read and more compatible with the rest of your codebase, even if you lose some protection from data leakage

# Sidebar: private instance data using closures

* Remember that every function makes a closure
  * comprising its parameters and local variables
  * pointing to its enclosing scope(s)

```javascript
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
```

* "radius" and "diameter" are private to the scope of the `Circle` function's closure
* "circumference" and "area" are public (exposed) on each circle object
  * since they were defined inside the constructor, they can see "radius" and "diameter"
  * but their *callers* still can't see them
* this technique *cannot* be used with the `class` keyword
  * if someone's figured out a way to do it, please let me know :-)

