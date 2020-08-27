# Guess The Number

Before starting to code this project, please find a partner and play this game together verbally for a few rounds.

1. Alice thinks of a number
2. Bob guesses a number
3. Alice says "higher", "lower", or "correct"
4. repeat 2 & 3 until Bob guesses correctly
5. repeat 1-4 with Alice guessing

After you get a feel for the game, it's time to write a software version of the game, where the *human* thinks of a number between 1 and 100 and the *computer* tries to guess it.

Think carefully about how the computer will guess a number. Start with it guessing a [random number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) between 1 and 100. Once that's working, high five, take a break, then try to use a more efficient guessing algorithm instead.

> "Make it work, make it right, make it fast -- in that order." - Kent Beck

## Usage

```
$ node guess.js
Please think of a number between 1 and 100 (inclusive).
I will try to guess it.

Is it... 50? N
Is it higher (H), or lower (L)? H
Is it... 75? N
Is it higher (H), or lower (L)? L
Is it... 63? N
Is it higher (H), or lower (L)? H
Is it... 69? N
Is it higher (H), or lower (L)? L
Is it... 66? Y
Your number was 66!
I guessed it in 5 tries.
```

## Hints

* Before writing real code in a text editor, try writing *pseudocode* or a *flowchart* on paper, or as comments in your program file. That will help you to understand the essence of the algorithm without getting bogged down in syntax (like semicolons and parentheses).

* Look back at the programs you've already written. Can you use any functions or logic you've already written?

* Think of the guesses not just as *confirming* a possibility, but as *eliminating* a range of possiblities.

* We've called the currently-being-asked-about number a "guess", but a better name might be "pivot" or "fulcrum" since it's essentially dividing the set of solutions into two parts. (See the Khan Academy link below for a visualization of this effect.)

* Remember to keep track of the previous answers, or at least keep track of the current high and low ends of the range.

* Off-by-one errors will bite you here. Be clear in your own mind (and in the code!) about the distinction between "greater than" and "greater than or equal to" and the like.

* Sign reversal errors are also a strong possibility. Be clear about the distinction between "my guess is higher than your number" and "your number is higher than my guess" and so forth.

* When you feel like your game is mostly functional have a classmate play it.  See how they break it, and try to make your game more robust.

# Stories

<!--BOX-->
## Pick a number, any number

**Given** the player starts the game

**Then** the computer should ask the player if their number is a random between 1 and 100

**And** waits for an answer, which it saves as a variable

<!--/BOX-->

<!--BOX-->
## Let the computer win

**Given** the computer has guessed a number

**When** the player responds "yes" (or "y")

**Then** the game exits with a victory message.

<!--/BOX-->

<!--BOX-->
## The computer guessed wrong

**Given** the computer has guessed a number

**When** the player responds "no" (or "n")

**Then** the computer asks if the number is higher or lower

<!--/BOX-->

<!--BOX-->
## Modify your guess range

**Given** the computer guessed the incorrect number

**When** the player responds "higher" ("h") or "lower" ("l")

**Then** the computer modifies the range it guesses within based on if the number was higher or lower

**And** guesses a new number within the modified range

<details>
<div>
<summary>Hint</summary>
If the number is higher, you'll want to modify the low end of the range, and vice versa if the number is lower.
</div>
</details>

<!--/BOX-->

<!--BOX-->
## Make it smarter

* In the *optimal* solution, the game will find the correct number in no more than `[log2(n)+1]` guesses -- so for n=100, that's 7 guesses *max*. This solution is a good example of a *binary search algorithm*. 

**Given** The player chooses a number between 1 and 100

**Then** the computer should guess the number in no more than 7 tries

<!--/BOX-->

<!--BOX-->
## Extend the guess range

**Given** the game has not been started

**When** the game is first called with `node index.js`

**Then** allow the user to set the high range so it could be any number (greater than 1)

<!--/BOX-->

<!--BOX-->
## Cheat Detector

**Given** a higher/lower response contradicts an earlier response

**Then** the computer complains

**And** asks again, or exits. e.g. `But you said it was lower than 25, so it can't also be higher than 24!`

<!--/BOX-->

<!--BOX-->
**Role Reversal!** In two parts:
   1. Write the *reverse* game, where the *computer* thinks of a number and the *human* guesses it. (Put this in a different source file so you don't mess up the first program.)
   2. Combine your two programs into one, so the players (computer and human) take turns -- first one guesses, then the other, then repeat <br><br>

   <details>
<div>
<summary>Hint</summary>
You may want to make an `initialize` function that will ask which game you want to play and then call the function containing that version of the game depending on the user's input.
</div>
</details>

<!--/BOX-->

# Icebox

<!--BOX-->
**Refactor!** What code is shared between the two programs? Can you unify the code by extracting functions? Are your function and variable names descriptive? Can you remove any comments (without reducing clarity)?

<!--/BOX-->

<!--BOX-->
**Test!** How could you write unit tests for a game like this? Are there any parts of the algorithm that you can extract into a function, then write tests for just that function?

<!--/BOX-->

<!--BOX-->
**Test first!** Now that you've written it once, throw it away! Start over from scratch, but this time, use *test-driven development*: write a test, watch it fail, make it pass, repeat.

<!--/BOX-->

## References

* https://www.khanacademy.org/computing/computer-science/algorithms/intro-to-algorithms/a/a-guessing-game - this page has a nice visualization of the game (click on the numbers in the box there) and nicely describes the binary search algorithm
* http://www.101computing.net/guess-the-number-binary-search/
* https://en.wikipedia.org/wiki/Binary_search_algorithm
* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random

