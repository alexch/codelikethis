    link name: "What do programmers mean by 'elegant' code?",
        href: "https://www.quora.com/What-do-programmers-mean-by-elegant-code"
    link name: "Refactoring", href: "https://refactoring.com/",
        description: "Martin Fowler literally wrote the book on refactoring"
    link name: "Refactoring Lesson", href: "/lessons/agile/refactoring", 
        description: "on this site"
    link name: "The Wrong Abstraction", href: "https://www.sandimetz.com/blog/2016/1/20/the-wrong-abstraction", description: "by Sandi Metz"

# Take a Minute to Refactor: Winner

This lesson follows a series of one-minute screencast videos to teach refactoring by example.

 * [YouTube Playlist](https://www.youtube.com/playlist?list=PLLdA7yJIWF1oKzxrRIqJU8MQ3qblY9HFH)

## What is Refactoring?

noun: a change made to the internal structure of software to make it easier to understand and cheaper to modify without changing its observable behavior

verb: to restructure software by applying a series of refactorings without changing its observable behavior.

# Winner Part 1

<!VIDEO 4O8_bfCH8T4>

Let's say you're writing a tic tac toe program.

Before you write too much code you should have an idea for your **data structure**
(also called a data model or a schema in different contexts).

In this case, we're using a single array to represent the board
and the cells will be numbered from left-to-right
and top-to-bottom, like this:

```
 0 | 1 | 2
--- --- ---
 3 | 4 | 5
--- --- ---
 6 | 7 | 8
```

The value inside each cell is either null, 'X', or 'O'. For example, this board:

```
 X |   | O
--- --- ---
 X | O |
--- --- ---
 X |   |
```

would be represented by this array:

```javascript
[ 'X', null, 'O', 'X', 'O', null, 'X', null, null ]
```

So now let's say you've got a function called `winner()` that checks to see if either player has won the game.

```javascript
function winner(board) {
  let winner = null;

  if (board[0] === board[1] && board[1] === board[2]) {
    winner = board[0];
  } else if (board[3] === board[4] && board[4] === board[5]) {
    winner = board[3];
  } else if (board[6] === board[7] && board[7] === board[8]) {
    winner = board[6];
  } else if (board[0] === board[4] && board[4] === board[8]) {
    winner = board[0];
  } else if (board[2] === board[4] && board[4] === board[6]) {
    winner = board[2];
  } else if (board[0] === board[3] && board[3] === board[6]) {
    winner = board[0];
  } else if (board[1] === board[4] && board[4] === board[7]) {
    winner = board[1];
  } else if (board[2] === board[5] && board[5] === board[8]) {
    winner = board[2];
  }
  return winner;
}
```

It seems to work okay, 
but just looking at it you can see a lot of duplication.
And you're not exactly sure how to clean it up.

One thing you can always do is **extract some functions** with descriptive names
to help you understand what the function is doing
a little better.

```javascript
if (board[0] === board[1] && board[1] === board[2]) {
  winner = board[0];
}
```

This first condition is checking the top row
so let's put it in a function named "check top row".

In [VS Code](https://code.visualstudio.com/) you do this by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>R</kbd> and selecting "Extract to inner function" (which allows the `board` parameter to remain in scope).


```javascript
  function checkTopRow() {
    return board[0] === board[1] && board[1] === board[2];
  }

  if (checkTopRow()) {
    winner = board[0];
  }
```

And let's do the same with the second condition, and the third.

So now your code is *longer* but *skinnier* --
 (more lines but each line is shorter)
and more *self-documenting*
 (because each line is inside a function whose name is meaningful).

```javascript
function winner(board) {
  let winner = null;
  if (checkTopRow()) {
    winner = board[0];
  } else if (checkMiddleRow()) {
    winner = board[3];
  } else if (checkBottomRow()) {
    winner = board[6];
  } else if (checkDiagonal()) {
    winner = board[0];
  } else if (checkOtherDiagonal()) {
    winner = board[2];
  } else if (checkLeftColumn()) {
    winner = board[0];
  } else if (checkMiddleColumn()) {
    winner = board[1];
  } else if (checkRightColumn()) {
    winner = board[2];
  }
  return winner;

  function checkRightColumn() {
    return board[2] === board[5] && board[5] === board[8];
  }

  function checkMiddleColumn() {
    return board[1] === board[4] && board[4] === board[7];
  }

  function checkLeftColumn() {
    return board[0] === board[3] && board[4] === board[6];
  }

  function checkOtherDiagonal() {
    return board[2] === board[4] && board[4] === board[6];
  }

  function checkDiagonal() {
    return board[0] === board[4] && board[4] === board[8];
  }

  function checkBottomRow() {
    return board[6] === board[7] && board[7] === board[8];
  }

  function checkMiddleRow() {
    return board[3] === board[4] && board[4] === board[5];
  }

  function checkTopRow() {
    return board[0] === board[1] && board[1] === board[2];
  }
}
```

# Winner Part 2

<!VIDEO boTiYozVs3k>

We now have a bunch of functions that are identical
except for three values.

So now the duplication is a little more apparent,
 but it's still hard to understand what's going on.

So let's name those values by using the **extract variable** refactoring.

In [VS Code](https://code.visualstudio.com/) you do this by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>R</kbd> and selecting "Extract to constant in enclosing scope".

They're all cells, so let's name them `cell1`, `cell2`, and `cell3`.

```javascript
  function checkRightColumn() {
    const cell1 = 2;
    const cell2 = 5;
    const cell3 = 8;
    return board[cell1] === board[cell2] && board[cell2] === board[cell3];
  }
```

And now that we've named the variables, we can extract *another* function...

(<kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>R</kbd> and select "Extract to inner function in function 'winner'").

...and like magic, its **parameters** get named correctly!

```javascript
  function checkCells(cell1, cell2, cell3) {
    return board[cell1] === board[cell2] && board[cell2] === board[cell3];
  }
```


# Winner Part 3

<!VIDEO WqSTBVgrxKY>

So now that we have a generalized `checkCells` function,
we want to start using that new `checkCells` function from all the other check functions.

Our editor doesn't have a way to instantly replace similar code with a call to our new function, but that's okay; we can do it by hand.

If I was inspired, I could use a regular expression and search-and-replace, but it's usually faster to do it manually.

And doing it manually is actually a good way to find bugs! Like this bug I had inside `checkLeftColumn`... the original code "accidentally" compared 4 cells, not 3, but it was hard to see.

```javascript
  function checkCells(cell1, cell2, cell3) {
    return board[cell1] === board[cell2] && board[cell2] === board[cell3];
  }

  function checkRightColumn() {
    return checkCells(2, 5, 8);
  }

  function checkMiddleColumn() {
    return checkCells(1, 4, 7);
  }
  
  // etc.
```

After this, it's now quite clear that "right column" means "cells 2, 5, and 8" and so forth.

One key way to make your code clean is to **give meaningful names** to your program's concepts, and to make those names clear in the code.

# Winner Part 4

<!VIDEO HAD1ogLhQLI>

Let's go back and look at the original function.
It's easier to understand but it's still kind of messy.

We've "abstracted out" (aka *reified*) the concept of *checking* for a winner,
but we still need to do the same for the concept of figuring out *which* player has won.
(This is currently embodied in the `winner` variable; assigning a value to `winner` and then returning it is the main purpose of the original function.)

```javascript
  if (checkTopRow()) {
    winner = board[0];
  } else if (checkMiddleRow()) {
    winner = board[3];
  } //etc.
```

The other big problem is that this outer code still refers to individual cells by number -- we want to hide that detail, to put it near the other code that knows what cells correspond to what lines.

Fortunately, JavaScript lets us cheat a little.

Currently our `checkCells` function returns `true` or `false`. But if we want, we can use the *actual value* of the cells instead of `true`.

That's going to be either `'X'` or `'O'` depending on which symbol is in all those cells -- or `undefined` if there's no winner yet.

Then the outer function can use that return value
instead of looking into the board directly.

```javascript
function winner(board) {
  let winner = null;
  if (checkTopRow()) {
    winner = checkTopRow();
  } else if (checkMiddleRow()) {
    winner = checkMiddleRow();
  } else if (checkBottomRow()) {
    winner = checkBottomRow();
  } else if (checkDiagonal()) {
    winner = checkDiagonal();
  } else if (checkOtherDiagonal()) {
    winner = checkOtherDiagonal();
  } else if (checkLeftColumn()) {
    winner = checkLeftColumn();
  } else if (checkMiddleColumn()) {
    winner = checkMiddleColumn();
  } else if (checkRightColumn()) {
    winner = checkRightColumn();
  }
  return winner;

  function checkCells(cell1, cell2, cell3) {
    if (board[cell1] === board[cell2] && board[cell2] === board[cell3]) {
      return board[cell1];
    }
  }
```

There's still a lot of duplication in this code, but it's important to note that we haven't introduced any new duplication during this step. Instead, we made explicit the duplication that was already there, in the repeated `winner = board[x]` lines.

# Winner Part 5

<!VIDEO BjG4_YjYn-E>

So now we've replaced some very specific, very duplicative code with a series of well-named function calls. We're finally able to see clearly what the original function was doing.

Essentially, we made our code into [pseudocode](https://en.wikipedia.org/wiki/Pseudocode).

So where do we go from here?

Well, one possibility is to just leave it alone. It's still got a lot of duplication, but as Sandi Metz says, ["The cost of duplication is lower than the cost of the wrong abstraction."](https://www.sandimetz.com/blog/2016/1/20/the-wrong-abstraction)

Another possibility is to delete the code and start from scratch. Now that we have an idea of the concepts and terms and algorithms, we could treat our first attempt as a "spike" and build it again.

> ["Build one to throw away."](http://wiki.c2.com/?PlanToThrowOneAway) - Fred Brooks, the Mythical Man Month

# Winner Part 6

<!VIDEO 7AKgom_Qm6E>

When I read this code, I can see a pattern:

 * if top row then winner = top row
 * else if middle row then winner = middle row
 * and so on, following the pattern "if X then winner = X"

Essentially, we are walking through a series of win conditions, and bailing out when we find one that's true.

That sounds a lot like an [iteration method](/lessons/javascript/iteration_methods) to me. Specifically "find".. but I don't think "find" will quite work here...

So let's just put all these functions in an array and iterate through that array.

```javascript
function winner(board) {
  const winConditions = [
    checkTopRow,
    checkMiddleRow,
    checkBottomRow,
    checkLeftColumn,
    checkMiddleColumn,
    checkRightColumn,
    checkDiagonal,
    checkOtherDiagonal
  ];
  let winner = null;
  for (let condition of winConditions) {
    if (condition()) {
      winner = condition();
      break;
    }
  }
  return winner;
```

Now it's a little more clear that we're doing the same thing again and again to each item in a series.

Another thing that's easier to see is that the "winner" variable is redundant with the function's return value. So we can simplify some more by moving it inside the loop.

```javascript
function winner(board) {
  const winConditions = [
    checkTopRow,
    checkMiddleRow,
    checkBottomRow,
    checkLeftColumn,
    checkMiddleColumn,
    checkRightColumn,
    checkDiagonal,
    checkOtherDiagonal
  ];
  for (let condition of winConditions) {
    let winner = condition();
    if (winner) {
      return winner;
    }
  }
  return null;
```


# Winner Part 7

<!VIDEO -W6lJTBxsPo>

We're almost done with this refactoring path. I can see the finish line right up ahead!

Scanning the entire function now, I can see that the various "check" functions aren't really pulling their weight. Each one is not much more than a name for a triplet of data.

So let's turn them from functions back into data.

First I want to use the *most useful refactoring*: **Rename**. In VS Code, that's as simple as hitting <kbd>F2</kbd>.

And finally I want to "inline" the data by turning the "winConditions" array into a Hash, also called a JavaScript Object.

```javascript
function winner(board) {
  const winConditions = {
    topRow: [0, 1, 2],
    middleRow: [3, 4, 5],
    bottomRow: [6, 7, 8],
    leftColumn: [0, 3, 6],
    middleColumn: [1, 4, 7],
    rightColumn: [2, 5, 8],
    diagonal: [0, 4, 8],
    otherDiagonal: [2, 4, 6]
  };
  for (let condition of Object.values(winConditions)) {
    let winner = checkCells(condition);
    if (winner) {
      return winner;
    }
  }
  return null;

  function checkCells(cell1, cell2, cell3) {
    if (board[cell1] === board[cell2] && board[cell2] === board[cell3]) {
      return board[cell1];
    }
  }
}
```

Now, you might ask, "Why didn't we just put the triplets into a hash in the first place?" That's a fine idea, and maybe next time we see similar code, we will. But a major point of refactoring is to help you see things that are not immediately obvious, or are apparent only in hindsight. Also, tiny refactorings are more difficult to mess up than large ones -- and easier to revert -- so even if you think you know where you are going, it's often better to go the long way, rather than try to jump directly there.

You might also ask, "Where are the unit tests?" **Good question!** In fact, in this very video series, I made a stupid mistake in each of the last two steps -- using `for..in` instead of `for..of`, and then forgetting to use `Object.values` to get the triplets. If I had been running my tests, they would have told me, "Whoa, Nelly!" And if I'm using version control -- and making a commit after each successful refactoring step -- I can easily revert to a recent known good version (aka "green build") and try again.

