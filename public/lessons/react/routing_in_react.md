# React Routing

* Using a pages URL is a core web feature
* React changes the page without updating the URL
* The URL is a form of data communication
* React-Router is a tool for declarative routing using components

```javascript
@@@javascript
const Router = () => (
  <BrowserRouter>
    <Switch>
      <Route exact path="/" component={Home} />
      <Route path="/blogs/:blogId" component={App} />
      <Route component={NotFound} />
    </Switch>
  </BrowserRouter>
);

render(<Router />, document.getElementById('root'));
```

# React Routing - Traditional

* Most web frameworks like Express, Angular, Ember, etc. have routing
* Most routing systems are pretty static

```javascript
// Express example
@@@javascript
app.get('/', handleIndex)
app.get('/posts, handlePosts)
app.get('/posts/:id', handlePost)
app.get('/posts/:id/edit', handlePostEdit)

app.listen()
```

# React Routing - Dynamic Routing

* React routes are just **special** components
* Routes are generated when your app runs

```
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Link } from "react-router-dom";

function App() {
  return (
    <div>
      <nav>
        <Link to="/dashboard">Dashboard</Link>
      </nav>
    </div>
  );
}

const Router = () => {
  return (
    <BrowserRouter>
      <App/>
    </BrowserRouter>
  )
}

const root = document.getElementById('root');
ReactDOM.render( <Router />, root)
```

[Code Sandbox Step 1](https://codesandbox.io/s/82wvknrzn8)

# React Routing - Matching Routes

```javascript
@@@javascript
const App = () => {
  return (
    <div>
      <nav>
        <Link to="/">Home</Link>
        &nbsp;>&nbsp;
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
