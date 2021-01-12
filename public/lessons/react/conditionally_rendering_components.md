# Rendering Components Conditionally

* Components can be rendered using If/Else or a Ternary
* State within the Class or Function can be used in the conditions

```jsx
const UserGreeting = (props) => {
  return <h1>Welcome back!</h1>;
}

const GuestGreeting = (props) => {
  return <h1>Please sign up.</h1>;
}

const Greeting = (props) =>  {
  const isLoggedIn = props.isLoggedIn;
  if (isLoggedIn) {
    return <UserGreeting />;
  }
  return <GuestGreeting />;
}

ReactDOM.render(
  // Try changing to isLoggedIn={true}:
  <Greeting isLoggedIn={false} />,
  document.getElementById('root')
);
```

# React Elements as Variables - Components

```jsx
const LoginButton = (props) => {
  return (
    <button onClick={props.onClick}>
      Login
    </button>
  );
}

const LogoutButton = (props) => {
  return (
    <button onClick={props.onClick}>
      Logout
    </button>
  );
}
```

# React Elements as Variables - Usage

```jsx
function LoginControl (props) {

  const [isLoggedIn, setLogIn] = useState(false)

  handleLoginClick () {
    setLogIn(true);
  }

  handleLogoutClick () {
    setLogIn(false);
  }

  let button;

  if (isLoggedIn) {
    button = <LogoutButton onClick={ this.handleLogoutClick } />;
  } else {
    button = <LoginButton onClick={ this.handleLoginClick } />
  }

  return (
    <div>
      <Greeting isLoggedIn={ isLoggedIn } />
      { button }
    </div>
  );
}
```

# Short Hand Logic Rendering

* The Locical And `Truthy/Falsy && someExpression`
* `truth && expression` is always true and evaluates `expression`
* `false && expression` is always false and evaluates `false`

```jsx
const Mailbox = (props) => {
  const unreadMessages = props.unreadMessages;
  return (
    <div>
      <h1>Hello!</h1>
      {unreadMessages.length > 0 &&
        <h2>
          You have {unreadMessages.length} unread messages.
        </h2>
      }
    </div>
  );
}

const messages = ['React', 'Re: React', 'Re:Re: React'];
ReactDOM.render(
  <Mailbox unreadMessages={messages} />,
  document.getElementById('root')
);
```

[Example CodePen](https://codepen.io/Dangeranger/pen/ajPxBd)


# Inline Conditionals using Ternary

* One line Ternarys are fine
* Do not use nested Ternarys if possible
* Keep it simple

### Simple

```jsx
function Greeting (props) {

  const isLoggedIn = props.isLoggedIn;

  return (
    <div>
      The user is <b>{isLoggedIn ? 'currently' : 'not'}</b> logged in.
    </div>
  );
}
```

### Complex

```jsx
  const isLoggedIn = this.state.isLoggedIn;
  return (
    <div>
      {isLoggedIn ? (
        <LogoutButton onClick={this.handleLogoutClick} />
      ) : (
        <LoginButton onClick={this.handleLoginClick} />
      )}
    </div>
  );
```

# Preventing Component Rendering

```jsx
const WarningBanner = (props) => {
  if (!props.warn) {
    return null;
  }

  return (
    <div className="warning">
      Warning!
    </div>
  );
}

function Page (props) {

  const [showWarning, setWarning] = useState(true)

  function handleToggleClick() {
    if(showWarning) {
      setWarning(false)
    } else {
      setWarning(true)
    }
  }

  return (
    <div>
      <WarningBanner warn={showWarning} />
      <button onClick={handleToggleClick}>
        {showWarning ? 'Hide' : 'Show'}
      </button>
    </div>
  );
}
```

[Example CodePen](https://codepen.io/Dangeranger/pen/BPvEqv?editors=0010)

# Lab: Modal Display

Let's create a simple modal popup using the power of conditional rendering!  Modal boxes are used all over the web, and are essentially a popup display. You see them quite often with image galleries where you can click a preview thumbnail, and the full size image opens as a popup.

- Create a new react project
- It should have a button that says "Click me"
- When this button is pressed a box should open *on top of* the existing page
- And it should say "Hello! I am a modal!"
- And have a "close" button
- When the "close" button is clicked the modal should go away
