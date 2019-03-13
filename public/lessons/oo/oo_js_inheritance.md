    topic name: "object-creation"
    topic name: "class"
    topic name: "super"
    topic name: "extends"
    topic name: "instanceof"
    topic name: "duck-typing"
    topic name: "polymorphism"

# OOJS: Object Inheritance

# `extends`

In geometry, a square is a rectangle whose sides are equal. We can model this in code like this:

```
class Rectangle {
    constructor(length, width) {
        this.length = length;
        this.width = width;
    }
    
    area() {
        return this.length * this.width;
    }
}

class Square extends Rectangle {
    constructor(width) {
        super(width, width);
    }
}
```

The above Square *overrides* the constructor of its parent Rectangle.

It also *dispatches* up to its parent by using the magic word `super`, which means "call the version of this method that's declared in my parent".

Every method that's available in a rectangle is *also* available in a square, *even though Square does not explicitly define them*.

```javascript
let square = new Square(10);
square.area(); //=> 100
```

Square may also declare entirely new methods, or override (reimplement) any parent methods.

# Don't Overuse Inheritance!

Inheritance works best when: 

* used to share *implementation* but not *interface*
* hierarchies are *shallow* (less than 3 levels)

# What's your class?

Q: Given an object instance, how do you tell what class it is?

A: There are many ways, and they are all a bit weird.

```
> typeof(c)
'object'

> c instanceof Circle
true

> c.constructor.name
'Circle'

> Circle.prototype
Circle {}

> Circle.prototype.isPrototypeOf(c)
true
```

# What's your behavior?

In dynamic languages like JavaScript, it is generally considered bad form to ask an object what its class is.

The preferred approach is to instead assume that the object can do whatever you ask it to do, and to deal with the "`TypeError: c.foo is not a function`" exception if it can't.

This is called "polymorphism" -- the idea that there are many (*poly*) forms (*morphs*) that an object can take, and that several different *classes* of object might perform similar *behavior*.
 
It's also called "duck typing", from the old adage:

> If it looks like a duck, and quacks like a duck, then it's a duck.

 