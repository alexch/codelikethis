# The DOM

* stands for Document Object Model
    * "Document" = HTML page
    * "Object Model" = a way of describing page elements as JavaScript objects with properties and methods
        * elements (aka tags), attributes, styles, text, etc.
* "The DOM" is mostly standardized, but there are some browser differences

* Core DOM objects
    * Node, Element, Text, Comment, Attr

# The BOM

* stands for Browser Object Model
* global `window` variable has lots of nice properties
    * `window.location`
    * `window.navigator`
    * `window.history`
    * `window.screen`
    * `window.frames`
    * `window.document` -- hey, look! it's got some DOM properties too
    * `open()`, `close()`
    * `moveTo()`, `sizeTo()`
    * `alert()`, `prompt()`, `confirm()`
    * `setTimeout()`, `setInterval()`

# `window` vs. `document`

* `document` is the page
* `window` is the stuff around the page
* Kinda the same, but kinda different

```javascript
window === document   // => false
window.location === document.location // => true
```

# `window` is magic

* `window.location = "http://google.com"`
  * makes the browser load a new page
* global JS functions are properties of `window`

```javascript
window.x = 7;
x === 7; // true
y = 9;
window.y === 9 // works in reverse too
```

* core JS functions are methods of `window`

```javascript
parseInt('123')         // same
window.parseInt('123')  // thing
```

# Locating HTML Elements on the Page

## the easy way

  * `document.getElementById('article')`
  * this only works on elements that have a unique `id` attribute

## the CSS selector way

  * `document.querySelector('p.articles')` gets the *first* element that matches the given CSS selector
  * `document.querySelectorAll('p.articles')` gets *all* elements that match the given CSS selector
    * the returned item is a `NodeList` but you can treat it like an array

## the jQuery way

* `$('#article')` gets all elements that match the given CSS selector
* the returned item is a "jQuery Collection" which is a bit odd -- calling methods on it will affect *all* the contained elements
* jQuery is mostly considered obsolete these days, but it is still very popular and you should learn that `$(` usually means `jQuery(`

# Adding HTML with JavaScript

Here is a way to use "brute force" to insert raw HTML strings into your web page.

```javascript
var message = document.getElementById('message');
message.innerHTML = "Welcome to <b>Vermont</b>!";
```

> **However**, inserting HTML can be a security risk, and there are [better alternatives](https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent), especially if you are inserting plain text. 

# Altering HTML Elements

* Look at DOM reference

# the style property

* acts like a hash with properties for most CSS attributes
* CSS uses dashes; JavaScript uses camelCase

        div.style.backgroundColor = "#FF0000";

# the "px" problem

* CSS position and layout attributes need a unit
* the default is **not** "px"
  * except sometimes it works
  * which is worse than never working

        div.style.width = "10px";

* here's a handy helper method

```javascript
Number.prototype.px = function() {
    return "" + this + "px";
}

(5).px(); // "5px"
x = 10;
x.px();   // "10px"
```

* here's a trick for reading "px" values

```javascript
parseInt(h1.style.width)
```

# setTimeout

* You pass in a function (let's call it F) and a number (call it N)
* Execution returns *immediately*
* F gets called approximately N milliseconds later
  * not exact, but close enough for simple animation
* F is known as a **callback**
  * because the system calls it back at some later point
  * callbacks are used all over the place in JavaScript
    * events, Jasmine tests, jQuery, node.js, ...

# Wait a second... did you say ANIMATION???!?!

* Animating HTML is very exciting

```javascript
function slide(element) {
    element.style.position = "fixed";
    var x = 0;
    function step() {
        if (x > 1000) {
            // stop the animation
            return;
        } else {
            element.style.left = x.px();
            x += 10;
            // schedule the next animation
            setTimeout(step, 100);
        }
    }
    step();  // start animation
}
```

Scoping note: `step` is available inside the function itself because we defined it with a name, not anonymously.

see [animate.html](../javascript/animate.html) for a live example

# jQuery Animation

* jQuery has some fun methods to animate CSS attributes
* <http://api.jquery.com/animate>

```javascript
$("#logo").animate({
    backgroundColor: "#aa0000"
}, 1000 );
```

  * You choose the attribute(s) and their final value, plus the duration of the entire effect
  * jQuery calculates and interpolates the details
* jQuery UI has lots more
  * <http://jqueryui.com/>, not <http://jquery.com/>

# Testing Animation

* Use a "Mock Clock"
  * replace `setTimeout` with a different function during tests
  * this function keeps track of what would be called when
  * then "ticks" forward when asked
  * you can simulate speeding up and slowing down time
* In Jasmine:

```javascript
beforeEach(function() {
  jasmine.Clock.useMock();
});
//... call the code that calls setTimeout
jasmine.Clock.tick(500); // advance 500 msec
```

  * see thread [How to test timers?](http://groups.google.com/group/jasmine-js/browse_thread/thread/f987956c624840d1/73b3ff5391244b19)


# Headless DOM

* TODO: headless horseman image
* [env.js](http://www.envjs.com/) is a simulated browser environment written in JavaScript
* good for automated testing (e.g. continuous integration box)

# References
* DOM
    * <http://msdn.microsoft.com/library>
    * <http://www.w3schools.com/jsref>
    * [the Style object](http://www.w3schools.com/jsref/dom_obj_style.asp)
    * <http://www.w3schools.com/HTMLDOM>
    * [DOM objects and methods](http://www.howtocreate.co.uk/tutorials/javascript/domstructure) - "all properties, collections and methods of the W3C DOM that can be reliably used in all major DOM browsers"
* Animation
  * <http://api.jquery.com/category/effects/>
  * <http://api.jquery.com/animate/>
* Events
  * <http://www.quirksmode.org/js/introevents.html>
  * <http://www.quirksmode.org/js/events_events.html>
  * <http://api.jquery.com/category/events/>
