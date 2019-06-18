    topic name: "document-object-model"
    topic name: "dom-manipulation"
    topic name: "script-tags"
    topic name: "document"
    topic name: "finding-elements"
    topic name: "dom-nodes"
    topic name: "html-elements"
    topic name: "events"
    topic name: "event-handlers"
    topic name: "callbacks"

# DOM Scripting

"Scripting" is a term used when you're writing programs that don't do much *on their own*; instead scripts usually use other, more advanced programs, or are embedded within them.

"DOM Scripting" means using JavaScript to manipulate the DOM (page elements and contents) inside a web page, either during page load, or in response to user events, like clicking a button or selecting text.

# scripts as attributes

This is the simplest way to execute JavaScript inside a Web page.

```html
<button name="button" onclick="alert('Abracadabra!')">
    Magic
</button>
```

Try it out here: <button name="button" onclick="alert('Abracadabra!')">Magic</button>

`onclick` is an *attribute* that contains a *script* that pops up an alert box. Also known as an *event handler*.

(We will discuss several other ways to attach event handlers later in this lesson.)

# the script tag (no src)

Without a `src` attribute, it defines a script and *immediately executes* its code:

```html
<script>
  var message = "Shazam!"
  alert(message)
</script>
```

# the script tag (src)

With a `src` attribute, it *loads code from a separate file*, and and *immediately executes* it:

```html
<script src="tictactoe.js"></script>
```

This code expects a file named `tictactoe.js` to *exist on the server* in the same directory as the HTML file.

The `script` tag may appear in the `head` or in the `body`. Scripts are executed in top-to-bottom order.

> HINT: to be sure that your code executes after the page has been fully loaded, put your `<script>` tags at the *bottom* of the `<body>` section.

# `document`

In a DOM script, the current page is always available via the *global variable* named `document`.

In addition to providing many useful *functions*, it also provides some *properties*:

|Property|Description|
|---|---|
| `document.URL` | the URL of the current page, in the form of a string. |
| `document.location` | the URL of the current page, in the form of a Location object. |
| `document.location = 'http://example.com'` | causes the browser to visit that web page.|
| `document.title` | the *title* of the document, which appears inside windows and tabs.|
| `document.title = 'the joy of cooking'` | immediately changes the *title* of the document. Some apps use this to display, e.g., a count of unread messages, which the user can then see without switching tabs.|

<https://developer.mozilla.org/en-US/docs/Web/API/Document>

# Finding an Element by ID

If an element has an `id` attribute, you can get a *pointer* to that element with a single line of code:

```js
var element = document.getElementById(id);
```

Once you have a pointer to that element, you can manipulate it further. You can also log it to the console for further inspection using:

```js
console.log(element)
```

<https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById>

# Finding an Element by CSS Selector

```js
var element = document.querySelector('main div.preview > p')
```

This returns the first Element within the document that matches the specified selector (in this case, the first `<p>` that is a direct child of any `<div class='preview'>` that is in the `main` section).

<https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector>


# Using an Element

Once you find an element (using `getElementById` or any other way), you can start using it.

```js
var header = document.getElementById('header')
var text = header.textContent
```

There is also a property called `innerText` but it's confusing and implemented differently in different browsers.

<https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent>

# Nodes vs Elements

In the DOM, the term "node" means *almost any* item that you can find in the document tree.

When you're hunting for a function or property, sometimes it's on Node, and sometimes it's on Element. Make sure to check *both* of these documentation pages:

  * <https://developer.mozilla.org/en-US/docs/Web/API/Node>
  * <https://developer.mozilla.org/en-US/docs/Web/API/Element>

For instance, `attributes` is a property of Element, but `childNodes` is a property of Node.

# Other Node Types

An element is a particular type of node, and it's the most common, but beware, these are also nodes...

* Document, Element, Text, Comment, CDATASection, ProcessingInstruction, DocumentFragment, DocumentType, Notation, Entity, EntityReference

...and all of them have their own properties that are *not* part of the basic Node set.

> Also, this sense of "node" is **completely different** from the "node" in NodeJS. :-(

# Finding many elements

In addition to getting a *single* element by its `id` or a CSS selector, you can also ask the document to give *all* elements that match a certain criterion.

```js
var elements = document.getElementsByClassName('profile-picture')
```

> by *CSS Class* name

```js
var elements = document.getElementsByTagName('h2')
```

> by *Element* name

```js
var elements = document.querySelectorAll('h2.preview > p')
```

> by *CSS Selector* expression

These return *collection* objects, so you must write more code to get the actual element objects, or to check the collection's length.

# Events as functions

In JavaScript, *event handlers* are *callback functions*.

The classic example of an event handler is "onclick", i.e. "please call this function when the user clicks this button".

To attach an event handler,

1) Find the element, e.g.

```js
let button = document.getElementById('magic');
```

2) Attach the callback, like this:

```js
button.addEventListener('click', () => { alert('Abracadabra!') });
```

> NOTE: using the "fat arrow" for event handlers is a **very good idea** since fat arrows will restore the `this` variable to point to the same object as when the listener was added.

<https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener>

# Events by Reference

If you have already defined an event handler function, you can attach it by reference, like this:

```html
<button type="button" id="magic">Magic</button>
<script>
function sayMagicWord() {
    alert('Shazam!');
}
var button = document.getElementById('magic');
button.addEventListener('click', sayMagicWord)
</script>
```

> NOTE: if you attach a listener by reference, pass the *name* of the function only! Do not immediately *invoke* the function, like this:

```js
// BAD CODE, DO NOT USE
button.addEventListener('click', sayMagicWord())
```

This **calls the function** `sayMagicWord` when the listener is *attached* and tries to attach the *return value* of `sayMagicWord` (which will likely be `undefined`).

# Event Parameters

An event handler function can optionally accept a parameter -- usually called `event` (or just `e`) -- that contains [lots of information about the thing that just happened].

An [event object](https://developer.mozilla.org/en-US/docs/Web/API/Event) has many properties but the most important one is `event.target`, which points to the element where the action took place.

For instance, for a **click** event, `event.target` contains a pointer to the *button* that was clicked.

```html
<button type="button" id="presto">Presto...</button>
<button type="button" id="abra">Abra...</button>
<script>
var prestoButton = document.getElementById('presto');
var abraButton = document.getElementById('abra');

function sayMagicWord(event) {
  if (event.target === prestoButton) {
    alert('Change-o!');
  } else if (event.target === abraButton) {
    alert('Cadabra!');
  } else {
    alert('Shazam!');
  }
  console.log({event}); // for debugging
}

prestoButton.addEventListener('click', sayMagicWord)
abraButton.addEventListener('click', sayMagicWord)
</script>
```

(See the above script in action [here](magic.html))


# Event Bubbling & Capture

- Events are created by their elements
- After creation they move up the chain by default
- This behavior can be changed by using `cancel` on the listener

```html
<div onclick="alert('outer div')">OUTER DIV
  <div onclick="alert('inner div')">INNER DIV
    <p onclick="alert('paragraph')">Paragraph</p>
  </div>
</div>
```

<iframe height="265" style="width: 100%;" scrolling="no" title="bubble-events" src="//codepen.io/Dangeranger/embed/GbjpbP/?height=265&theme-id=0&default-tab=html,result" frameborder="no" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href='https://codepen.io/Dangeranger/pen/GbjpbP/'>bubble-events</a> by Joshua Burke
  (<a href='https://codepen.io/Dangeranger'>@Dangeranger</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>

# Event Diagram

![event flow diagram](/images/eventflow.svg)
