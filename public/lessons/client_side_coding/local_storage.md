# Local Storage

[LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) lets you save bits of data that will be there the next time that same user visits the same page on that same browser.

LocalStorage acts sort of like an object hash -- but you should use its `get` and `set` methods, not `[]` or `.` notation.  

# LocalStorage Example

<https://mdn.github.io/dom-examples/web-storage/>


# LocalStorage API

* set an item
```js
localStorage.setItem('myCat', 'Tom');
```

* get an item
```js
let cat = localStorage.getItem('myCat');
```

* remove an item
```js
localStorage.removeItem('myCat');
```

* clear all items
```js
localStorage.clear();
```

# Storing More Than Strings

* for LocalStorage, keys *and values* must be strings
* but you can use this **one weird trick** to save a nested object:

* set an item
```js
localStorage.setItem('myCat', JSON.stringify(cat));
```

* get an item
```js
var cat = JSON.parse(localStorage.getItem('myCat'));
```

# LocalStorage Lifespan

* LocalStorage is meant for *persistent* data
* it lasts until either *your code* clears it, or the *user* clears it, or the *browser* clears it
  * ... so even though it is persistent, your app should not *rely* on it being saved
