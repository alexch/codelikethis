# Object Labs

Feel like you need a bit more practice with objects?

Try out this handy selection of labs!

---

# Lab: Cubed

Create an object that represents a cube.  This object should have one property; side length, equal to 4, and two methods that calculate the volume, and the surface area of the cube based on side length.

```js
cube.side // => 4
cube.volume() // => 64
cube.area() // => 96
```

>Don't just set volume and area to return the numbers 64 and 96 respectively, that would be cheating! You have to use the side length to calculate these values.

---

# Cubed Solution

```js
let cube = {
  side: 4,
  volume() {
    return this.side**3
  },
  area() {
    return this.side**2 * 6
  }
}

console.log(cube.volume())
console.log(cube.area())
```

---

# Lab: Ideal Cake

Create an object that represents your ideal cake, and has a method you can call that returns a description of the cake.

Your cake should have properties for flavor, frosting, layers, and if it has sprinkles or not.

>In your `describe` method you must make use of your cakes properties, don't just return a string!

---

# Ideal Cake solution

```js
let myCake = {
  flavor: "chocolate",
  frosting: "caramel:",
  layers: 2,
  sprinkles: false,
  describe() {
    return "My favorite cake is " + this.flavor + " with " + this.frosting + " and " + this.layers + " layers " + this.sprinkles ? "and yummy sprinkles!" : "and NO sprinkles!"
  }
}

console.log(myCake.describe())
```

---

# Going Further with Cake

Try and think about ways you could extend your cake description. 

* Is it an icecream cake?
* Is there any sort of filling between layers?
* Does it have nuts, or chocolate chips baked in?

Extend your `describe` method to include these new values.

---

### Cake Factory

Make a class that constructs cakes based on your input e.g. `let myCake = new Cake("chocolate", "caramel", 2, false)` to create the cake from the lab solution.

---

# Lab: Escape Room

Create a command line application that simulates an escape room. Use objects to model the room, and different items in the room.  Your escape room should have:

* At least three items that must be found
* At least one puzzel to solve to escape the room
* An alert when you've succesfully escaped

The puzzel could be to find an item, use the item to unlock the room, or have nothing to do with the items at all. Your choice.

---

# Escape Room cont.

This is a larger lab that deals with more than just a single object. Before you start programming draw your room out on paper.

Think about how the different elements interact, and how you're going to track a player's progress through the room.

* How can you "hide" items in the room?
* How is your room built? Interconnected objects? Properties on a master object to represent different areas?
* How are you handling gameplay? A function? Method calls?
* How are you tracking progress? Global variables? A `player` object?

---

# Escape Room Solution

As this is a larger lab, and your solution may look significantly different than this. These hints might not correspond to your game structure.

```js
const readline = require('readline')
const rlInterface = readline.createInterface(process.stdin, process.stdout)

function ask(questionText) {
  return new Promise((resolve, reject) => {
    rlInterface.question(questionText, resolve)
  })
}

let inventory = []

class Item {
  constructor(name, description, action, takeable) {
    this.name = name;
    this.desc = description;
    this.takeable = takeable || false
    this.action = action || 'nothing happens...'
  }

  take() {
    if(this.takeable) {
      inventory.push(this.name)
      return `You picked up ${this.name}`
    } else {
      return "You can't take that"
    }
  }

  use() {
    
    if (this.name === 'desk' && inventory.includes('smallKey')) {
      return 'you open the drawer, inside is a large key'
    } else {
      return this.action
    }
  }
}

let desk = new Item('desk', 'A small writing desk.\nThere is a single drawer.', 'the desk is locked')

let rug = new Item('rug', 'a faded rug', 'you lift the rug\nunderneath is a small key')

let clock = new Item('clock', `the clock keeps ticking away\nthere is no way to open it`)

let smallKey = new Item('smallKey', 'a small key', 'this looks like it would fit the lock on the desk...', true)

let largeKey = new Item('largeKey', 'a large key', 'this looks like it would fit the lock on the door...', true)

let lookupTable = {
  desk: desk,
  rug: rug,
  clock: clock,
  smallKey: smallKey,
  largeKey: largeKey
}

async function play() {
  let userAction = await ask('What would you like to do? ')
  let inputArray = userAction.split(' ')
  let action = inputArray[0]
  let target = inputArray[1]

  if (action === 'use') {
    console.log(lookupTable[target].use())
    return play()
  }
  else if(action === 'examine') {
    console.log(lookupTable[target].desc)
    return play()
  }
  else if(action === 'take') {
    console.log(lookupTable[target].take())
    return play()
  }
  else if (action === 'leave') {
    if(inventory.includes('largeKey')) {
      console.log('Congratulations you win!')
      process.exit()
    } else {
      console.log('the door is locked')
      return play()
    }
  } else {
    console.log('sorry invalid input\ntry again...')
    return play()
  }
  
}

console.log('Welcome brave traveler to your DOOOOOOM!\nYou find yourself trapped in a small room, to your left is a small desk\nin the middle of the floor is a faded rug\nto your right is a grandfather clock\ndirectly across from you is the door out')

play()

```
---