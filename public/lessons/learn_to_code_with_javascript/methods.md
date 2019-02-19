    link name: "The Secret Life of Objects",
         href: "http://eloquentjavascript.net/06_object.html",
         from: "EloquentJavaScript"

# Object Instance Methods

A method is a *function* attached to an *object* as a *property*.

```js
let stringUtils = {
  capitalize: function(word) {
    return word.charAt(0).toUpperCase() +
      word.slice(1).toLowerCase();
  },
  rant: function(opinion) {
    return option.toUpperCase() + '!!!';
  }
}

stringUtils.rant('i love pizza') //=> 'I LOVE PIZZA!!!'
```

# Methods Can Access Object State

`this` is a magic word that means "this object I'm in *right now*"

```js
let rectangle = {
    height: 10,
    width: 8,
    area: function() {
        return this.height * this.width;
    }
}

rectangle.height   //=> 10
rectangle.area()   //=> 80
```

# Extending objects on the fly

Since JavaScript is a *dynamic* language,
you can add methods to *any object*.


```js
let rectangle = {
    height: 10,
    width: 8,
}

rectangle.area()   //=> TypeError: rectangle.area is not a function

rectangle.area = function() {
     return this.height * this.width;
}

rectangle.area()   //=> 80
```

# Lab: Speak

Using the following definition:

```javascript
let dog = {
    name: 'Abby',
    paws: 4
}
```

Please *add a method* to `dog` called `speak` so the following code:

```javascript
console.log(dog.speak())
```

prints the following line:

```
My name is Abby and I have 4 paws!
```

# A Clever Trick: Extending System Classes

You can add methods to *all objects of the same type* like this:

```js
"banana".capitalize() //=> TypeError: "banana".capitalize is not a function

String.prototype.capitalize = function() {
      return this.charAt(0).toUpperCase() +
        this.slice(1).toLowerCase();
    }

"banana".capitalize() //=> "Banana"
```

`String.prototype` is a special object whose properties (including methods!) are made available to **all strings**.

# Clever = Danger

This clever trick is useful but dangerous. Don't outsmart yourself!

> "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it." - Brian Kernighan

Specifically, if you change the definition of basic types, you might introduce bugs somewhere else in your program -- possibly in code that you didn't even write yourself!

That's why extending system classes is sometimes called by the derogatory term "monkey patching".

