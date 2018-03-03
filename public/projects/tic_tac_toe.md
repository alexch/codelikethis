# Tic Tac Toe

Tic Tac Toe (aka "Noughts and Crosses") is a simple game played between two players on a 3x3 grid.

## Wireframes

`Ready Player: X`
![tic tac toe completed](tic_tac_toe.svg)

`[New Game]`

## Stories

### No Rules

**Given** an empty board, and 

**Given** the current player is X

**When** the user clicks on a cell

**Then** an X appears in that cell

**And** the turn ends
 
**And** the current player changes from X to O

<hr>

**Given** the player is O

**When** the user clicks on a cell

**Then** an O appears in that cell

**And** the turn ends, and the current player changes from O to X

### Rules

**When** the user clicks on a cell that is not empty

**Then** the game says "impossible!" and does not put an X or O in the cell

**And** the current player does not change
 

### Win Condition

**Given** the turn has just ended

**When** if there are three Xs in a row, column, or diagonal

**Then** the system draws a line through the winning three cells

**And** the app says "Congratulations! Player X wins!"

**And** the "Ready Player" message disappears
 
(and the same for Player O)

### Names

- when starting a game, choose the names of the players (not just X and O)

### Artificial Stupidity

- choose "Player vs Player" or "Player vs AI" to start new game
- simple AI that picks a random empty cell
- human is always X and computer is always O

### New Game UI

- design a clean "New Game" UI allowing choice of human or computer, name, and symbol

### Artificial Intelligence

- instead of picking a random cell, the AI chooses the *best* random cell
- this will require R&D 

