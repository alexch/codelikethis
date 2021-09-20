# Event Listeners

Event Listeners are a special type of function in JavaScript that waits for a specified event, and then calls a callback function after that event has been triggered.

They are used in pretty much every single web application out there. They're how you make your page perform actions from clicking through links, to triggering animations when you scroll over a section of the page

---

# Common Usage

* `setTimeout(callback, int)`
  * Calls the callback function *after* `i` milliseconds

* `setInterval(callback, int)`
  * Calls the callback function *every* `i` milliseconds

* `element.addEventListener('event', callback)`
  * Used in client side JavaScript to add an event listener to a specific element taking a specified event and callback function to be triggered.

* `<div onclick="myFunction()" >...</div>`
  * Inline in your HTML, fires the specified function when the element (`<div>` in this example) is clicked
  * You can also directly alter the properties of the `<div>` with this event listener
  >NOTE: Unlike other event listeners you **do** want to call the function being set on the `onclick` property.

---

# Different Types of Events

* keyup

* keydown

* click

* load

* submit

* message

* error

[And many, many more...](https://developer.mozilla.org/en-US/docs/Web/Events)

---

# Event Listeners as HTML properties

You can set event listeners as properties directly on any HTML element. By adding an `on[event]` property, substituting the word `[event]` for the event of your choice you can fire a JavaScript function when that event happens.

For example you could create a `<p>` tag that turns the text red when clicked by adding an `onclick` property like so:

```html
<p onclick="turnRed()">Turns red when clicked</p>
.
..
...
<script>
function turnRed(evt) {
  evt.target.style.color = 'red'
}
</script>
```

Some elements have default event properties already attached to them. Most commonly `<a>` (anchor) tags which go to a specified page or html fragment `onclick`, and `<form>`s which sent a request, and reload the page when an `onsubmit` event is fired

---

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

* Bonus: What happens if you nest `div`s inside your `div` with different event listeners on them? Which events get triggered?

---

# Adding Event Listeners with JavaScript

As well as adding event listeners inline with HTML you can also attach event listeners to elements using JavaScript

This can help keep your code organized, and makes it easier to attach complicated functionality to an element.

`addEventListener` is a method that can be called on HTML elements in JavaScript. To use it you will first need to add a `<script>` tag to your HTML file which will allow you to add JavaScript to your file. Then target the element you want to add the event listener to with a DOM query, and assign it to a variable. Finally call the `addEventListener` method on it

---

# The Structure of the Event Listener in JavaScript

![event-listener-breakdown](/images/event-listener.png)

---

# addEventListener

* Method on HTML elements
* Takes two arguments
  * The first argument is a string that represents the event you're listening for
  * The second is a callback function to execute the desired action
* The callback can be defined in-line, or elsewhere in the code. 

---

# Lab: Highlighter

Now that you know a little about adding behavior to web pages let's create a website that allows you to highlight the text on the page!

The goal of this exercise is to create a simple webpage that contains a title, and a single block of text.

* When you highlight the block of text with your cursor the background color should turn yellow, and stay yellow when it's no longer highlighted
* When you hover your cursor over the title the text should change color, and change back when you're no longer hovering over it
* Bonus Challenge! Can you make so that only the background of the specific section of text you highlighted turns yellow?

---
