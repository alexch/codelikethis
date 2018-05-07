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

# Example

<!--
Include screenshot of github feed here with boxes outlining
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

For every given frame

- Any changes within that time slot are recorded.
- Interdependencies between components are calculated.
- The next state of the interface is generated.
- The frame is rendered to the browser.

# Virtual DOM 6

This lets you as a programmer

- Declare the page you want.
- Decide how to handle change when it occurs.
- Allow React to build the page for you when changes happen.

# Declarative Intent 1

- React lets you to **declare** what you want the page to be.

        @@@javascript
        ReactDOM.render(React.createElement(
          'h1',
          null,
          'Hello, React!'
        ), document.getElementById('root'));

# Declarative Intent

Given a `<root>` element exists the result is:

```
<root>
  <h1>Hello, React!</h1>
</root>
```

# Declarative Intent

- Something a little more complicated

        @@@javascript
        const element = React.createClass({
          render: function () {
            return React.createElement(
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
            );
          }
        });
        const container = document.getElementById('root');
        ReactDOM.render(element, container);

const container = document.getElementById('root');
ReactDOM.render(element, container);

# Declarative Intent

Given a `<root>` element exists the result is:

```
<form id="my-form">
  <input id="create" type="text" placeholder="something"/>
</form>
```

But when the form initiates a `onSubmit` event React will handle the changes using the `handleSubmit` handler function.

# Declarative Intent

- Accepts a description of the components that make up the page, and what DOM node to **render** the results to.

        @@@javascript
        ReactDOM.render()
        // API signature
        ReactDOM.render(element, container[, callback])

- `element` => The DOM element and children to generate.
- `container` => What DOM element to generate within.
- `callback` => Optional function to call after generation.
- [ReactDOM.render API Docs](https://reactjs.org/docs/react-api.html#createelement)

# Declarative Intent

- Accepts an element type, props of the element, and child elements.

        @@@javascript
        React.createElement()
        // API signature
        React.createElement(
          type,
          [props],
          [...children]
        )

- `type` => A DOM element like `<div>`, `<form>` or `<h1>`.
- `props` => The element properties like `id`, `class`, `placeholder`, `onChange`, or `onSubmit`.
- `children` => Child elements to nest within the generated element.

# Functional Behavior

# Simple API

# Component Oriented
