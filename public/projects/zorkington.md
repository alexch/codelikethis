# Zorkington

![zork west of house](/images/zork-west-of-house.jpg)

[Zork](https://en.wikipedia.org/wiki/Zork) was not the first text adventure game, but it was the first to achieve commercial success.

In this project, you will create a version of Zork that takes place in the faraway kingdom of Burlington, Vermont.

## Links
 
* https://en.wikipedia.org/wiki/Zork
* https://classicreload.com/zork-i.html - Play Zork here!
* http://mentalfloss.com/article/29885/eaten-grue-brief-history-zork
* [Zork running in a web browser on an IBM 5050 PC emulator written in JavaScript.](https://www.pcjs.org/disks/pcx86/games/infocom/zork1/)


## Goals

* utilizing functions, and objects for a deeper understanding of encapsulation.
* understand state and state transitions, which are useful in many areas, e.g. 
  * photo carousel
  * buttons, menus, other widgets
  * parsers
  * network protocols

## Design

Your code will need to represent (or *reify*) several distinct states, including:

  * current room
    * room descriptions (immutable)
    * room connections (immutable)
    * room inventory (mutable)
  * current player
    * player inventory (mutable)
    * player status (mutable) (hungry, tired, etc.)  

Think about appropriate data structures for each of these. Note that you do not need to write code for these until you are actually implementing a story that requires them, but it is good to make a rough plan early on, to anticipate pitfalls and estimate how difficult upcoming stories will be.

Remember to *refactor*. Sometimes a data structure that works well for the simple case will need to be altered to work for the general case. In this project, the app will grow (more rooms, more commands) from story to story and your data structures should change to accomodate.

If you are not comfortable using classes, constructors, and objects you may save state in *global variables* like this:

```js
let currentRoom = null;
function moveToRoom(newRoom) {
  if (canMoveToRoom(newRoom)) {
    currentRoom = newRoom;
  }
}
```

>Note: Using functions and global variables may work for a simple version of this game, however it will be much, much harder to scale up.

You may want to create a [State Machine](/lessons/javascript/state_machines) to represent potential room transitions.

## And Don't Forget to Demo!

After implementing a story, *before* starting work on the next story...

* Ask a teacher or fellow student if they have time to "play client" for a demo
* Launch the program and let the client use it
* The client should try to prove that the program does what the story says it's supposed to do
* If the client rejects your story, keep coding until it works right, then do another demo

And during the day, take breaks, find other student teams and play each others' games!

# Stories

<!--BOX-->
## One Room

**When** the user launches the program

**Then** the console displays the following text

```
182 Main St.
You are standing on Main Street between Church and South Winooski.
There is a door here. A keypad sits on the handle.
On the door is a handwritten sign.
>_
```

(The chevron-and-underscore represents a prompt; the user should be able to type into it.)

**And** waits for input

**And** if the user types "gargle"

**Then** the game should output 

```
Sorry, I don't know how to gargle.
```

<!--/BOX-->

<details>
<summary>Hint</summary>
<div>
Since you're going to want to display the prompt over and over again it might make sense to put it inside a loop

```js
while(answer !== 'exit') {
  answer = await ask('>_ ')
}
```

</div>
</details>

<!--BOX-->
## Read the sign

**Given** the player is in the room "182 Main St."

**When** the player types "read sign"

**Then** the game displays the text

```
The sign says "Welcome to Burlington Code Academy! Come on 
up to the third floor. If the door is locked, use the code
12345."
```

**And** returns to the prompt

<!--/BOX-->

<details>
<summary>Hint</summary>
<div>
You could do this with nested logic statements, however that will get complicated fast.  Instead you may want to make your items objects with properties and methods.

```js
let sign = {
  read: function() {
    return "Welcome to Burlington Code Academy! Come on up to the third floor. If the door is locked, use the code 12345."
  }
}
```

</div>
</details>

<!--BOX-->
## Don't take the sign

**Given** the player is in the room `182 Main St.`

**When** the player types `take sign`

**Then** the game displays the text

```
That would be selfish. How will other students find their way?
```

(assume " **And** returns to the prompt" after this and all future stories)

<!--/BOX-->


<!--BOX-->
## Blocked

**Given** the player is in the room `182 Main St.`

**When** the player types `open door`

**Then** the game displays the text

```
The door is locked. There is a keypad on the door handle.
```
</span>

<!--/BOX-->
<!--BOX-->
## Speak friend and enter

**Given** the player is in the room `182 Main St.`

**When** the player types `enter code 12345` or `key in 12345`

**Then** the game displays the text

```
Success! The door opens. You enter the foyer and the door
shuts behind you.
```

**And** the player enters room `182 Main St. - Foyer`

<!--/BOX-->

<!--BOX-->
## Unauthorized Access

**Given** the player is in the room `182 Main St.`

**When** the player types `enter code 54321` (or any code that is not `12345`)

**Then** the game displays the text

```
Bzzzzt! The door is still locked.
```

**And** the player remains in room `182 Main St.`

<!--/BOX-->

<!--BOX-->
## Foyer

**Given** the player is in `182 Main St. - Foyer`

**Then** the game displays the text

```
You are in a foyer. Or maybe it's an antechamber. Or a 
vestibule. Or an entryway. Or an atrium. Or a narthex.
But let's forget all that fancy flatlander vocabulary,
and just call it a foyer. In Vermont, this is pronounced
"FO-ee-yurr".
A copy of Seven Days lies in a corner.
```

<!--/BOX-->
<!--BOX-->

## Inventory

**Given** the player is in `182 Main St. - Foyer`

**And** the player has not yet picked up Seven Days

**When** the player types `take paper` or `take seven days`

**Then** the game displays the text

```
You pick up the paper and leaf through it looking for comics 
and ignoring the articles, just like everybody else does.
```

**And** the paper is added to the player's inventory

<!--/BOX-->

<!--BOX-->

## Display Inventory

**Given** the paper is in the player's inventory

**When** the player types `i` or `inventory` or `take inventory`

**Then** the game displays the text

```
You are carrying:
A copy of Seven Days, Vermont's Alt-Weekly
```

<!--/BOX-->
<!--BOX-->

## Drop Inventory

**Given** the copy of Seven Days is in the player's inventory

**When** the player types `drop paper` or `drop seven days`

**Then** the copy of Seven Days is removed from the player's inventory

**And** the copy of Seven Days is added to the current room's inventory

<!--/BOX-->

<!--BOX-->

## More rooms and more stories, e.g.

* when you unlock the door to the foyer it *stays* unlocked

* `read paper` or `read seven days`

* `go up` or `go upstairs` 

* Bob speaks gibberish until you get him a cup of tea from Muddy's

    * then you can `attend lecture` or `sit down` or some other command to attend class
    
* After class you are `hungry` (status) which makes your stomach growl before every prompt

    * buying and eating a slice of pizza at Mr. Mike's removes the status

* [`xyzzy`](https://en.wikipedia.org/wiki/Xyzzy_(computing\))

Please *write stories* for each of these features *before* implementing them.

<!--/BOX-->

# Icebox

* Status line (showing room name)
* Web User Interface for the game
* write a *word wrapping* function and use it to format all output
