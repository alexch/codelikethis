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

* Is private data specific to a component
* Cannot be changed by the Parent
* Has a set default value, can be `Null`
