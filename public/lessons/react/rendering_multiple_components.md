# Rendering Multiple Components

Rendering lists of components is easy!

React natively knows how to deal with arrays of components, so if we need to render multiple components we can put them in an array, and then put the array directly into the JSX

Rendering arrays of components is automatic, but what if you have an array of *raw data* that needs to be presented on the page?

# Creating Arrays with `.map()`

Remember our old friends the array iterators? `.map()` is an especially useful iteration method for React

* `.map()` takes an array and returns a transformed new array
* `.map()` can be used to generate an array of components from an array of data
* Escape the JavaScript within JSX using `{}`

# `.map()` Example

```jsx
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li>{ number }</li>
  );
  return (
    <ul>
      { listItems }
    </ul>
  );
}

const numbers = [1, 2, 3, 4, 5];

ReactDOM.render(
  <NumberList numbers={numbers} />,
  document.getElementById('root')
);
```

[Example CodePen](https://codepen.io/Dangeranger/pen/mjaYPa)

# Lab: Rendering an Array of Components

Let's put this theory into practice!

Here is a simple React component that takes a quote, and author as props, and displays them on the page:

```jsx
//definition
function Quote(props) {
  return(
    <div>
      <h4>{ props.quote }</h4>
      <h6>~ <i>{ props.author }</i></h6>
    </div>
  )
}

//component being used
<Quote quote="It's a dangerous business going out your front door..." author="Bilbo Baggins" />

```

Create a new React application that displays a title (e.g. "Inspiring Quotes"), and no fewer than six instances of the `Quote` component defined above.

# Multiple Components with Keys

When rendering arrays of multiple elements it's best practice to attach a unique `key` property to them.

The `key` property is used internally by React to more effeciently display, and manage lists of components.

> Note: Not having a key property won't break your code, but you will get an error in your browser's console

# Components With Keys Example

```jsx

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li key={number.toString()}>
      { number }
    </li>
  );
  return (
    <ul>
      { listItems }
    </ul>
  );
}

const numbers = [1, 2, 3, 4, 5];
ReactDOM.render(
  <NumberList numbers={numbers} />,
  document.getElementById('root')
);
```

[Example CodePen](https://codepen.io/Dangeranger/pen/EpGzNw?editors=0011)

# Component Keys Explained

* Keys identify which components have changed, are added, or removed
* Arrays of Components should have unique keys
* Database IDs can make good Keys
* Indexes of the Components are a good backup

```jsx
function ListItem(props) {
  // Correct! There is no need to specify the key here:
  return <li>{props.value}</li>;
}

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    // Correct! Key should be specified inside the array.
    <ListItem key={number.toString()}
              value={number} />

  );
  return (
    <ul>
      {listItems}
    </ul>
  );
}

const numbers = [1, 2, 3, 4, 5];

ReactDOM.render(
  <NumberList numbers={numbers} />,
  document.getElementById('root')
);
```

[Why Keys are Important](https://reactjs.org/docs/reconciliation.html#recursing-on-children)
[Indexes Can Impact Performance](https://medium.com/@robinpokorny/index-as-a-key-is-an-anti-pattern-e0349aece318)

# Unique Component Keys

```jsx
Blog = (props) => {
  const sidebar = (
    <ul>
      {props.posts.map((post) =>
        <li key={post.id}>
          {post.title}
        </li>
      )}
    </ul>
  );
  const content = props.posts.map((post) =>
    <div key={post.id}>
      <h3>{post.title}</h3>
      <p>{post.content}</p>
    </div>
  );
  return (
    <div>
      {sidebar}
      <hr />
      {content}
    </div>
  );
}

const posts = [
  {id: 1, title: 'Hello World', content: 'Welcome to learning React!'},
  {id: 2, title: 'Installation', content: 'You can install React from npm.'}
];
ReactDOM.render(
  <Blog posts={posts} />,
  document.getElementById('root')
);
```

[Example CodePen](https://codepen.io/Dangeranger/pen/vavwzM?editors=0010)

# Embedding Array.map() in JSX

* JSX can be escaped, and then embed JSX in the escaped JavaScript
* Arrya.map() can then be included inline
* Multiple nested embeddings signals that a Component might need extraction

```jsx
NumberList = (props) => {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <ListItem key={number.toString()}
              value={number} />

  );
  return (
    <ul>
      {listItems}
    </ul>
  );
}
```

```jsx
NumberList = (props) => {
  const numbers = props.numbers;
  return (
    <ul>
      {numbers.map((number) =>
        <ListItem key={number.toString()}
                  value={number} />

      )}
    </ul>
  );
}
```

# Lab: Multi-Greeter

Let's make a component that greets every name on a list!

- Generate a new React App with `create-react-app`
- Create a new component named `Greeter` that:
  - Takes a name as a prop
  - Says hello to the given name
- In your `App` component add an array of names
- For each name on the list render the `Greeter` component taking the name as a prop
