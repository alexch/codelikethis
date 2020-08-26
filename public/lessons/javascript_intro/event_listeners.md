# Event Listeners

Event Listeners are a special type of function in JavaScript that waits for a specified event, and then calls a callback function after that event has been triggered

# Common Usage

* `element.addEventListener('event', callback)`
  * Used in client side JavaScript to add an event listener to a specific element taking a specified event and callback function to be triggered.

* `<div onclick="myFunction()" >...</div>`
  * Inline in your HTML, fires the specified function when the element (`<div>` in this example) is clicked
  >NOTE: Unlike other event listeners you **do** want to call the function being set on the `onclick` property.

* `setTimeout(callback, int)`
  * Calls the callback function *after* `i` milliseconds

* `setInterval(callback, int)`
  * Calls the callback function *every* `i` milliseconds

# Event Listeners as HTML properties

The `onclick` property can be set on any html element.

Some elements have a default `onclick`. Namely `<a>` (anchor) tags which go to a specified page or html fragment.

There are a few ways to set the `onclick` property. The most common ways are inline in your HTML, or by adding an event listener to an element using DOM queries

# Lab: Event Listeners on Different Elements

Let's play around with setting event listeners on different elements!

* Create a new HTML file with the following elements in the body: `<a>`, `<div>`, `<button>`, `<form>`
  * inside the form add an `<input type=text>` element and an `<input type=submit>` element

```html
  <!DOCTYPE html>
<html lang="en">
<head>
  <title>Document</title>
</head>
<body>
  <a href="">I'm an anchor tag!</a>
  <div>Divs on divs on divs</div>
  <button>Click Me!</button>
  <form>
    <input type=text />
    <input type=submit />
  </form>
</body>
</html>
```

* When the `<a>` element is clicked send an alert that tells the user "Hello!"

* When the `<div>` is clicked change its background color

* When the `<button>` is clicked tell the user "goodbye" then disable the button

* When the `<form>` is submitted display an alert message

* Bonus: What happens if you nest divs inside your div with different event listeners on them? Which events get triggered?

# Different Types of Events

* keyup

* keydown

* click

* load

* submit

* message

* error

[And many, many more...](https://developer.mozilla.org/en-US/docs/Web/Events)

# The Structure of the Event Listener in JavaScript

![event-listener-breakdown](/images/event-listener.png)

# Event Listeners Using DOM Queries and JS

* Add a `<script>` tag to your HTML and either link to an external javascript file or write your javascript right in the `<script>` tag

* use a DOM query to target an HTML element and set it to a variable

* call the `addEventListener` method on the HTML element

* pass the event listener the event you want it to listen for as the first argument
> Note: The event should be a string. e.g. 'click'

* pass the callback as the second argument. You can either define it inline, or define it elsewhere, and pass the function name as the second argument
> Do NOT call the callback function when you pass it in!
