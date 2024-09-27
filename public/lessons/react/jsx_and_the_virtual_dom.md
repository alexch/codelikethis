# What is JSX?

- Mixes HTML and JavaScript together
- Makes building the UI easier
- Bound by HTML tags
- Is transformed into ReactDom code
- Is used everyday in React

# Starting JSX

- This is JSX Code

```jsx
ReactDOM.render(
  <h1>Hello, React!</h1>,
  document.getElementById('root')
);
```

# Resulting ReactDOM code

- This is the ReactDOM code the JSX creates

```jsx
ReactDOM.render(React.createElement(
  'h1',
  null,
  'Hello, React!'
), document.getElementById('root'));
```

# Resulting HTML in the DOM

```html
<div id="root">
  <h1>Hello, React!</h1>
</div>
```

# Key Concepts

- JSX feels like HTML (inside of JavaScript)
- JSX compiles to ReactDOM code
- JSX is a 'syntax extension' to JavaScript
- React can only render a single JSX component
  - **but** that component can have as many children as you want
- ReactDOM builds the HTML from the virtual DOM

# JSX can embed JavaScript expressions

- When writing JSX you can escape back to JavaScript using curly braces `{}`
- Any JavaScript expression can be used in JSX
  - **but** if the expresion doesn't return anything, nothing will be displayed

# Lab: React Greeter

Let's create a page that greets a user by name.

- create a new React app using `create-react-app`
- add the following object to `App.js`:

```js
let user = {
  firstName: Ada,
  lastName: Lovelace
}
```

- Greet your user by their first and last name
- When you change the object the greeting should change

# React Greeter: Classified

Hard coding a user object is OK, but it's not ideal. Let's look a little ahead and change our functional component into a class based component so we can leverage the awesome power of state!

- Replace the `function` keyword with the `class` keyword
- remove the parentheses after your component's name
- between the components name, and the opening curly brace add the following code: `extends React.Component`
  - the full line should now look like this `class MyComponent extends React.Component {`
- wrap your return statement in a render method

```js
  render() {
    return(
      //JSX goes here
    )
  }
}
```

# Leveraging State

Now let's track the state of our component!

- In our React component add a constructor
- Add a single object named `state` to the constructor
  - use the `this` keyword `this.state = {...}`
- In state add key value pairs for `firstName`, and `lastName`
- Change your JSX to greet the user in state rather than the hardcoded object

# React Greeter: Final Product

The App.js component should now look something like this:

```jsx
import React from 'react'

class App extends React.Component{
  constructor(){
    this.state = {
      firstName: 'Ada',
      lastName: 'Lovelace'
    }
  }

  render() {
    return (
      <h1>
        Hello, {this.state.firstName + ' ' + this.state.lastName}
      </h1>
    )
  }
}

export default App
```
