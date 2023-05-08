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

```

# Routing the Traditional Way

* Most web frameworks like Express, Angular, Ember, etc. have routing
* Most routing systems are pretty static

```jsx
// Express example
app.get('/', handleIndex)
app.get('/posts', handlePosts)
app.get('/posts/:id', handlePost)
app.get('/posts/:id/edit', handlePostEdit)

app.listen(5000)
```

# React Routing - Most Basic

* React-router **can** route to just a basic function
* React-router routes are just **special** components that delegate to other components to handle the rendering
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

# Lab: React Nav Bar

Let's set up a simple site with some basic navigation using React Router.

- Create a new react app
- Create an `About` Component, a `Homepage` component, and a `Nav` component
- add links to the `Nav` component that direct you to the `Home` and `About` pages
- The `Nav` component should be loaded on both the `Home`, and `About` pages

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

# Lab: React Router Blog

Let's create a fake blog using [JSONPlaceholder](https://jsonplaceholder.typicode.com/) and React Router!

* When the user visits the homepage they should see a welcome page with:
  * a greeting ('Welcome to our page, click an article to get started')
  * a list of all available articles from JSONPlaceholder by title
* When the user clicks an article's title it should take you to a new page with:
  * the contents of that article
  * the title
  * the author's name
  * and when you click the author's name it should take you to a page with a list of all the articles **by that author**

>Hint: You might want to look back at some of your [previous projects](https://bootcamp.burlingtoncodeacademy.com/projects/yelpington-app) and/or the [JSON](../javascript/json) lesson for inspiration
