# How to Use Hooks

Hooks can be used inside any functional React component, but they can *only* be used inside a functional React component, or a custom Hook. You can also use the same hook multiple times in the same component to set up different operations, or values.

You can **not** use Hooks in:

- the global name space
- class based components
- loops
- conditional statements
- nested functions
- anything that's not a functional React component

# How Hooks Work

Each Hook has a slightly different use case, but there are some aspects of Hooks which apply to all of them

Hooks are just functions that come with the React package that allow functional components to access state, and lifecycle methods. You can import them by targeting them directly in your import

> e.g. `import React, { useState } from 'react'`

Each Hook can be used multiple times, but it is worth noting that *order is important*.

Hooks must be rendered in the same order every time to work properly which is why you can't use hooks inside loops, or conditionals.

> Those curly braces around useState are important since `useState` is not the default export for the React package

# Benefits of Hooks

- the simplicity of a functional component with the power of a class based component
- allows related operations to be bundled together
- stateful logic can be reused between components
  - > Note: It's just the *logic* that is reused, not the values in state

# Types of Hooks

Your basic Hooks are:

- `useState`
- `useEffect`
- `useContext`

Less common Hooks are: 

- `useReducer`
- `useCallback`
- `useMemo`
- `useRef`
- `useImpreativeHandle`
- `useLayoutEffect`
- `useDebugValue`

`useState` and `useEffect` are by far the most common Hooks you will come across.

# useState

The first step to using `useState` is to import it from react

  - `import {useState} from 'react'`

Next we will set up two variables using array destructuring, and `useState`

  - `const [property, setProperty] = useState(initialValue)`

This creates a property in state, with an initial value, and an updater function. We can then use our `setProperty` function to update our state.

  - (evt) => {setProperty(evt.target.value)}

`setProperty` takes the new value we want to set as `property` in our state. Note that our updater function is often wrapped in an event handler.

# Lab: Name Display

In order to get more comfortable with `useState` we are going to create a functional React component that has a form with two input fields for a first name, and last name. When the form is submitted we will display the full name on the page.

- Create a new React App
- Modify `App.js` so it only contains a form with two inputs with a type of `text`, and a display area
- Using `useState` create three variables to keep track of:
  - the first name
  - the last name
  - the full name

- When the form is submitted display the full name on the page
- This **must be** a functional React component

# useEffect

Like `useState` `useEffect` must be directly imported from React before you can use it.

`useEffect` is used to setup what React refers to as "side effects." These are operations which fall outside the normal React render cycle, such as direct manipulation of the window objects, fetching data, setting up event listeners, or performing cleanup tasks.

You can think of `useEffect` as an all-in-one function for the `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount` lifecycle methods

`useEffect` can clean up after itself by returning a clean up function, but not every operation needs to be cleaned up.

# useEffect with no Cleanup

Effects that don't require a cleanup are actions that should be taken on every render. e.g. updating the `title` of your `document`. You can set these up by passing a callback function which performs the necessary action. This callback will be called every time the component renders, or rerenders

> If you wanted to update the title of the document from the previous lab to reflect the user's full name you could add a `useEffect(() => { document.title = fullName + "'s page"})` to your component

# cleaning up after useEffect

If you are drawing data from an outside source, or you're subscribing to an external service you probably need to clean up after your effect to prevent a memory leak. To do this `return` a function from your `useEffect` callback that performs the cleanup tasks

If we were subscribing to a chat service we might set it up something like this: 

```js
useEffect(() => {
    if(user) {
     chatService.openConnection(user.id);
    }

    return function() {chatService.close()}
  })
```

The function that is returned from our callback (`function() {chatService.close()}`) will be called during the `componentWillUnmount` lifecycle stage

# Fetching with useEffect

A very common use of `useEffect` is to fetch data, but you have to be a little careful when doing so...

Because `useEffect` combines `componentDidMount` and `componentDidUpdate` it fires its callback when the page first loads, and then again everytime the component re-renders. Changing state causes a re-render so if you forget to wrap your `setStateProperty` function in a gaurd clause you can get trapped in an infinite render cycle.

`useEffect` and `useState`combined should look something like this:

```js
function ShowData(props) {

  const [data, setData] = useState(null)

  useEffect(() => {
    if(!data) {
      fetch(someURL)
        .then(res => res.json())
        .then(jsonData => {
          setData(jsonData)
        })
    }
  })

  return (
    <div>
      { data }
    </div>
  )
}
```

# Lab: Fetch a Post

Let's practice our hooks by fetching some data, and putting it on the page!

- Create a new React App.
  - You will only need a single component at this point
- fetch a post from jsonplaceholder.typicode.com and display it on the page
- parse and format the post so that it looks nice when put onto the page
  - a sub component that acts as a shell for the post might be helpful here, but isn't required
- Display the author's name along with the post

> Bonus challenge: display *all* posts from jsonplaceholder, with authors, on the page

# Creating Custom Hooks

You can also create your own custom hooks by simply writing a function that performs the actions you want your hooks to take. This can be done to combine multiple hooks into one reusable operation, or to create an entirely new bit of functionality

# Hook Naming Conventions

It is important that you start the name of your custom Hook with `use` otherwise React won't recognize it as a valid hook.

> e.g. useMyCustomHook

# Refs, and Readings

- [Start here with the React docs](https://reactjs.org/docs/hooks-intro.html)