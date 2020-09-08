# Fetching Data

* Most React frontend apps need server data
* The browsers `window.fetch` API can be used to make requests
* The `componentDidMount()` is recommended as a best practice

### Basic Component

```jsx
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

```jsx
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

# Fetching Data With Hooks

To fetch data (and store it) in a functional component we need to use Hooks

- first set up a property in state, and an updater function using `setState`
- then fetch the data with `useEffect`
- and use your updater function to set the fetched data in state
- use your state property to conditionally render data to the page when it's loaded

# Lab: Functional Fetching

Let's practice fetching data with `useEffect` by creating a React app that fetches a list of users, and displays them on the page

- Create a new React app
- When the page loads fetch a list of userss from `https://jsonplaceholder.typicode.com/users`
- Then display a list of the user names on the page

# Fetching Data - Handle Errors

* Errors in `fetch` using APIs happen
* Do not let an error ruin your page by raising in production
* Better to wait/retry and present a nice message

### Component with Error Handling

```jsx
function AuthorList(props) {
  const [authors, setAuthors] = useState(null)

  useEffect(() => {
    fetch('https://jsonplaceholder.typicode.com/users')
      .then(res => res.json())
      .then(res => {
        setAuthors(res)
      }).catch((err) => {
        alert('Something went wrong...')
        console.error(err.message)
      })
  })
  
  return(
    <ul>
      {authors ? authors.map((author) => {
        return <li>{author.name}</li>
      }) : 'loading...'}
    </ul>
  )
}
```

# Fetching Data - Example

<https://codesandbox.io/embed/p99mqrq9z0>

<p data-height="500" data-theme-id="light" data-slug-hash="gjELaj" data-default-tab="js,result" data-user="Dangeranger" data-pen-title="Fetching API Data" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/gjELaj/">Fetching API Data</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
