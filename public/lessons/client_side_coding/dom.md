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

# The `window`

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

# Adding HTML

* brute force (raw HTML strings)

```javascript
document.write("<p id='message'>hi</p>");  // :-( this freaks out Firebug Console

var message = document.getElementById('message');
message.innerHTML = "<b>bye</b>!";
```

* programmatically with JS

```js

let target = document.getElementById('someElement')

let paragraph = document.createElement('p')
paragraph.textContent = "I’ve seen things you people wouldn’t believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhauser gate. All those moments will be lost in time, like tears in rain."

target.appendChild(paragraph)
```

# Altering HTML Elements

* Target an element through a DOM query and assign it to a variable
* Use the reference to the element to manipulate existing properties
  * Or add entirely new properties

# the style property

* acts like a hash with properties for most CSS attributes
* CSS uses dashes; JavaScript uses camelCase

        div.style.backgroundColor = "#FF0000";

# Events

* When a user does something, it generates an *event*
  * e.g. click on a button
  * the *target* is the element that was affected
  * the *event* is an object describing the details
  * the *listener* is a function you wrote
* "listener" is just another name for "callback" (for events)
  * also called "handler"

## Event Name Gotcha

* the name of the property is **not** camelCase
* the property name starts with "on" but the event name does **not** include "on"

# `return false`

* if the event listener returns false, all further processing stops
* usually used to stop a form from actually submitting after a handled `submit` event

# Many event types

* Mouse
    * mousedown, mouseup, click
    * mouseover, dblclick
    * and many more. There are a ton of mouse events. A ridiculous number really.
* Keyboard
    * keydown, keypress, keyup
* Window
    * load, unload, beforeunload
    * ready (jQuery only)
    * abort, error
    * resize, scroll, contextmenu
* Form
    * focus, blur
      * "blur" should probably have been "unfocus," but we're stuck with it now
    * change, select
    * submit, reset

# References

* DOM
    * <http://msdn.microsoft.com/library>
    * <http://www.w3schools.com/jsref>
    * [the Style object](http://www.w3schools.com/jsref/dom_obj_style.asp)
    * <http://www.w3schools.com/HTMLDOM>
    * [DOM objects and methods](http://www.howtocreate.co.uk/tutorials/javascript/domstructure) - "all properties, collections and methods of the W3C DOM that can be reliably used in all major DOM browsers"
* Events
  * <http://www.quirksmode.org/js/introevents.html>
  * <http://www.quirksmode.org/js/events_events.html>
  * <http://api.jquery.com/category/events/>
