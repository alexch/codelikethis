# React Refs

* Refs allow access to native DOM nodes created from `render()`
* Typically the only way to communicate with Components is Props
* Sometimes there are good reasons to need direct access
* Avoid Refs for anything the can be done declaratively
* Do not overuse Refs, they are designed as an escape hatch

### Reasons to use Refs

* Responding to DOM elements in `focus`
* Responding to text selection
* Triggering manual animations
* Integrating with other DOM libraries

# Refs - Create Refs

* Use `React.createRef()`
* Attach the Ref to a React Element using the `ref` attribute
* Assign the Ref to an **instance property** in the Constructor

```jsx
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.myRef = React.createRef();
  }
  render() {
    return <div ref={this.myRef} />;
  }
}
```

# Refs - Accessing Refs

* The `current` attribute can be use to reference the node
* When used on an HTML element `current` references the DOM Node
* When used with an React Element `current` references the mounted React component
* React.createRef() will not work with Stateless Functional components because they do not have instances

# Refs - Adding to DOM Elements

* The setting and unsetting of `current` happen automatically
* `componentDidMount` and `componentDidUpdate` are triggers
* Adding `focus` to an element is imperative

```jsx
class CustomTextInput extends React.Component {
  constructor(props) {
    super(props);
    // create a ref to store the textInput DOM element
    this.textInput = React.createRef();
    this.focusTextInput = this.focusTextInput.bind(this);
  }

  focusTextInput() {
    // Explicitly focus the text input using the raw DOM API
    // Note: we're accessing "current" to get the DOM node
    this.textInput.current.focus();
  }

  render() {
    // tell React that we want to associate the <input> ref
    // with the `textInput` that we created in the constructor
    return (
      <div>
        <input
          type="text"
          ref={this.textInput} />

        <input
          type="button"
          value="Focus the text input"
          onClick={this.focusTextInput}
        />
      </div>
    );
  }
}
```

# Refs - Functional Components

* Remember that Refs require class instance targets
* Stateless Functional components don't have instances
* Stateless Functional components can **use** refs however

```jsx
const MyFunctionalComponent = () =>  {
  return <input />;
}

class Parent extends React.Component {
  constructor(props) {
    super(props);
    this.textInput = React.createRef();
  }
  render() {
    // This will *not* work!
    return (
      <MyFunctionalComponent ref={this.textInput} />
    );
  }
}
```

# Refs - Functional Component Usage

```jsx
const CustomTextInput = (props) => {
  // textInput must be declared here so the ref can refer to it
  let textInput = React.createRef();

  function handleClick() {
    textInput.current.focus();
  }

  return (
    <div>
      <input
        type="text"
        ref={textInput} />

      <input
        type="button"
        value="Focus the text input"
        onClick={handleClick}
      />
    </div>
  );
}
```

# Refs - Forwarding Refs

* Parents can pass Refs to their children
* Child refs act like they belong to the parent
* Breaks component encapsulation
* Useful in re-usable components (General vs Specific)

```jsx
// Basic React function component
const FancyButton = (props) => {
  return (
    <button className="FancyButton">
      {props.children}
    </button>
  );
}
```

```jsx
// React component that can receive a Ref
const FancyButton = React.forwardRef((props, ref) => (
  <button ref={ref} className="FancyButton">
    {props.children}
  </button>
));

// You can now get a ref directly to the DOM button:
const ref = React.createRef();
<FancyButton ref={ref}>Click me!</FancyButton>;
```

# Refs - Create with Callbacks

* Alternative to using `React.createRef()`
* Allows for arbitrary JavaScript logic for Ref binding
* React calls the callback on `componentDidMount` and `componentDidUpdate`
* Ref is set to Null on `ComponentWillUnmount`

```jsx
class CustomTextInput extends React.Component {
  constructor(props) {
    super(props);

    this.textInput = null;

    this.setTextInputRef = element => {
      this.textInput = element;
    };

    this.focusTextInput = () => {
      // Focus the text input using the raw DOM API
      if (this.textInput) this.textInput.focus();
    };
  }

  componentDidMount() {
    // autofocus the input on mount
    this.focusTextInput();
  }

  render() {
    // Use the `ref` callback to store a reference to the text input DOM
    // element in an instance field (for example, this.textInput).
    return (
      <div>
        <input
          type="text"
          ref={this.setTextInputRef}
        />
        <input
          type="button"
          value="Focus the text input"
          onClick={this.focusTextInput}
        />
      </div>
    );
  }
}
```

# Refs - Passing Refs from Callbacks

* Parents can pass a ref to children inline
* Note that inline callbacks are called twice

```jsx
const CustomTextInput = (props) =>  {
  return (
    <div>
      <input ref={props.inputRef} />
    </div>
  );
}

// Parent instance this.inputElement will be
// equal to the CustomTextInput <input> element
class Parent extends React.Component {
  render() {
    return (
      <CustomTextInput
        inputRef={el => this.inputElement = el}
      />
    );
  }
}
```
