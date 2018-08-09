# Responding to Events

* Event handling in React is similar to handling DOM events
* Handler functions can be passed as Props
* Event names are camelCased i.e. `onClick`, `onSubmit`, `onHover`

```html
@@@html
<!-- HTML Event Handler -->
<button onclick="handleData">
  Submit Data
</button>
```

```javascript
@@@javascript
/* React Event Handler */
<button onClick={handleData}>
  Submit Data
</button>p
```

# Preventing Default Behavior

* Calling `event.preventDefault()` must be done in the handler

```javascript
@@@javascript
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

| Return Type    | Propery                |
|----------------|------------------------|
| boolean        | bubbles                |
| boolean        | cancelable             |
| DOMEventTarget | currentTarget          |
| boolean        | defaultPrevented       |
| number         | eventPhase             |
| boolean        | isTrusted              |
| DOMEvent       | nativeEvent            |
| void           | preventDefault()       |
| boolean        | isDefaultPrevented()   |
| void           | stopPropagation()      |
| boolean        | isPropagationStopped() |
| DOMEventTarget | target                 |
| number         | timeStamp              |
| string         | type                   |

# Events are Nullified after Handling

* After the event handler function is called the event is set to Null
* This is because SyntheticEvents are reused for other Events
* Do not handle events using Async functions, unless calling `event.persist()` first

### Usual Behavior

```javascript
@@@javascript
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
