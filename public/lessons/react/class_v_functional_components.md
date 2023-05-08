# Classes and Functions

React supports two ways of writing your Components

- as classes with a render method that returns JSX
- as functions that directly return JSX

Each has benefits, and drawbacks, but with the introduction of hooks in React functional components are becoming much more comon

# Classes, Pros and Cons

Classes are the original way of setting up a React component if you want access to lifecycle methods, and state.

Pros:
- direct access to your component's state, and lifecycle methods
- more representative of React "under the hood"

Cons:

- related operations are often split across lifecycle methods
- (relatively) complicated setup
- `this` and `bind`

# Functions, Pros and Cons

Functional components are a shorthand way of setting up a react componentn, and can be as simple as writing a function that returns a JSX element.

Pros:

- Simple syntax
- Shorter to write
- Don't need to worry about binding `this`
- Now with access to state, and the component lifecycle thanks to hooks
- Related operations can be bundled into a single hook

Cons:

- hooks are very new, so documentation is sparse
- an additional layer of abstaraction

# What are Hooks?

Hooks are a way to bring state, and life-cycle operations into functional Components. They are functions packaged with React that allow access to all the operations class based components have.

The two most common hooks are `useState` and `useEffect`

`useState` is used to set up, and manipulate state 

# Which Should I Use?

Both functional components, and class based components can be used side by side. Regardless of which method you use to setup your components they are used in the same manner, and you can even mix, and match class based, and functional components in the same application.

As always I recommend you use the way that makes the most sense to you.

# ...but

With the advent of hooks functional components are becoming much more common. In a matter of months functional components have become an industry standard thanks to their clean syntax, and ease of use so you should make an effort to learn all about hooks.

# Code Along: Convert a Class to a Function

Let's convert a class based component into a function!

Go ahead and clone down [this example code](https://github.com/Habenzy/class-comp-example) then run an `npm install` to bring in all the dependencies.

This is a simple class based React app that accepts an input in a form, and displays it as an `<h2>` on the page when the form is submitted.

Follow along as I transform this class based compopnent into a functional component!

# Compare and Contrast

![class vs. functional components](/images/func_v_class_comp.png)

# The Future of React

There are no plans to remove classes from React, so they will be supported for the forseeable future. It's still important to understand, and be able to use class based components.

**However** functional components can now do (practically) everything class based components can, and are much cleaner. Functional components are the way React will be written in the (near) future.