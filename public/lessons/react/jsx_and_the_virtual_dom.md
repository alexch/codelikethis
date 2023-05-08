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

# React Greeter extended

Hard coding a user object is OK, but it's not ideal. Let's look a little ahead and use state to store our user's name

- import `useState` from the React package
- set the first an last names of our user by passing them to `useState`
  - `const [firstName, setFirstName] = useState('Ada')`
  - `const [lastName, setLastName] = useState('Lovelace)`

More on Hooks, and `setState` later!


# React Greeter: Final Product

The App.js component should now look something like this:

```jsx
import React from 'react'

function App (){
  
  const [firstName, setFirstName] = useState('Ada')
  const [lastName, setLastName] = useState('Lovelace)

  return (
    <h1>
      Hello, {this.state.firstName + ' ' + this.state.lastName}
    </h1>
  )
  
}

export default App
```
