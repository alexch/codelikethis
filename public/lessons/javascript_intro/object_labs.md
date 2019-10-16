# Object Labs

Feel like you need a bit more practice with objects?

Try out this handy selection of labs!

# Lab: Cubed

Create an object that represents a cube.  This object should have one property; side length, equal to 4, and two methods that calculate the volume, and the surface area of the cube based on side length.

```js
cube.side // => 4
cube.volume() // => 64
cube.area() // => 96
```

>Don't just set volume and area to return the numbers 64 and 96 respectively, that would be cheating! You have to use the side length to calculate these values.

# Cubed Solution

<details>
<summary>Hint 1</summary>
<div>
The equation to get the volume of a cube is sidelength^3 (JavaScript power of operator = `**`).

The equation for the surface area is sidelength * sidelength * 6
</div>
</details>

<details>
<summary>Hint 2</summary>
<div>
The keyword `this` points to the object you're currently inside.

```js
this.side // => 4 when you're inside the cube object
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

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

</div>
</details>

# Lab: Ideal Cake

Create an object that represents your ideal cake, and has a method you can call that returns a description of the cake.

Your cake should have properties for flavor, frosting, layers, and if it has sprinkles or not.

>In your `describe` method you must make use of your cakes properties, don't just return a string!

# Ideal Cake solution

<details>
<summary>Hint 1</summary>
<div>
Your `flavor` and `frosting` properties should be strings.

`layers` can be a number or a string

`sprinkles` should be a boolean
</div>
</details>

<details>
<summary>Hint 2</summary>
<div>
You can use the Ternary operator to return different values based on a boolean e.g.

```js
this.sprinkles ? "with yummy sprinkles!" : "with NO sprinkles"
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

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

</div>
</details>

# Going Further with Cake

Try and think about ways you could extend your cake description. 

* Is it an icecream cake?
* Is there any sort of filling between layers?
* Does it have nuts, or chocolate chips baked in?

Extend your `describe` method to include these new values.

### Cake Factory

Make a class that constructs cakes based on your input e.g. `let myCake = new Cake("chocolate", "caramel", 2, false)` to create the cake from the lab solution.

# Lab: Escape Room

Create a command line application that simulates an escape room. Use objects to model the room, and different items in the room.  Your escape room should have:

* At least three items that must be found
* At least one puzzel to solve to escape the room
* An alert when you've succesfully escaped

The puzzel could be to find an item, use the item to unlock the room, or have nothing to do with the items at all. Your choice.

# Escape Room cont.

This is a larger lab that deals with more than just a single object. Before you start programming draw your room out on paper.

Think about how the different elements interact, and how you're going to track a player's progress through the room.

* How can you "hide" items in the room?
* How is your room built? Interconnected objects? Properties on a master object to represent different areas?
* How are you handling gameplay? A function? Method calls?
* How are you tracking progress? Global variables? A `player` object?

# Escape Room Solution

As this is a larger lab, and your solution may look significantly different than this. These hints might not correspond to your game structure.

<details>
<summary>Hint 1</summary>
<div>
To hide objects first create a simple inventory system for the room using an array. Then put "container" objects, which have <i>their own inventory</i> in the room's inventory.

```js
let box = {
  description: "a small box",
  inventory: [hiddenItem]
  open() {
    return this.inventory[0]
  }
}

let mainRoom = {
  inventory: [box]
}
```

You can now see the description of the container in the room, but not it's contents unless you "open" it.

</div>
</details>

<details>
<summary>Hint 2</summary>
<div>
Don't try and make a purely object-oriented model on your first pass. Use function calls, global variables, and whatever else works for you.

First make it work; then make it right!
</div>
</details>

<details>
<summary>Hint 3</summary>
<div>

Asynchronous functions are a good way to handle user input. Remember our old friend `await ask()`

```js
const readline = require('readline')
const readlineInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
};
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
const readline = require('readline')
const readlineInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function ask(questionText) {
  return new Promise((resolve, reject) => {
    readlineInterface.question(questionText, resolve);
  });
};

let player = {
  inventory: [],
  trapped: true,
  facing: "north",
  escape() {
    this.trapped = false
    return "The door unlocks with an audible click."
  }
}

let cabinet = {
  name: "cabinet",
  desc: "A large cabinet locked wih a heavy padlock",
  unlock() {
    this.desc = "A large cabinet.  Scrawled on the interior of the door is a message: The door code is 12345"
    return "You unlock the padlock with the key. You may now open the cabinate."
  }
}

writingDesk = {
  name: "Writing Desk",
  desc: "A fancy writing desk. One of the drawers is slightly ajar...",
  inventory: ['key'],
  takeKey() {
    let key = this.inventory.pop()
    player.inventory.push(key)
  }
}

paper = {
  name: "paper",
  desc: "The paper says: To free your mind start where all great stories start."
}

let room = {
  inventory: [
    cabinet,
    writingDesk,
    paper
  ],
  north: "The north wall of the room is blank, broken only by a large door with a keypad on the handle.\nThe door is locked",
  south: "On the south wall of the room is large cabinet.",
  east: "Set against the east wall is a fancy writing desk.",
  west: "Tacked to the west wall is a single sheet of paper",
}

async function play() {
  let userIn = await ask('>_ ')

  if(userIn.includes('exit') && !player.trapped) {
    console.log('You have escaped!')
    process.exit()
  }
  else if(userIn.includes('examine') && userIn.includes('desk')) {
    console.log(writingDesk.desc)
    play()
  }
  else if (userIn.includes('examine')&& userIn.includes('north')) {
    player.facing = 'north'
    console.log(room[player.facing])
    play()
  }
  else if (userIn.includes('examine')&& userIn.includes('south')) {
    player.facing = 'south'
    console.log(room[player.facing])
    play()
  }
  else if (userIn.includes('examine') && userIn.includes('east')) {
    player.facing = 'east'
    console.log(room[player.facing])
    play()
  }
  else if (userIn.includes('examine') && userIn.includes('west')) {
    player.facing = 'west'
    console.log(room[player.facing])
    play()
  }
  else if (userIn.includes('examine')&& userIn.includes('desk')) {
    player.facing = 'east'
    console.log(writingDesk.desc)
    play()
  }
  else if (userIn.includes('examine')&& userIn.includes('cabinet')) {
    player.facing = 'south'
    console.log(cabinet.desc)
    play()
  }
  else if (userIn.includes('examine')&& userIn.includes('paper')) {
    player.facing = 'west'
    console.log(paper.desc)
    play()
  }
  else if (userIn.includes('unlock')) {
    if(player.facing === 'south' && player.inventory.includes('key')) {
      console.log(cabinet.unlock())
      console.log(cabinet.desc)
    } else if (player.facing === 'north' && userIn.includes('12345')) {
      console.log(player.escape())
    } else {
      console.log("Nothing happens. Perhaps you're facing the wrong way?")
    }
    play()
  }
  else if(userIn.includes('examine')) {
    console.log(room[player.facing])
    play()
  }
  else if(userIn.includes('open') && userIn.includes('desk')) {
    console.log("You open the drawer.  Inside is a key.\n You take the key...")
    writingDesk.takeKey()
    play()
  } else {
    console.log('Invalid input')
    play()
  }
  
}

play()
```

</div>
</details>