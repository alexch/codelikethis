# Tic Tac Toe

Tic Tac Toe (aka "Noughts and Crosses") is a simple game played between two players on a 3x3 grid.

![tic tac toe completed](tic_tac_toe.svg)

In this project you will implement the [game rules](https://en.wikipedia.org/wiki/Tic-tac-toe) and a text-based UI.

If you're ambitious you could [rewrite it later using HTML5 and JS events](web_text_game), but start with the console version, then later integrate the core game code with an HTML app.

## Wireframes

```
 1 | 2 | 3 
--- --- ---
 4 | 5 | 6  
--- --- ---
 7 | 8 | 9

Ready Player X
Move to? 2
```

```
 1 | X | 3 
--- --- ---
 4 | 5 | 6  
--- --- ---
 7 | 8 | 9

Ready Player O
Move to? _
```

## Stories

<!--box-->

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

<!--/box-->

<!--box-->

### Rules

**When** the user selects a cell that is not empty

**Then** the game says "Impossible! That cell is already full." and does not put an X or O in the cell

**And** the current player does not change
 
<!--/box-->
<!--box-->

### Win Condition

**Given** the turn has just ended

**When** if there are three Xs in a row, column, or diagonal

**Then** the system draws a line through the winning three cells

**And** the app says "Congratulations! Player X wins!"

**And** the game ends
 
(and the same for Player O)

<!--/box-->
<!--box-->

### Names

- when starting a game, choose the names of the players (not just X and O)

<!--/box-->
<!--box-->

### Artificial Stupidity

- choose "Player vs Player" or "Player vs AI" to start new game
- simple AI that picks a random empty cell
- human is always X and computer is always O

<!--/box-->
<!--box-->

### New Game UI (HTML VERSION ONLY)

- design a clean "New Game" UI allowing choice of human or computer, name, and symbol
- consider a modal dialog box
- consider button placement and visibility

<!--/box-->
<!--box-->

### Artificial Intelligence

- Instead of picking a random cell, the AI chooses the *best* random cell
- This will require R&D 
- See <https://www.youtube.com/watch?v=P2TcQ3h0ipQ> for inspiration

<!--/box-->
