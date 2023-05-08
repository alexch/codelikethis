# Tic Tac Toe

Tic Tac Toe (aka "Noughts and Crosses") is a simple game played between two players on a 3x3 grid.

![tic tac toe completed](/images/tic_tac_toe.svg)

In this project you will implement the [game rules](https://en.wikipedia.org/wiki/Tic-tac-toe) and a terminal-based UI.

We recommend that you implement this command-line, terminal UI project before starting the [Tic Tac Toe (WWW)](tic_tac_toe_www) project.

<small>(image source: [Public Domain](https://en.wikipedia.org/wiki/Tic-tac-toe#/media/File:Tic_tac_toe.svg))</small>

## Wireframes

After launching the program and starting the game, the terminal should display this:

```
 1 | 2 | 3
--- --- ---
 4 | 5 | 6
--- --- ---
 7 | 8 | 9

Player X's turn
Move to?
```

---

After the user (acting as Player X) types <kbd>2</kbd> <kbd>Enter</kbd>, the board should redraw like this:

```
 1 | X | 3
--- --- ---
 4 | 5 | 6
--- --- ---
 7 | 8 | 9

Player O's turn
Move to? 
```
---

Next, after the user (now acting as Player O) types <kbd>5</kbd> <kbd>Enter</kbd>, the board should redraw like this:

```
 1 | X | 3
--- --- ---
 4 | O | 6
--- --- ---
 7 | 8 | 9

Player X's turn
Move to? 
```

# Stories

<!--BOX-->

## No Rules

**Given** an empty board

**And** the current player is X

**When** the user selects a cell (e.g. typing <kbd>2</kbd> <kbd>Enter</kbd>)

**Then** the board redraws, and an X appears in that cell

**And** the turn ends, and the current player changes from X to O

>And likewise for player O

<!--/BOX-->

<!--BOX-->

## Rules

**When** the user selects a cell that is not empty

**Then** the game says "That cell is already full. " 

**And** the board state is unchanged (it does not put an X or O in the cell)

**And** the current player does not change

<!--/BOX-->

<!--BOX-->

## Win Condition

**Given** the turn has just ended

**When** there are three Xs in a row, column, or diagonal

**Then** the system draws a line through the winning three cells

**And** the app says "Congratulations! Player X wins!"

**And** the game ends

> And likewise for Player O

<!--/BOX-->

<!--BOX-->

## Stalemate

**Given** all cells are full 

**And** neither player has three in a row

**When** the turn ends

**Then** the app says "Stalemate!"

**And** the game ends

<!--/BOX-->

<!--BOX-->

## Names

**When** starting a game, choose the names of the players (not just X and O).

**Then** display the name of a player, and also say which symbol they are (X or O), e.g. `Alice's turn (X)`

<!--/BOX-->

<!--BOX-->

## Artificial Stupidity

**Given** a new game with the options "Player vs Player" or "Player vs Computer"

**When** "Player vs Computer" is chosen

**Then** do not ask for a name
- The computer player always picks an empty cell *at random*
- The human is always X and the computer is always O

<!--/BOX-->

# Icebox

<!--BOX-->

## Artificial Intelligence

- Instead of picking a random cell, the AI chooses the *best* random cell
- This will require R&D
- See <https://www.youtube.com/watch?v=P2TcQ3h0ipQ> for inspiration

<!--/BOX-->
