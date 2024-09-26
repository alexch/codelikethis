# Object Instance Methods

A method is a *function* attached to an *object* as a *property*.

```js
let stringUtils = {
  capitalize: function(word) {
    return word.charAt(0).toUpperCase() +
      word.slice(1).toLowerCase();
  },
  rant: function(opinion) {
    return opinion.toUpperCase() + '!!!';
  }
}

stringUtils.rant('i love pizza') // => 'I LOVE PIZZA!!!'
```

---

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

---

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

* remember, `this` means "this object I'm in *right now*" which in this case is the rectangle
* `this.height` on the *inside* of the object means the same as `rectangle.height` on the *outside*

---

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

```js
My name is Abby and I have 4 paws!
```

---

# Speak solution

```js
let dog = {
    name: 'Abby',
    paws: 4
}

dog.speak = function() {
  return "My name is " + this.name + " and I have " + this.paws + "paws"
}
```

---
