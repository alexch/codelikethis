# React Routing - Going Further

React Router offers a lot of power and flexibility, we will explore the following features in upcoming slides.

* Validating routes with Regular Expressions
* Capturing and parsing URL Query Parameters
* Using Switch Routing Components
* Rendering a catch all route as a friendly 404
* Redirecting to other pages or websites


# React Routing - RegEx Validation

* Routes can use Regular Expressions to determine a match
* Almost all valid RegExs are acceptable, check [Path-to-Regexp](path-to-regexp)
* Path parts can be validated separately

### Examples

```javascript
@@@javascript
<Route
  path="/:a([A-Za-z]+)"
  render={({ match, props, location }) => (
    <h1>
      All word characters: {match.params.a}
      {console.log({ match })}
      {console.log({ location })}
    </h1>
  )}
/>
```

# React Routing - RegEx Validation Parts

```javascript
@@@javascript
<Route
  path="/:a([A-Za-z]+)/:b(\d+)"
  render={({ match, props, location }) => (
    <h1>
      Words then numbers: {match.params.a} | {match.params.b}
      {console.log({ match })}
      {console.log({ location })}
    </h1>
  )}
/>
```

[CodeSandbox](https://codesandbox.io/s/vy83l33w15)
