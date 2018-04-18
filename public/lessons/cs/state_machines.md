# What is a State Machine

1. A system with a number of defined 'states'.
2. Which can only be in one state at a time.
3. With defined rules to 'transition' between states.

# State Machine Example: Traffic Light

![traffic light]()

[todo: traffic light pic]

1. How many states? What are their names?
2. Can it be in more than one state at a time?
3. What are the rules for transitioning between states?

# State Transition Diagram

```
[G] -> [Y] -> [R]
 ^             |
  \___________/
```

# State Machine Example: GUI Button

[TODO: picture(s) of MacOS button]

States:

1. Enabled
2. Disabled
3. Depressed
4. Active

Transitions:

* [1] mouseDown -> [3]
  * "when the mouse is pressed, render the button as being pressed"
* [3] mouseUp -> [4]
  * "when the button is 'down', and the user releases the mouse button, enter the 'active' state"
* [3] mouseExit -> [1]
  * "when the pointer leaves the button, re-render the button as up (not pressed)"
* [1] mouseUp -> [1]
  * "when the button is 'up', and the user releases the mouse button, do nothing"

We will also need a state transition *action*: "when the button enters the 'active' state, send a 'click' event and then enter the 'Enabled' state"

# Why use a state machine?

1. Clarity
2. Predicability
3. Fail-fast debugging

* Many bugs are due to the system receiving unexpected input
* If you get an "illegal state transition" error, then something unexpected *just* happened, and you may need to add a new transition or state to handle it when it happens again

# State of the State

> The term "state" has several overlapping meanings.

* in general, "state" means any data
  * especially in OO, e.g. "state and behavior" means "instance variables and instance methods"
* in particular, "state" means "there is a clear state transition diagram at work here"

> The term "state machine" has several technical variants as well.

* "Infinite State Machine" e.g. Turing Machine
* "Finite State Machine" or "Finite State Automaton" e.g. Conway's Game of Life

<https://en.wikipedia.org/wiki/Finite-state_machine>

# How to implement a state machine?

> There's more than one way to do it.

Easiest way is to something like this:

```js
@@@js
let stateTransitions = {
  "green": ["yellow"],
  "yellow": ["red"],
  "red": ["green"]
}

let currentState = "green";

function enterState(newState) {
  validTransitions = stateTransitions[currentState];
  if (validTransitions.includes(newState)) {
    currentState = newState;
  } else {
    throw "Invalid state transition attempted - from " + currentState + " to " + newState;
  }
}
```

