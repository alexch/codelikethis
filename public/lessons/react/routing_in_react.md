# React Routing

* Using a pages URL is a core web feature
* React changes the page without updating the URL
* The URL is a form of data communication
* React-Router is a tool for declarative routing using components

```jsx
const Router = () => (
  <BrowserRouter>
    <Switch>
      <Route exact path="/" component={Home} />
      <Route path="/blogs/:blogId" component={App} />
      <Route component={NotFound} />
    </Switch>
  </BrowserRouter>
);

ReactDom.render(
  <Router />,
  document.getElementById('root')
);
```

# React Routing - Traditional

* Most web frameworks like Express, Angular, Ember, etc. have routing
* Most routing systems are pretty static

```jsx
// Express example
app.get('/', handleIndex)
app.get('/posts, handlePosts)
app.get('/posts/:id', handlePost)
app.get('/posts/:id/edit', handlePostEdit)

app.listen()
```

# React Routing - Most Basic

* React-router **can** route to just a basic function
* React-router routes are just **special** components that delegate to others
* Routes are generated when your app runs

```jsx
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Route } from "react-router-dom";

const App = () => {
  return (
    <BrowserRouter>
      <Route path="/" render={() => <h1>Hello React-Router!</h1>} />
    </BrowserRouter>
  )
}

const root = document.getElementById('root');
ReactDOM.render( <App />, root)
```

# React Routing - Dynamic Routing

* React-router can delegate `render` to other components
* JSX from those components will be rendered on a "match"
* React-router uses Regex to match the "path" to the "route"

```jsx
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Link } from "react-router-dom";
import App from './App';

const Router = () => {
  return (
    <BrowserRouter>
      <Route path="/" component={App} />
    </BrowserRouter>
  )
}

const root = document.getElementById('root');
ReactDOM.render( <Router />, root)
```

```jsx
// File: components/App.js
import React from 'react';

const App = () => {
  return (
    <div>
      <h1>Welcome to the App!</h1>
    </div>
  );
}

export default App;
```

[Code Sandbox Step 1](https://codesandbox.io/s/82wvknrzn8)

# React Routing - Links

* The `<Link />` component acts like  `<a href="/somePath">Link</a>`
* Browser URL is changed
* Browser history is preserved

```jsx
import { Link } from 'react-router-dom';

const Nav = () => {
  <nav>
    <Link to='/'>Home</Link>
    <Link to={{ pathname: '/dashboard' }}>Home</Link>
    <Link to={{ pathname: '/contact }} replace>Home</Link>
  </nav>
}

const App = () => {
  return (
    <Nav />
    <h1>Hello! You are at Home!</h1>;
  )
};

const Dashboard = () => {
  return (
    <Nav />
    <h1>Welcome to the Dashboard</h1>;
  )
};

const Contact = () => {
  return (
    <Nav />
    <h1>Please email me!</h1>;
  )
};

const Router = () => {
  return (
    <BrowserRouter>
      <App />
    </BrowserRouter>
  );
};

const rootElement = document.getElementById("root");
ReactDOM.render(<Router />, rootElement);
```

# React Routing - Matching Routes

```jsx
const App = () => {
  return (
    <div>
      <nav>
        <Link to="/">Home</Link>
        <br/>
        <Link to="/dashboard">Dashboard</Link>
      </nav>
      <div>
        <Route path="/" exact component={Home} />
      </div>
      <div>
        <Route path="/dashboard" component={Dashboard} />
      </div>
    </div>
  );
};

const Home = () => {
  return <h1>Hello! You are at Home!</h1>;
};

const Dashboard = () => {
  return <h1>Welcome to the Dashboard</h1>;
};

const Router = () => {
  return (
    <BrowserRouter>
      <App />
    </BrowserRouter>
  );
};

const rootElement = document.getElementById("root");
ReactDOM.render(<Router />, rootElement);
```

# React Routing - The Match Object

* Match is one of the Props passed from a Route
* It is a JavaScript object
* You can use the properties to do logic, or fill values

```jsx
const App = () => {
  return (
    <div>
      <Route path="/" exact component={Home} />
      <Route
        path="/dashboard"
        children={({ match }) => match && <Dashboard />} />
    </div>
  );
};

const Home = () => {
  return <h1>Hello! You are at Home!</h1>;
};

const Dashboard = (props) => {
  console.log(props);
  return <h1>Welcome to the Dashboard</h1>;
};

const Router = () => {
  return (
    <BrowserRouter>
      <App />
    </BrowserRouter>
  );
};

const rootElement = document.getElementById("root");
ReactDOM.render(<Router />, rootElement);
```

[Code Sandbox Match Object](https://codesandbox.io/s/ymqp7xnxjj)

# React Routing - Match Object Details

```jsx
// From <Dashboard />
Object {props: Object}
  match: Object
    path: "/dashboard"
    url: "/dashboard"
    isExact: true
    params: {}

```

```jsx
// From <Home />
Object {props: Object}
  props: Object
    match: Object
      path: "/"
      url: "/"
      isExact: true
      params: Object
    location: Object
    pathname: "/"
      search: ""
      hash: ""
      state: undefined
    history: Object
    staticContext: undefined
```

[Code Sandbox Match Object](https://codesandbox.io/s/ymqp7xnxjj)

# React Router - URL Parameters

* A colon `:someRoute` denotes that a Route component should be a parameter
* Parameters can be passed into components from the Route `path`
* Parameters can be required or optional

```jsx
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Route } from "react-router-dom";

const App = props => {
  return (
    <BrowserRouter>
      <div>
        <Route
          path="/:post?"
          render={({ match }) => (
            <h1>Post equals: {match.params.post || "None"}</h1>
          )}
        />
      </div>
    </BrowserRouter>
  );
};

const rootElement = document.getElementById("root");
ReactDOM.render(<App />, rootElement);
```

[CodeSandbox - URL Params](https://codesandbox.io/s/31yvwl87p5)

# React Router - Sub-Parameters

```jsx
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Route } from "react-router-dom";

const App = props => {
  return (
    <BrowserRouter>
      <div>
        <Route
          path="/:author?/:post?"
          render={({ match }) => (
          <div>
            <h1>Author equals: {match.params.author || "None"}</h1>
            <h2>Post equals: {match.params.post || "None"}</h2>
          </div>
          )}
        />
      </div>
    </BrowserRouter>
  );
};

const rootElement = document.getElementById("root");
ReactDOM.render(<App />, rootElement);
```

[CodeSandbox - Subparams](https://codesandbox.io/s/k956r67znr)
