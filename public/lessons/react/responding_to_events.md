# Responding to Events

* Event handling in React is similar to handling DOM events
* Handler functions can be passed as Props
* Event names are camelCased i.e. `onClick`, `onSubmit`, `onHover`

```html
<!-- HTML Event Handler -->
<button onclick="handleData()">
  Submit Data
</button>
```

```javascript
/* React Event Handler */
<button onClick={handleData}>
  Submit Data
</button>
```

# Preventing Default Behavior

* Calling `event.preventDefault()` must be done in the handler

```javascript
function Link () {
  function handleClick(event) {
    event.preventDefault();
    doSomethingWithTarget(event);
  }

  return (
    <a href="#" onClick={handleClick}>
      Click Me React
    </a>
  );
}
```

# React Events are SyntheticEvents

* Events are not **real** DOM events
* They are captured by React and replaced with SyntheticEvent
* SyntheticEvents behave the same accross all Browsers, unlike DOM Events

| Propery                | Return Type    |
|------------------------|----------------|
| bubbles                | boolean        |
| cancelable             | boolean        |
| currentTarget          | DOMEventTarget |
| defaultPrevented       | boolean        |
| eventPhase             | number         |
| isTrusted              | boolean        |
| nativeEvent            | DOMEvent       |
| preventDefault()       | void           |
| isDefaultPrevented()   | boolean        |
| stopPropagation()      | void           |
| isPropagationStopped() | boolean        |
| target                 | DOMEventTarget |
| timeStamp              | number         |
| type                   | string         |

# Events are Nullified after Handling

* After the event handler function is called the event is set to Null
* This is because SyntheticEvents are reused for other Events
* Do not handle events using Async functions, unless calling `event.persist()` first

### Usual Behavior

```javascript
function onClick(event) {
  console.log(event); // => nullified object.
  console.log(event.type); // => "click"
  const eventType = event.type; // => "click"

  setTimeout(function() {
    console.log(event.type); // => null
    console.log(eventType); // => "click"
  }, 0);

  // Won't work.
  // this.state.clickEvent will only contain null values.
  this.setState({clickEvent: event});

  // You can still export event properties.
  this.setState({eventType: event.type});
}
```

[More on SyntheticEvents](https://reactjs.org/docs/events.html)

# Binding Event Handlers

* JavaScript classes do not by default `bind` the `this` in ES6 Classes
* Binding is a normal JavaScript behavior and is very confusing
* Either use `bind` in the constructor, or use an ES6 Arrow Function

```javascript
class Toggle extends React.Component {
  constructor (props) {
    super(props);
    this.state = { isToggleOn: true };

    // Binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(prevState => ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  render() {
    return (
      <button onClick={this.handleClick}>
        {this.state.isToggleOn ? true : false}
      </button>
    );
  }
}

ReactDOM.render(
  <Toggle />,
  document.getElementById('root')
);
```

[More about Binding Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_objects/Function/bind)

# Binding Event Handlers - Arrow Functions

* Class constructor with `this.function = this.function.bind(this)` are verbose
* Rewrite the Class property as an arrow function as below
* Only availble when transformed via Babel using `create-react-app` or other

```javascript
class LoggingButton extends React.Component {
  // This syntax ensures `this` is bound within handleClick.
  // Warning: this is *experimental* syntax.
  constructor (props) {
    super(props)
    this.state = { isToggleOn: true }
  }

  handleClick = () => {
    this.setState(prevState => ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  render() {
    return (
      <button onClick={this.handleClick}>
        {this.state.isToggleOn ? true : false}
      </button>
    );
  }
}
```

[Arrow Functions as Class Properties](https://medium.com/quick-code/react-quick-tip-use-class-properties-and-arrow-functions-to-avoid-binding-this-to-methods-29628aca2e25)
