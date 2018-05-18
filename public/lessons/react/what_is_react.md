# What is React?

- React is a JavaScript library.
- That makes the building complex user interfaces easier.
- By breaking them up into small, simple, functional components.

# How?

- By providing tools to create components for each part of the interface.
- And manage the assembly of those components into the final resulting web page.

# What are components?

Components are individual pieces of a web page interface like:

- a user profile
- a comment
- a form
- an up-vote button

# Components Example

<!--
Include screen-shot of Github feed here with boxes outlining
the various sections of the web page as components.
-->

# Virtual DOM 1

- React controls the **rendering** of the page by using something called the [Virtual DOM](https://reactjs.org/docs/faq-internals.html).
- **DOM** stands for *Document-Object-Model*, and is managed by the browser.
- What this means in practice is that React keeps a copy of the web page structure and state in **memory**.
- This copy is accessible to JavaScript and React makes **changes** to the **real** DOM all at once instead of one at a time.

# Virtual DOM 2

Imagine an auction application with several parts.

- The items on auction right now with current prices.
- Your current bid, and your maximum bid ceiling.
- A SOLD label applied to an item that has closed.
- The items that will come up for auction soon.
- Recently sold items and their closing prices.

# Virtual DOM 3

In this application there are many changes that can happen at once.

- The items available can increase or decrease.
- Your current bid can increase in response to another bidder.
- The SOLD label can be applied or maybe removed.
- New items can appear with their opening prices.
- Recently sold items can appear with prices.

# Virtual DOM 4

React makes managing a complicated page like this easier by determining what the page needs to look like at any given rendered **frame**.

# Virtual DOM 5

For every given frame **React**:

- Records any changes within that time slot.
- Calculates the interdependencies between components.
- Generates the next state of the interface.
- Renders the frame to the browser.

# Virtual DOM 6

This lets you as the **programmer**:

- Declare the page you want.
- Decide how to handle change when it occurs.
- Delegate to React how to build the page for you when changes happen.

# Declarative Intent 1

React lets you to **declare** what you want the page to be.

```js
@@@javascript
ReactDOM.render(React.createElement(
  'h1',
  null,
  'Hello, React!'
), document.getElementById('root'));
```

# Declarative Intent 2

What is **Declarative Intent**?

Declarative means that you do not instruct the computer about what steps to take in order to achieve your desired result.

- You only tell the computer what you want.
- You must describe something that is possible.
- The computer figures out how to make it so.

!["make it so"](./make-it-so.jpg)

# Declarative Intent 3

Declarative is different than **Imperative** code which:

- Requires a sequence of ordered steps
- With transitions between the states

An imperative example would be manipulating the DOM like this:

```js
@@@javascript
window.onLoad function () {
  var heading = document.createElement('h1');
  var text = document.createTextNode('Hello DOM!');
  heading.appendChild(text);
  document.body.appendChild(heading);
}
```

# Declarative Intent 4

<p data-height="228" data-theme-id="dark" data-slug-hash="mLqoGK" data-default-tab="babel" data-user="Dangeranger" data-embed-version="2" data-pen-title="mLqoGK" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/mLqoGK/">mLqoGK</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

# Declarative Intent 5

Something a little more complicated

```js
@@@javascript
ReactDOM.render(
  React.createElement(
    "div",
    null,
    React.createElement(
      "form",
      {
        id: "my-form",
        onSubmit: this.handleSubmit
      },
      React.createElement(
        "input",
        {
          id: "create",
          type: "text",
          placeholder: "something"
        }
      )
    )
  ), document.getElementById('root'));
```

# Declarative Intent 6

Given a `<root>` element exists the result is:

```
<form id="my-form">
  <input id="create" type="text" placeholder="something"/>
</form>
```

But when the form initiates a `onSubmit` event React will handle the changes using the `handleSubmit` handler function.

# Declarative Intent 7

Accepts a description of the components that make up the page, and what DOM node to **render** the results to.

```js
@@@javascript
ReactDOM.render()
// API signature
ReactDOM.render(element, container[, callback])
```

- `element` => The DOM element and children to generate.
- `container` => What DOM element to generate within.
- `callback` => Optional function to call after generation.
- [ReactDOM.render API Docs](https://reactjs.org/docs/react-api.html#createelement)

# Declarative Intent 8

Accepts an element type, props of the element, and child elements.

```js
@@@javascript
React.createElement()
// API signature
React.createElement(
  type,
  [props],
  [...children]
)
```

- `type` => A DOM element like `<div>`, `<form>` or `<h1>`.
- `props` => The element properties like `id`, `class`, `placeholder`, `onChange`, or `onSubmit`.
- `children` => Child elements to nest within the generated element.

# Summary

React allows you to:

- Write JavaScript that builds HTML
- Write functions that update the HTML when state changes
- Delegate responsibility over the DOM to a library
- Be confident that the desired application state will be achieved