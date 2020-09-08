# Lifting State to Parents

* React components can manage their own state
* Often components need to communicate state to others
* Siblings do not pass state to each other directly
* State should pass through a parent, then trickle down

### Boiling Point Calculator

```jsx
function BoilingVerdict(props) {
  if (props.celsius >= 100) {
    return (
      <p>The water would boil.</p>;
    )
  }
  return (
    <p>The water would not boil.</p>
  )
}
```

# Lifting State - Calculator Input

* An element to collect input is needed
* The input is passed to the `BoilingVerdict` Component

```jsx
function Calculator (props) {

  const [temperature, setTemperature] = useState('')

  return (
    <fieldset>
      <legend>Enter temperature in Celsius:</legend>
      <input
        value={temperature}
        onChange={(evt) => {
          setTemperature(evt.target.value)
        }} />

      <BoilingVerdict
        celsius={parseFloat(temperature)} />

    </fieldset>
  );
}
```

[CodePen](https://codepen.io/Dangeranger/pen/jpJKGN?editors=0010)

# Lifting State - Another Input

* The calculator should work for Celsius & Fahrenheit

### What we want

```jsx
function Calculator (props) {

  return (
    <div>
      <TemperatureInput scale="c" />
      <TemperatureInput scale="f" />
    </div>
  );
}
```

### Extract TemperatureInput

```jsx
function TemperatureInput (props) {
  const [temperature, setTemperature] = useState('')

  const scale = props.scale;
  return (
    <fieldset>
      <legend>Enter temperature in {scaleNames[scale]}:</legend>
      <input value={temperature}
              onChange={(evt) => {
                  setTemperature(evt.target.value)
                }
              }
      />
    </fieldset>
    );
  }
}
```

# Lifting State - Passing State

* The components must be kept in sync
* Each TemperatureInput holds it's own state
* Sibling components can not communicate directly
* State can be moved to `Calculator` to achieve this

### Remove State from TemperatureInput

```jsx
function TemperatureInput (props) {
  

  /* Send changes to the parent */
  handleChange(evt) {
    props.setTemperature(evt.target.value);
    props.setScale(props.scale)
  }

  /* Use READ-ONLY Props instead of State */

  return (
    <fieldset>
      <legend>Enter temperature in {scaleNames[scale]}:</legend>
      <input value={props.temperature}
             onChange={this.handleChange} />
    </fieldset>
  );
}
```

# Lifting State - Parent State

* Children call `setTemperature` from props with new state
* Parent updates state with `setTemperature`
* Children re-render with new props

### Parent Calculator Passes State to Children

```jsx
function Calculator (props) {

    const [scale, setScale] = useState('c')
    const [temperature, setTemperature] = useState('')

    const celsius = scale === 'f' ? tryConvert(temperature, toCelsius) : temperature;
    
    const fahrenheit = scale === 'c' ? tryConvert(temperature, toFahrenheit) : temperature;

    return (
      <div>
        <TemperatureInput
          scale="c"
          temperature={celsius}
          setScale={setScale}
          setTemperature={setTemperature}
        />

        <TemperatureInput
          scale="f"
          temperature={fahrenheit}
          setScale={setScale}
          setTemperature={setTemperature}
        />

        <BoilingVerdict
          celsius={parseFloat(celsius)} />
      </div>
    );
  }
}
```

[CodePen](https://codepen.io/Dangeranger/pen/djrKLj?editors=0010)

# Lifting State - Live Example

<p data-height="265" data-theme-id="light" data-slug-hash="djrKLj" data-default-tab="js,result" data-user="Dangeranger" data-pen-title="djrKLj" class="codepen">See the Pen <a href="https://codepen.io/Dangeranger/pen/djrKLj/">djrKLj</a> by Joshua Burke (<a href="https://codepen.io/Dangeranger">@Dangeranger</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

# Lifting State - Conclusions

* A single "point of truth" holds the state
* Components communicate state by lifting it up to a Parent
* Child components use a Parent updater function to lift state up
* State flowing down makes state changes simpler to debug
* Props should be derived from State

# Lab: Post Selector

Let's create a React component that consists of two main components; a list of posts, and a display box. These should be two seperate components. You will also need a parent component that renders both the list, and the display box.

Using state and props set up the page so that when you click on a post the cotent is rendered in the display box.

> Hint: If you want to store your posts locally it might be easiest to create JSON files to represent the posts. Or you could just use [JSONPlaceholder](https://jsonplaceholder.typicode.com/)

### Links

- [Top Down Data Flow](https://reactjs.org/docs/state-and-lifecycle.html#the-data-flows-down)
