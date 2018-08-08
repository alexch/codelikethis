# Component Props and State

* Dynamic data that Components use fall into one of two categories

1. Props:
  - Similar to arguments of a function
  - Are immutable once passed in
  - *Can* be passed down to children explicitely

2. State:
  - **Private** data held within the Component
  - *Can* be updated using `setState({someNew: 'data'})`
  - **Must** be updated from the object that owns it
  - *Can* be passed down to children as Props
  - *Can* be updated by children by passing functions



# Stateless Functional Components

* At their most basic form Components are a lot like functions
* They accept input from their props and return HTML snippets as React Elements
* Any function that accepts one argument as props and returns JSX is valid
* Stateless functions have no State i.e. `state = {value: 'something'}`

```javascript
@@@javascript
<body>
  <div id="root"/>
</body>
<script>
  /* This is a perfectly valid React Component*/
  const HelloThere = (props) => <h1>Hello, { props.name }</h1>;
  ReactDom.render(<HelloThere name="Grace Hopper"/>,
    document.getElementById('root')
  )
</script>
```

```html
@@@html
<body>
  <div id="root">
    <!-- This is what the code would result in -->
    <h1>Hello, Grace Hopper</h1>
  </div>
</body>
```

# All Props are Immutable

* Neither Function nor Class components should mutate their Props
* React requires Components to be 'Pure' toward their Props

```javascript
@@@javascript
/* Always returns the same JSX for given inputs */

const UserInfo = (props) => {
  return (
    <div className="UserInfo">
      <Avatar user={ props.user } />
      <div className="UserInfo-name">
        { props.user.name }
      </div>
    </div>
  );
}
```

# Pure and Impure Functions

* 'Pure' functions don't mutate inputs and always return the same output for the same inputs

```javascript
@@@javascript
/* This is a 'Pure' function */
/* It always returns the same output for given inputs */

function sum (first, second) {
  return first + second;
}
```

```javascript
@@@javascript
/* This is an 'Impure' function */
/* It can return different things based on the balance */

function deduct (bankAccount, amount) {
  bankAccount.balance = bankAccount.balance - amount;
  return bankAccount
}
```

# Component State

### Description

  * Data managed by the component that changes over time
  * Considered private data by default
  * Cannot be changed by the Parent
  * Has a set default value, can be `Null`
  * Plain JavaScript Object

### Rules

  * Never mutate the State directly
  * Always use `this.setState()`
  * Limit access to State from children
  * If building from a prior value, pass an update function to `this.setState()`

[Props vs State](http://lucybain.com/blog/2016/react-state-vs-pros/)

# State - Tick Live

* Rememeber the Ticking Clock example

<p data-height="265" data-theme-id="light" data-slug-hash="gjdNEB" data-default-tab="js,result" data-user="Dangeranger" data-pen-title="React Clock Example" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/gjdNEB/">React Clock Example</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>


# State - Tick Code

```javascript
@@@javascript
function tick() {
  const element = (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is {new Date().toLocaleTimeString()}.</h2>
    </div>
  );
  ReactDOM.render(
    element,
    document.getElementById('root')
  );
}

setInterval(tick, 1000);
```

# State - Extract Component

> Does this use component state?

```javascript
@@@javascript
/* Now we have a component */
function Clock(props) {
  return (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is {props.date.toLocaleTimeString()}.</h2>
    </div>
  );
}

/* Use the component in a function */
function tick() {
  ReactDOM.render(
    <Clock date={new Date()} />,
    document.getElementById('root')
  );
}

setInterval(tick, 1000);
```

# State - Convert to Class

* Convert the stateless function to a Class

```javascript
@@@javascript
/* From this */
function Clock(props) {
  return (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is {props.date.toLocaleTimeString()}.</h2>
    </div>
  );
}

/* To this */
class Clock extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.props.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
```

# State - Start the Clock

```javascript
@@@javascript
class Clock extends React.Component {
  constructor(props) {
    /* Make sure to call super in a constructor */
    super(props);
    /* Setting the initial state */
    this.state = {date: new Date()};
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <!-- Use the state instead of props -->
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
```

# State - Manage the Clock

```javascript
@@@javascript
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  componentDidMount() {
    this.timerID = setInterval(
      () => this.tick(),
      1000
    );
  }

  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  tick() {
    this.setState({
      date: new Date()
    });
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
```

# State - Working Clock

<p data-height="265" data-theme-id="light" data-slug-hash="ajRepW" data-default-tab="js,result" data-user="Dangeranger" data-pen-title="Hello World in React" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/ajRepW/">Hello World in React</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

# State - Remember

* Never update state directly, use `setState({some: 'state'})`

```
/* Not good */
this.state.comment = 'Hello';

/* Excellent */
this.setState({comment: 'Hello'});
```

# State - Updates can be Async

* Calling `setState()` schedules an update
* React **may** batch those updates together for performance
* If you use a prior value to calculate the state, pass a callback function

```
/* Incorrect */
this.setState({
  counter: this.state.counter + this.props.increment,
});

/* Super Great */
this.setState((prevState, props) => ({
  counter: prevState.counter + props.increment
}));
```

# State - Updates are Merged

* When state has many properties, update each separately
* This allows for independent property merges
* The merge is shallow

```javascript
@@@javascript
constructor(props) {
  super(props);
  this.state = {
    posts: [],
    comments: []
  };
}

componentDidMount() {
  fetchPosts().then(response => {
    this.setState({
      posts: response.posts
    });
  });

  fetchComments().then(response => {
    this.setState({
      comments: response.comments
    });
  });
}
```

# State - Many Clocks

<p data-height="265" data-theme-id="light" data-slug-hash="pZxMag" data-default-tab="js,result" data-user="Dangeranger" data-pen-title="Hello World in React" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/pZxMag/">Hello World in React</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
