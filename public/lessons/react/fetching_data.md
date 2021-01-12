# Fetching Data

* Most React frontend apps (and most web apps in general) need server data
* The browsers `fetch` API can be used to fetch data from databases or other locations on the internet
* Fetched data should be stored in state, and the values in state are rendered to the page
* It is generally best practice to fetch when the component first mounts, during the `componentDidMount` lifecycle process


# Fetching Data Cont.

* Render an empty component first
* Get data after it has been rendered
* Re-render by setting the fetched data in state
* We can access the state and lifecycle render methods by using the `useState` and `useEffect` hooks respectively

# Fetching Data With Hooks

To fetch data (and store it) in a functional component we need to use Hooks

- first set up a property in state, and an updater function using `setState`
- then fetch the data with `useEffect`
- and use your updater function to set the fetched data in state
- use your state property to conditionally render data to the page when it's loaded

> Note: Changing state triggers a re-render, a re-render triggers `useEffect` so remember to wrap your state changes in conditionals, or you'll be trapped in an infinte render cycle.

# Fetching Data Example

```jsx

function DisplayMessages(props) {
  
}

```

# Lab: Functional Fetching

Let's practice fetching data with `useEffect` by creating a React app that fetches a list of users, and displays them on the page

- Create a new React app
- When the page loads fetch a list of userss from `https://jsonplaceholder.typicode.com/users`
- Then display a list of the user names on the page
  - This means you will also be *rendering multiple components*

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
