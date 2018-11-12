# Fetching Data

* Most React frontend apps need server data
* The browsers `window.fetch` API can be used to make requests
* The `componentDidMount()` is recommended as a best practice

### Basic Component

```javascript
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      items: []
    };
  }

  /* This is where data will be fetched from */
  componentDidMount() {}

  render() {
    const { items } = this.state;
    return (
      <ul>
        {items.map(item => (
          <li key={item.id}>
            <h3>{item.title}</h3>
            <p>{item.body}</p>
          </li>
        ))}
      </ul>
    );
  }
}
```

# Fetching Data - componentDidMount

* Render an empty component first
* Get data after it has been rendered
* Re-render with data from `setState({some: 'state'})`

### Component with Data

```javascript
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      items: [],
      isLoaded: false,
    };
  }

  componentDidMount() {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then(res => res.json())
      .then(result => {
        this.setState({
          isLoaded: true,
          items: result
        });
      });
  }

  render() {
    const { items } = this.state;
    if (!isLoaded) {
      return <div>Loading ... </div>;
    } else {
      return (
        <ul>
          {items.map(item => (
            <li key={item.id}>
              <h3>{item.title}</h3>
              <p>{item.body}</p>
            </li>
          ))}
        </ul>
      );
    }
  }
}
```

# Fetching Data - Handle Errors

* Errors in `fetch` using APIs happen
* Do not let an error ruin your page by raising in production
* Better to wait/retry and present a nice message

### Component with Error Handling

```javascript
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: []
    };
  }

  componentDidMount() {
    fetch("https://jsonplaceholder.typicode.com/posts")
      .then(res => res.json())
      .then(
        result => {
          this.setState({
            isLoaded: true,
            items: result
          });
        },
        error => {
          this.setState({
            isLoaded: true,
            error: error
          });
        }
      );
  }

  render() {
    const { error, isLoaded, items } = this.state;
    if (error) {
      return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      console.log(this.state.items);
      return (
        <ul>
          {items.map(item => (
            <li key={item.id}>
              <h3>{item.title}</h3>
              <p>{item.body}</p>
            </li>
          ))}
        </ul>
      );
    }
  }
}
```

# Fetching Data - Example

<https://codesandbox.io/embed/p99mqrq9z0>

<p data-height="500" data-theme-id="light" data-slug-hash="gjELaj" data-default-tab="js,result" data-user="Dangeranger" data-pen-title="Fetching API Data" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/gjELaj/">Fetching API Data</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
