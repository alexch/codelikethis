todo: unify with other Events slides in dom_scripting

# The DOM in Review

* DOM stands for Document Object Model
    * "Document" = HTML page
        * also works for XML
    * "Object Model" = way of describing page elements as connected data objects

* you use methods like `document.getElementById()` to get a reference to a particular HTML element on the page
    * aka "pointer" or just "object"

* Core DOM objects:
    * Node, Element, Text, Comment, Attr


# Events

* When a user does something, it generates an *event*
  * e.g. click on a button
  * the *target* is the element that was affected
  * the *event* is an object describing the details
  * the *listener* is a function you wrote
* "listener" is just another name for "callback" for events
  * the metaphor is that it is sitting around listening for a particular thing to happen
  * listeners are also called "event handlers"

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


# `return false`

* if the event listener returns false, all further processing stops
* usually used to stop a form from actually submitting after a handled `submit` event
* related: `event.preventDefault()` does something very similar;generally, to be safe, event handlers do both:

```javascript
function handleClick(event) {
    event.preventDefault();
    alert("clicked!");
    return false;
}
```

# Many event types

* Mouse
    * mousedown, mouseup, click
    * mouseover
* Keyboard
    * keydown, keypress, keyup
* Window
    * load, unload, beforeunload
    * abort, error
    * resize, scroll, contextmenu
* Form
    * focus, blur
      * blur is the stupidest name ever in the history of stupid
      * should have been "defocus" or "unfocus" or "losefocus"
    * change, select
    * submit, reset

# References
* DOM
    * <http://msdn.microsoft.com/library>
    * [DOM objects and methods](http://www.howtocreate.co.uk/tutorials/javascript/domstructure) - "all properties, collections and methods of the W3C DOM that can be reliably used in all major DOM browsers"
* Events
  * <http://www.quirksmode.org/js/introevents.html>
  * <http://www.quirksmode.org/js/events_events.html>
  * <http://api.jquery.com/category/events/>
