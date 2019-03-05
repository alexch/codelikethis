# Tic Tac Toe Web

Tic Tac Toe (aka "Noughts and Crosses") is a simple game played between two players on a 3x3 grid.

![tic tac toe completed](tic_tac_toe.svg)

In this project you will implement the [game rules](https://en.wikipedia.org/wiki/Tic-tac-toe) in a web-based UI.

We recommend that before you start this project, you complete the [Tic Tac Toe (CLI)](tic_tac_toe) project (at least up to the "Artificial Stupidity" story). This will help you keep the *game rules* separate from the *user interface*, both in your mind and in your code. You may even be able to reuse many of the functions you wrote earlier.

Template repository: https://github.com/BurlingtonCodeAcademy/tic-tac-toe-www -- either clone this directly, or use your own GitHub Classroom repo.

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

## Backlog

The backlog is an ordered list of *user stories* (aka *features*). Make sure to implement them *in order*, and don't move on to the next one until you're confident that your current story meets all the requirements. Some features already have *acceptance tests* written in Cypress; make sure these work and also feel free to add your own tests in the `cypress/integration` directory.

<!--BOX-->

### Start Game

**Given** an empty board

**When** the user clicks 'Start Game'

**Then** the 'Start Game' button is disabled ("grayed out")

**And** the status area contains "Player X's turn"

<!--/BOX-->


<!--BOX-->

### No Rules

**Given** an empty board, and

**Given** the current player is X

**When** the user selects a cell

**Then** the board redraws

**And** an X appears in that cell

**And** the turn ends

**And** the current player changes from X to O

<hr>

**Given** the player is O

**When** the user selects a cell

**Then** an O appears in that cell

**And** the turn ends, and the current player changes from O to X

<!--/BOX-->

<!--BOX-->

### Rules

**When** the user selects a cell that is not empty

**Then** the game says "Please select an empty cell." and does not put an X or O in the cell

**And** the current player does not change

<!--/BOX-->
<!--BOX-->

### Win Condition

**Given** the turn has just ended

**When** if there are three Xs in a row, column, or diagonal

**Then** the system draws a line through the winning three cells

**And** the app says "Congratulations! Player X wins!"

**And** the game ends

(and likewise for Player O)

<!--/BOX-->
<!--BOX-->

### Names

When starting a game, allow the user(s) to choose the names of the players (not just X and O).

<!--/BOX-->
<!--BOX-->

### Artificial Stupidity

- When starting a new game, choose "Player vs Player" or "Player vs Computer"
- If "Player vs Computer" is chosen, then do not ask for a name
- The computer player always picks an empty cell *at random*
- The human is always X and the computer is always O

<!--/BOX-->
<!--BOX-->

### New Game UI

- design a clean "New Game" UI allowing choice of human or computer, name, and symbol
- consider using a modal dialog box
- consider button placement and visibility

<!--/BOX-->
<!--BOX-->

### Artificial Intelligence

- Instead of picking a random cell, the AI chooses the *best* random cell
- This will require R&D
- See <https://www.youtube.com/watch?v=P2TcQ3h0ipQ> for inspiration

<!--/BOX-->

<!--BOX-->
### EXTRA BONUS: Play Nine Games at Once

- Change the rules of the game so that nine 3x3 boards are played at once by two players.
- A win can be achieved on any of the nine boards by placing three X's or three O's in a row.
- Winning on any board will award the player a win for the entire game.
- See this description for more information: http://www.stratigery.com/gen9.html

![tic-tac-toe-9x9](tic-tac-toe-9x9.png)

<!--/BOX-->
