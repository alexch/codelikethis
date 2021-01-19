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

**Given** the player starts the game with the command `node index.js` in the terminal

**Then** the computer should ask the player if their number is a random number between 1 and 100

**And** waits for an answer, which it stores as a variable

<!--/BOX-->

<!--BOX-->
## Let the computer win

**Given** the computer has guessed a number

**When** the player responds "yes" (or "y")

**Then** the game exits with a victory message.

> e.g. `Your number was XX!`

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

**Then** the computer modifies the range it guesses within based on the answer

e.g. 

```
Is your number 41? no
Is your number higher(h) or lower(l)? h

```

**And** guesses a new number within the modified range

Given the example above the computer now guesses between 42 and 100

<details>
<summary>Hint</summary>
<div>
If the number is higher, you'll want to modify the low end of the range, and vice versa if the number is lower.
</div>
</details>

<!--/BOX-->

<!--BOX-->
## Make it smarter

* In the *optimal* solution, the game will find the correct number in no more than `[log2(n)+1]` guesses -- so for n=100, that's 7 guesses *max*. This solution is a good example of a *binary search algorithm*. 

**Given** The player chooses a number between 1 and 100

**When** the computer guesses a number

**Then** the computer should make a smart guess

**So That** the computer guesses the number in no more than 7 tries

<!--/BOX-->

<!--BOX-->
## Extend the guess range

**Given** the game has not been started

**When** the game is first called with `node index.js`

**Then** allow the user to set the high range so it could be any number greater than 1

<!--/BOX-->

<!--BOX-->
## Cheat Detector

**Given** a higher/lower response contradicts an earlier response

**Then** the computer complains

**And** asks again, or exits. e.g. `You said it was lower than 25, so it can't also be higher than 24!`

> Note: it is possible to set the logic up in a way so that the game won't allow the player to cheat, but we still need to be notified if they try it.

<!--/BOX-->

<!--BOX-->
## Role Reversal!

Now try and create the reverse game where the computer picks a number, and you guess it. Create a new file called `reverse_game.js` to hold this program 
   
**Given** The game has been started with `node reverse_game.js`

**Then** the game will ask you to guess a number

**And** if you guess wrong it will tell you if you guessed too high or too low

**And** prompt you to guess again

**When** you guess correctly the computer will congratulate you, and end the game

<!--/BOX-->

# Icebox

<!--BOX-->
**Play it again!**

When the game finishes, instead of exiting, it should ask you if you want to play again. If you say "yes" it should restart the game from the beginning, otherwise it exits.

<!--/BOX-->

<!--BOX-->
**How many tries?**

When the game finishes modify the victory message so it tells the user how many guesses it took for the computer to guess the correct number.

<!--/BOX-->

<!--BOX-->
**Combine the games**

Modify the program in `index.js` so that the user can choose whether to play the normal game, or the reverse game when the program is started with `node index.js`

<!--/BOX-->

## References

* https://www.khanacademy.org/computing/computer-science/algorithms/intro-to-algorithms/a/a-guessing-game - this page has a nice visualization of the game (click on the numbers in the box there) and nicely describes the binary search algorithm
* http://www.101computing.net/guess-the-number-binary-search/
* https://en.wikipedia.org/wiki/Binary_search_algorithm
* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random

