# Rendering Multiple Components

* Map() takes a list and returns a transformed new list
* Escape the JavaScript within JSX using `{}`

```jsx
NumberList (props) => {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li>{number}</li>
  );
  return (
    <ul>{listItems}</ul>
  );
}

const numbers = [1, 2, 3, 4, 5];

ReactDOM.render(
  <NumberList numbers={numbers} />,
  document.getElementById('root')
);
```

[Example CodePen](https://codepen.io/Dangeranger/pen/mjaYPa)

# Multiple Components with Keys

```jsx

NumberList = (props) => {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li key={number.toString()}>
      {number}
    </li>
  );
  return (
    <ul>{listItems}</ul>
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
ListItem = (props) => {
  // Correct! There is no need to specify the key here:
  return <li>{props.value}</li>;
}

NumberList = (props) => {
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

# Component Keys - Common Mistake

* Keys live on the components
* Keys do not live on the content of the component

```jsx
ListItem = (props) => {
  const value = props.value;
  return (
    // Wrong! There is no need to specify the key here:
    <li key={value.toString()}>
      {value}
    </li>
  );
}

NumberList (props) => {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    // Wrong! The key should have been specified here:
    <ListItem value={number} />
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
