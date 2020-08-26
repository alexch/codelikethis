# Tic Tac Toe Web

Tic Tac Toe (aka "Noughts and Crosses") is a simple game played between two players on a 3x3 grid.

![tic tac toe completed](/images/tic_tac_toe.svg)

In this project you will implement the [game rules](https://en.wikipedia.org/wiki/Tic-tac-toe) in a web-based UI.

We recommend that you focus on the game's logic before you worry about the UI. It may be helpful to complete the [Tic Tac Toe (CLI)](tic_tac_toe) project (at least up to the "Artificial Stupidity" story). This will help you keep the *game rules* separate from the *user interface*, both in your mind and in your code. You may even be able to reuse many of the functions you wrote for that project.

## Wireframes

```
Tic Tac Toe

   |   |  
--- --- ---
   |   |  
--- --- ---
   |   |  

[Start Game]
```
---

```
Tic Tac Toe

   |   |  
--- --- ---
   |   |  
--- --- ---
   |   |  

Player X's turn
```
---
```
Tic Tac Toe

   | X |  
--- --- ---
   |   |  
--- --- ---
   |   |  

Player O's turn
```

# Stories

<!--BOX-->

## Start Game

**Given** an empty board

**When** the user clicks 'Start Game'

**Then** the 'Start Game' button is disabled ("grayed out")

**And** the status area contains "Player X's turn"

<!--/BOX-->


<!--BOX-->

## No Rules

**Given** an empty board, and the current player is X

**When** the user selects a cell

**Then** the board redraws

**And** an X appears in that cell, and the turn ends

**And** the current player changes from X to O

<hr>

**Given** the player is O

**When** the user selects a cell

**Then** an O appears in that cell

**And** the turn ends, and the current player changes from O to X

<!--/BOX-->

<!--BOX-->

## Rules

**When** the user selects a cell that is not empty

**Then** the game says "Please select an empty cell." and does not put an X or O in the cell

**And** the current player does not change

<!--/BOX-->
<!--BOX-->

## Win Condition

**Given** the turn has just ended

**When** if there are three Xs in a row, column, or diagonal

**Then** the system draws a line through the winning three cells

**And** the app says "Congratulations! Player X wins!"

**And** the game ends

(and likewise for Player O)

<!--/BOX-->
<!--BOX-->

## Names

**Given** a new game

**When** starting a game

**Then** allow the user(s) to choose the names of the players (not just X and O).

<!--/BOX-->
<!--BOX-->

## Game Time

**Given** a new game

**When** the game is started

**Then** the timer should show the time in the format:
- `Time Elapsed XX seconds`

**And** every second during game play, until a player has won, the clock should proceed by one second.

Example:
- 32 seconds
- 33 seconds
- 34 seconds

```
Tic Tac Toe

   | X | O
--- --- ---
   | O |  
--- --- ---
   | X |  

Player O's turn

Time Elapsed 32 seconds
```
<!--/BOX-->
<!--BOX-->

<!--BOX-->

## New Game UI

**Given** a new game

**When** the game first loads

**Then** give the user the options "Player vs Player" or "Player vs Computer"

<!--/BOX-->

## Artificial Stupidity

**Given** a new game with the options "Player vs Player" or "Player vs Computer"

**When** "Player vs Computer" is chosen

**Then** do not ask for a name
- The computer player always picks an empty cell *at random*
- The human is always X and the computer is always O

<!--/BOX-->

# Icebox

<!--BOX-->

## Game Time Formatted

After starting a game, a game clock timer is present in the lower region of the web page.

The timer should show the time in the format:
- Hours : Minutes : Seconds
- HH:MM:SS

(See example below)

Every second during game play, until a player has won, the clock should proceed by one second, incrementing the minutes, and hours as necessary.

Example:
- 00:59:57
- 00:59:58
- 00:59:59
- 01:00:00
- 01:00:01

```
Tic Tac Toe

   | X | O
--- --- ---
   | O |  
--- --- ---
   | X |  

Player O's turn

Time Elapsed 00:01:25
```

<!--/BOX-->

<!--BOX-->

## Artificial Intelligence

- Instead of picking a random cell, the AI chooses the *best* random cell
- This will require R&D
- See <https://www.youtube.com/watch?v=P2TcQ3h0ipQ> for inspiration

<!--/BOX-->

<!--BOX-->

## EXTRA SUPER BONUS: Play Nine Games at Once

- Change the rules of the game so that nine 3x3 boards are played at once by two players.
- A win can be achieved on any of the nine boards by placing three X's or three O's in a row.
- Winning on any board will award the player a win for the entire game.
- See this description for more information: http://www.stratigery.com/gen9.html

![tic-tac-toe-9x9](/images/tic-tac-toe-9x9.png)

<!--/BOX-->
