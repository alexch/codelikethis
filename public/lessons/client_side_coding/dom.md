# The DOM

* stands for Document Object Model
    * "Document" = HTML page
        * also works for XML
    * "Object Model" = way of describing page elements
        * tags, attributes, styles, text, etc.
* Mostly standard
  * but there are some browser differences
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
    * `window.document` -- hey, look! it's the DOM
* methods too
    * `open()`, `close()`
    * `moveTo()`, `sizeTo()`
    * `alert()`, `prompt()`, `confirm()`
    * `setTimeout()`, `setInterval()`

# `window` vs. `document`

* `document` is the page
* `window` is the stuff around the page
* Kinda the same, but kinda different

```javascript
window === document
// => false
window.location === document.location
// => true
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

# Locating HTML Elements
* the hard way
  * traverse the document tree using DOM Node methods
* the somewhat easier way
  * `document.getElementsByTagName('p')[0]`
* the easy way
  * `document.getElementById('article')`
* the awesome way
    * `$('#article')`
    * jQuery + CSS Selectors FTW!

# $?

* dollar sign, like underscore, is a valid symbol name
* jQuery (and some other libraries) define `$` as a function that's like a souped-up `getElementById`
  * unfortunately, the object `$` returns is not an Element, but a wrapper
  * somewhat different API

# Adding HTML
* brute force (raw HTML strings)

```javascript
document.write("<p id='message'>hi</p>");  // :-( this freaks out Firebug Console

var message = document.getElementById('message');
message.innerHTML = "<b>bye</b>!";
```

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

# Events

* When a user does something, it generates an *event*
  * e.g. click on a button
  * the *target* is the element that was affected
  * the *event* is an object describing the details
  * the *listener* is a function you wrote
* "listener" is just another name for "callback" (for events)
  * also called "handler"

# How do I hook thee up? Let me count the ways.

> How do I love thee? Let me count the ways.

> I love thee to the depth and breadth and height

> My soul can reach, when feeling out of sight

> For the ends of Being and ideal Grace.

>  - Elizabeth Barrett Browning (1806-1861)

## Event Name Gotcha

* the name of the property is **not** camelCase
* the property name starts with "on" but the event name does **not** include "on"

## Event Binding

1. assign a *string* to the onwhatever property in HTML

        <div onclick='alert("hi")'>hi</div>

2. assign a function to the onwhatever property in JS

        <div id='hi'>hi</div>
        <script>
        div = document.getElementById('hi');
        div.onclick = function() {
            alert("hi");
            return false;
        }
        </script>

    * gotcha: can only attach a single listener

3. call the `addEventListener` method in JS

        div.addEventListener('click', function() {
            alert("hi");
        });

    * gotcha: in IE, you must use `attachEvent` instead

4. use jQuery's `bind` method

        $('#hi').bind('click', function() {
            alert("hi");
        });

4. use jQuery's convenience method for standard event types

        $('#hi').click(function() {
            alert("hi");
        });

    * gotcha: if you call `click()` with no parameters, it *triggers* a click

# `return false`

* if the event listener returns false, all further processing stops
* usually used to stop a form from actually submitting after a handled `submit` event

# Many event types

* Mouse
    * mousedown, mouseup, click
    * mouseover
* Keyboard
    * keydown, keypress, keyup
* Window
    * load, unload, beforeunload
    * ready (jQuery only)
    * abort, error
    * resize, scroll, contextmenu
* Form
    * focus, blur
      * blur is the stupidest name ever in the history of stupid
      * should have been "unfocus" or "losefocus"
    * change, select
    * submit, reset

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
