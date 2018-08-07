# React Components

* Isolated pieces of a website or app
* Can be rendered manually or programatically
* Dynamic data is passed in via Props
* Generate child compoents with `render()`

```javascript
@@@javascript
class Profile extends React.Component {
  userData = () => {
    return data || fetchDataFromDatabase();
  }

  render() {
    <Header>
      <Profile
        name={userData.name}
        interests={userData.interests}
        description={userData.description}
      />
      <Activity />
      <Contact />
    </Header>
  }
}
```

# Using Components

* Typically the `index.js` initiates the components tree from the top level
* Child components are rendered after their parents
* Parents pass Props and State to children

```javascript
@@@javascript
<html>
  <body>
    <div id="root"/>
  </body>
  <script>
    ReactDom.render(<Profile />, document.getElementById('root'))
  </script>
</html>
```

# Building components with Iteration

* Iteration and Loops can be used just like in plain JavaScript

```javascript
@@@javascript
class Comment extends React.Component {
  render () {
    return (
      <li>
        <p>User: {this.props.user}</p>
        <p>Comment: {this.props.content}</p>
      </li>
    )
  }
}

class CommentList extends React.Component {
  render() {
    const comments = [
      { user: 'Joshua', content: 'Components are my favorite' },
      { user: 'Ada', content: 'Yes they make life easy'},
      { user: 'Alex', content: 'I know! I've loved them for years'}
    ];
    const commentComponents = forms.map((comment, index) => {
      return <Comment user={ comment.user } content={ comment.content }/>
    });

    return (
    <div className="comments">
      <h2>Comment List</h2>
      <ul>
      { commentComponents }
      </ul>
    </div>
    )
  }
}
```
