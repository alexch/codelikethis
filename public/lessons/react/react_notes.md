# React Notes

React is a system for doing client-side components

What's a component? It's a *part* of your page. It's like a div that knows how to draw itself and respond to events, but it's *self-contained*.

How self-contained is it? It's so self-contained that it lives in its *own file*, like a `class` or NPM module. This file is called `JSX` and it *compiles* into `JS`.

Two kinds of data: props and state

  props are like arguments/parameters
  state is like a global, or a closure var


"the context" makes deeply nested components easier, but is otherwise ignorable

```
JSX --------> JS
      Babel
```

`create-react-app` generates a **lot** of code

"golden rule" -- don't query the DOM; use a "ref" instead

--- 
notes for Josh
 - got into data binding and one-way flow too soon
 - need to show example with HTML+screenshot way sooner
 - "frame" and rendering cycle too soon?

ReactDOM.render(React.createElement(
  'h1',
  null,
  'Hello, React!'
), document.getElementById('root'));
->
let e = React.createElement(
  'h1',
  {},
  'Hello, React!'
)
ReactDOM.render(e, document.getElementById('root'));

HTML has attributes, React has properties

don't answer so many questions that the students didn't ask first
  e.g.- "why babel? why can't browsers just interpret JSX?'
   \<script type="text/babel">

components as capitalized functions with self-closing TOO MUCH AT ONCE

skip Fragment demo -- too advanced

josh, you just said you wanted us to do a tutorial and now you're explainng the final code -- TMI
