# React Routing - Going Further

React Router offers a lot of power and flexibility, we will explore the following features in upcoming slides.

* Validating routes with Regular Expressions
* Capturing and parsing URL Query Parameters
* Using Switch Routing Components
* Rendering a catch all route as a friendly 404
* Redirecting to other pages or websites


# React Routing - RegEx Validation

* Routes can use Regular Expressions to determine a match
* Almost all valid RegExs are acceptable, check [Path-to-Regexp](https://github.com/pillarjs/path-to-regexp) / [Express Route Tester](http://forbeslindesay.github.io/express-route-tester/)
* Path parts can be validated separately

### Example

```jsx
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

### Example

```jsx
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

# React Routing - Query Parameters

* Query parameters are the `name=value` pairs afte a `?` in a URL
* `<Link />` Components can pass URL Parameters to a Route
* The `to` param works differently between strings and objects
* Params can be parsed using `new URLSearchParams(params)`

### Example

```jsx
const Nav = props => {
  return (
    <div>
      <Link to="/path?id=42">Params within 'to'</Link>
      <br />
      <Link to={{ pathname: "/path?id=9000" }}>Params within Pathname</Link>
      <br />
      <Link to={{ pathname: "/path", search: "id=789" }}>
        Params 'Search' property
      </Link>
    </div>
  );
};
```

[CodePen](https://codesandbox.io/s/1o9o1wn5l3)


# React Routing - Switch Component

* Useful to avoid over matching
* Switch renders only the first matching `<Route>` instead of all
* Can be used to build a catch all route for 404 like pages

### Example

```jsx
const App = props => {
  return (
    <BrowserRouter>
      <React.Fragment>
        <Nav />
        <Switch>
          <Route path="/posts" component={Posts} />
          <Route path="/authors" component={Authors} />
          <Route path="/:author/:post" component={AuthorPost} />
          <Route exact path="/" component={Home} />
        </Switch>
      </React.Fragment>
    </BrowserRouter>
  );
};
```

[CodeSandbox](https://codesandbox.io/s/pl0wpn6q0)

# React Routing - Catch All Route

* Catch all routes can be useful to prevent 404 errors
* Allow for a 'helpful' message, instead of a "Page Not Found" HTTP error
* Are easy to create with the `<Switch>` and `<Route>` components

### Example

```jsx
const NotFound = () => (
  <div>
    <h1>That page was not found</h1>
  </div>
);

const App = props => {
  return (
    <BrowserRouter>
      <React.Fragment>
        <Nav />
        <Switch>
          <Route path="/posts" component={Posts} />
          <Route path="/authors" component={Authors} />
          <Route exact path="/" component={Home} />
          <Route path="" component={NotFound} />
        </Switch>
      </React.Fragment>
    </BrowserRouter>
  );
};
```

[CodeSandbox](https://codesandbox.io/s/m58vy8q99j)

# React Routing - Redirection

### Examples

```jsx
const Home = () => <h1>You are Home</h1>;
const Posts = () => <h1>All the Posts</h1>;

const App = props => {
  return (
    <BrowserRouter>
      <React.Fragment>
        <Nav />
          <Route path="/posts" component={Posts} />
          <Route path="/willredirect" render={() => (
            <Redirect to="/posts" />
          )} />
          <Route exact path="/" component={Home} />
      </React.Fragment>
    </BrowserRouter>
  );
};
```

[CodeSandbox](https://codesandbox.io/s/yp4xrk60mv)
