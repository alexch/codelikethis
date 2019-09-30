# Composition vs Inheritance

* Inheritance can be overused
* Composition of behavior can be simpler and easier
* React supports using composition over deep inheritance

# Composition - Using props.children

* Any Components within `<FancyBorder>` become `props.children`
* The parent component can wrap children in a `<div>` for layout/style

### Composing Behavior with Components

```jsx
/* FancyBorder will componse with children*/
function FancyBorder(props) {
  return (
    <div className={'FancyBorder FancyBorder-' + props.color}>
      {props.children}
    </div>
  );
}

/* WelcomeDialog uses FancyBorder with children*/
function WelcomeDialog() {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">
        Welcome
      </h1>
      <p className="Dialog-message">
        Thank you for visiting our spacecraft!
      </p>
    </FancyBorder>
  );
}
```

# Composition - Child Groups

* Sometimes components have children in several places
* Assigning the child components to prop names can help organize

```jsx
function SplitPane(props) {
  return (
    <div className="SplitPane">
      <div className="SplitPane-left">
        {props.left}
      </div>
      <div className="SplitPane-right">
        {props.right}
      </div>
    </div>
  );
}

function App() {
  return (
    <SplitPane
      left={
        <Contacts />
      }
      right={
        <Chat />
      } />
  );
}

```

# Composition - Classes Work Too

* Both Stateless Functions and Classes compose
* Specific Components can configure General Components
* Props can be used to configure

```jsx
function Dialog(props) {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">
        {props.title}
      </h1>
      <p className="Dialog-message">
        {props.message}
      </p>
      {props.children}
    </FancyBorder>
  );
}

class SignUpDialog extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.handleSignUp = this.handleSignUp.bind(this);
    this.state = {login: ''};
  }

  handleChange(e) {
    this.setState({login: e.target.value});
  }

  handleSignUp() {
    alert(`Welcome aboard, ${this.state.login}!`);
  }

  render() {
    return (
      <Dialog title="Mars Exploration Program"
              message="How should we refer to you?">
        <input value={this.state.login}
               onChange={this.handleChange} />

        <button onClick={this.handleSignUp}>
          Sign Me Up!
        </button>
      </Dialog>
    );
  }
}
```

# Composition - When Inheritance?

* Facebook doesn't use inheritance beyond initial Component Classes
* Frontends can be built using a mixture of 'general' and 'specific' components
* Use Props to pass specific attributes and children to render specific behavior
* Behavior shared within Components such as logic or utilities can be shared as JavaScript libraries or modules
* Using `import` is more useful and less restricting then `extends`
