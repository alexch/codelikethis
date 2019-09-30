# What is React?

- React is a JavaScript library from Facebook.
- Which makes building complex user interfaces easy.
- By breaking the UI up into small, composible, functional components.
- By providing tools to create components for each part of the interface.
- And manage the assembly of those components into the final resulting web page.

![react logo](/images/React-icon.svg)

# What are components?

Components are individual pieces of a web page interface like:

- a user profile
- a comment
- a form
- an up-vote button
- or any isolated part of a larger user interface

# Components Example

![react twitter components](/images/react-twitter-components.jpg)

# Virtual DOM

- React controls the **rendering** of the page by using something called the [Virtual DOM](https://reactjs.org/docs/faq-internals.html).
- **DOM** stands for *Document-Object-Model*, and is managed by the browser.
- What this means in practice is that React keeps a copy of the web page structure and state in **memory**.
- This copy is accessible to JavaScript and React makes **changes** to the **real** DOM all at once instead of one at a time.

# DOM Components

Imagine an application with several parts.

- User home page
- Profile photo
- Description
- Links to other web pages
- Uploaded photos
- Social feed
- Trending topics

# DOM Example


![react component tree](/images/react-component-tree.svg)

# Automatic Updates

For every change in the components **React**:

- Records any changes within a time slot.
- Calculates the interdependencies between components.
- Generates the next state of the interface.
- Renders the frame to the browser.

# Reacting to Changes

This lets you as the **programmer**:

- Declare the page you want.
- Decide how to handle change when it occurs.
- Delegate to React how to build the page for you when changes happen.

# Declarative UI

React lets you to **declare** what you want the page to be.

Declarative means that you do not instruct the computer about what steps to take in order to achieve your desired result.

- You only tell the computer what you want.
- You must describe something that is possible.
- The computer figures out how to make it so.

!["make it so"](/images/make-it-so.jpg)

# Declarative vs Imperative

Declarative is different than **Imperative** code which:

- Requires a sequence of ordered steps
- With transitions between the states

An imperative example would be manipulating the DOM like this:

```javascript
window.onLoad function () {
  var heading = document.createElement('h1');
  var text = document.createTextNode('Hello DOM!');
  heading.appendChild(text);
  document.body.appendChild(heading);
}
```

# Simple Example

<p data-height="228" data-theme-id="dark" data-slug-hash="mLqoGK" data-default-tab="babel" data-user="Dangeranger" data-embed-version="2" data-pen-title="mLqoGK" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/mLqoGK/">mLqoGK</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>


# React Form

Given a `<root>` element exists the result is:

```html
<div>
  <form id="my-form">
    <input id="create" type="text" placeholder="something"/>
  </form>
</div>
```

But when the form initiates a `onSubmit` event React will handle the changes using the `handleSubmit` handler function.

# React Form CodePen

<p class="codepen" data-height="265" data-theme-id="0" data-default-tab="js,result" data-user="Dangeranger" data-slug-hash="BXzKQM" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="React Form Example">
  <span>See the Pen <a href="https://codepen.io/Dangeranger/pen/BXzKQM/">
  React Form Example</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>

# ReactDOM Code

#### The final plain React Code after Babel transformation

```javascript
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

# ReactDOM function API

Accepts a description of the components that make up the page, and what DOM node to **render** the results to.

```jsx
ReactDOM.render()
// API signature
ReactDOM.render(element, container[, callback])
```

- `element` => The DOM element and children to generate.
- `container` => What DOM element to generate within.
- `callback` => Optional function to call after generation.
- [ReactDOM.render API Docs](https://reactjs.org/docs/react-api.html#createelement)

# React.createElement function API

Accepts an element type, props of the element, and child elements.

```jsx
React.createElement()
// API signature
React.createElement(
  type,
  [props],
  [...children]
)
```

- `type` => A DOM element name like `div`, `form` or `h1`.
- `props` => The element attributes like `id`, `class`, `placeholder`, `onChange`, or `onSubmit`.
- `children` => Child elements to nest within the generated element.

# Summary

React allows you to:

- Write JavaScript that builds HTML
- Write functions that update the HTML when state changes
- Delegate responsibility over the DOM to a library
- Be confident that the desired application state will be achieved

<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
