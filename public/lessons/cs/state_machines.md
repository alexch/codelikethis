# What is a State Machine

1. A system with a number of defined 'states'.
2. Which can only be in one state at a time.
3. With defined rules to 'transition' between states.

# State Machine Example: Traffic Light

![traffic light](/images/traffic-light.jpg)

1. How many states? What are their names?
2. Can it be in more than one state at a time?
3. What are the rules for transitioning between states?

<small>image by [katerha](https://www.flickr.com/photos/katerha/6919352910)
</small>

# State Transition Diagram: Traffic Light

```
[G] -> [Y] -> [R]
 ^             |
  \___________/
```

Q: What if there was a "left turn ok" green light as well?

# State Machine Example: Simon

![simon game](/images/simon.jpg)

1. How many states? What are their names?
2. Can it be in more than one state at a time?
3. What are the rules for transitioning between states?

# State Transition Diagram: Simon

```
[G] <-> [Y] 
 ^ \   / ^
 |   X   |
 |  / \  |
 v       v
[R] <-> [B]
```

# State Machine Example: GUI Button

[TODO: picture(s) of MacOS button]

States:

1. Enabled
2. Disabled
3. Pressed
4. Active

Transitions:

* [enabled] -> mouseDown -> [pressed]
  * "when the mouse is pressed, render the button as being pressed"
* [pressed] -> mouseUp -> [active]
  * "when the button is 'down', and the user releases the mouse button, enter the 'active' state"
* [pressed] -> mouseExit -> [enabled]
  * "when the button is 'down', and the pointer leaves the button, re-render the button as up (not pressed)"
* [enabled] -> mouseUp -> []
  * "when the button is 'up', and the user releases the mouse button, do nothing"
* ... and so on

We may also need a state transition *action*: "when the button enters the 'active' state, send a 'click' event and then enter the 'Enabled' state"

# Why use a state machine?

1. Clarity
2. Predicability
3. Fail-fast debugging

* Many bugs are due to the system receiving unexpected input, or input that is inappropriate *at the moment*
  * (it's like rai-ee-ain on your wedding day)
* an "illegal state transition" error means something unexpected *just* happened
  * so you may need to add a new transition or state (or validation routine, or error handler) to handle it when it happens again
* Without a state machine, the system may remain in an invalid state for some time, making it harder to debug once something eventually *does* break

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

Easiest way is with something like this:

```js
let states = {
  "green": {canChangeTo: ["yellow"]},
  "yellow": {canChangeTo: ["red"]},
  "red": {canChangeTo: ["green"]}
}

let currentState = "green";

function enterState(newState) {
  let validTransitions = states[currentState].canChangeTo;
  if (validTransitions.includes(newState)) {
    currentState = newState;
  } else {
    throw "Invalid state transition attempted - from " + currentState + " to " + newState;
  }
}
```

