# What is React?

- React is a JavaScript library from Facebook.
- Which makes building complex user interfaces easy by:
  - breaking the UI up into small, composible, functional components
  - providing tools to create components for each part of the interface
  - managing the assembly of those components into the final resulting web page

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
- This copy is accessible to JavaScript which React uses make **changes** to the **real** DOM as a batch update.

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
// When the Winow 'load' event fires, run the following JavaScript
(window.onLoad = function() {

  // Create the H1 Element
  const heading = document.createElement('h1');

  // Create the Text node and content
  const text = document.createTextNode('Hello DOM!');

  // Add the Text node to the parent H1
  heading.appendChild(text);

  // Add the H1 Element to the Body Element
  document.body.appendChild(heading);
})()
```

# Simple Example

```javascript
ReactDOM.render(
  <div>
    <h1>Reasons to love React!</h1>
    <ul>
      <li>Easier</li>
      <li>Reliable</li>
      <li>Fast</li>
    </ul>
  </div>,
  document.getElementById('root'));
```

<iframe height="350" style="width: 100%;" scrolling="no" title="Hello React" src="https://codepen.io/burlingtoncodeacademy/embed/BaNJRrQ?height=265&theme-id=light&default-tab=js,result&editable=true" frameborder="no" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href='https://codepen.io/burlingtoncodeacademy/pen/BaNJRrQ'>Hello React</a> by Joshua Burke
  (<a href='https://codepen.io/burlingtoncodeacademy'>@burlingtoncodeacademy</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>

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

<iframe height="265" style="width: 100%;" scrolling="no" title="React Form Example" src="https://codepen.io/burlingtoncodeacademy/embed/gOpoWBw?height=265&theme-id=light&default-tab=js,result&editable=true" frameborder="no" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href='https://codepen.io/burlingtoncodeacademy/pen/gOpoWBw'>React Form Example</a> by Joshua Burke
  (<a href='https://codepen.io/burlingtoncodeacademy'>@burlingtoncodeacademy</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>

# ReactDOM Code

#### The final plain React Code after Babel transformation

```javascript
ReactDOM.render(
  React.createElement(
    'div',
    null,
    React.createElement(
      'form',
      { id: 'my-form' },
      React.createElement(
        'input',
        {
          id: 'create',
          type: 'text',
          placeholder: 'something'
        }
      )
    )
  ),
  document.getElementById('root')
);
```

<h3>
  <a href="https://babeljs.io/en/repl#?browsers=&build=&builtIns=false&spec=false&loose=false&code_lz=EoUwhgxgLgIg8gWQHQCcQDsAmIUAoBQABIQDyYCWAbgHxHGkBmA9igLaHmYC8ARKwJ4BaZmx616xEuXQAHAK5QO3HhDRgoIHoSj8ZIXhoAeULTIA2kEAAsmZ7Cl4BnJqxBQr0gOY8A9OPokPiKs_oEUNAA0dJhMEHKu6FBInm4AomYgCVAAQvwAkpi4AOQoTExQRQCUlQDcQA&debug=false&forceAllTransforms=false&shippedProposals=false&circleciRepo=&evaluate=false&fileSize=false&timeTravel=false&sourceType=module&lineWrap=true&presets=es2015%2Creact%2Cstage-2&prettier=false&targets=&version=7.8.7&externalPlugins=">Live Example</a>
</h3>

# JSX

As well as using the `React.createElement` interface you can use JSX

- mixture of HTML and JavaScript
- Looks a lot like HTML
  - **but** you can escape to JavaScript with culy braces `{}`
- Slightly different syntax in some cases

# ReactDOM function API

Accepts a description of the components that make up the page, and what DOM node to **render** the results to.

```javascript
// Render function on ReactDOM
ReactDOM.render()

// API signature
ReactDOM.render(
  element,
  container,
  [callback] /* Optional*/
)
```

- `element` => The DOM element and children to generate.
- `container` => What DOM element to generate within.
- `callback` => Optional function to call after generation.
- [ReactDOM.render API Docs](https://reactjs.org/docs/react-api.html#createelement)

# React.createElement function API

Accepts an element type, props of the element, and child elements.

```javascript
// CreateElement function on ReactDOM
React.createElement()

// API signature
React.createElement(
  type,
  [props], /* Optional*/
  [...children] /* Optional*/
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
