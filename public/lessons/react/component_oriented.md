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

# Immutable Components

* Once components are rendered they cannot be updated
* Re-rendering the component is how to update

## Clock Example

```javascript
<html>
  <body>
    <div id="root"/>
  </body>
  <script>
    function tick() {
      const element = (
        <div>
          <h1>Hello, world!</h1>
          <h2>It is {new Date().toLocaleTimeString()}.</h2>
        </div>
      );
      // highlight-next-line
      ReactDOM.render(element, document.getElementById('root'));
    }

    setInterval(tick, 1000);
  </script>
</html>
```

# Ticking Clock Live

<iframe height='265' scrolling='no' title='React Clock Example' src='//codepen.io/Dangeranger/embed/gjdNEB/?height=265&theme-id=light&default-tab=js,result&embed-version=2' frameborder='no' allowtransparency='true' allowfullscreen='true' style='width: 100%;'>See the Pen <a href='https://codepen.io/Dangeranger/pen/gjdNEB/'>React Clock Example</a> by Joshua Burke (<a href='https://codepen.io/Dangeranger'>@Dangeranger</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>

## Link <https://codepen.io/Dangeranger/pen/gjdNEB>

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
