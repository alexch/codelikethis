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

* Before writing real code in a text editor, try writing *pseudocode* or a *flowchart* on paper. That will help you to understand the essence of the algorithm without getting bogged down in syntax (like semicolons and parentheses).

* Look back at the programs you've already written. Can you use any functions or logic you've already written?

* Think of the guesses not just as *confirming* a possibility, but as *eliminating* a range of possible solutions.

* We've called the currently-being-asked-about number a "guess", but a better name might be "pivot" or "fulcrum" since it's essentially dividing the set of solutions into two parts. (See the Khan Academy link below for a visualization of this effect.)

* Remember to keep track of the previous answers, or at least keep track of the current high and low possibilities.

* Off-by-one errors will bite you here. Be clear in your own mind (and in the code!) about the distinction between "greater than" and "greater than or equal to" and the like.

* Sign reversal errors are also a strong possibility. Be clear about the distinction between "my guess is higher than your number" and "your number is higher than my guess" and so forth.

## Backlog

* In the *optimal* solution, the game will find the correct number in no more than `[log2(n)+1]` guesses -- so for n=100, that's 7 guesses *max*. This solution is a good example of a *binary search algorithm* (not to be confused with *binary notation* which is a different kind of binary). Try implementing a binary search instead of a random search.

* Accept a parameter specifying the maximum guess; e.g. `node guess.js 500` means `Please think of a number between 1 and 500 (inclusive)`.

<details>
<div>
<summary>Hint 1</summary>
Remember our old friend `process.argv` can be used to pull arguments from the command 
</div>
</details>

<details>
<div>
<summary>Hint 2</summary>
You can set a default value to a variable using the logical 'or' operator.

```js
let maxNum = process.argv[2] || 100
```

</div>
</details>

* **Cheat detector**: if a response contradicts an earlier response, complain and ask again. e.g. `But you said it was lower than 25, so it can't also be higher than 24!`

<details>
<div>
<summary>Hint</summary>
How would <em>you</em> determine if someone was cheating in guess the number?
</div>
</details>

* **Role Reversal!** In two parts:
   1. Write the *reverse* game, where the *computer* thinks of a number and the *human* guesses it. (Put this in a different source file so you don't mess up the first program.)
   2. Combine your two programs into one, so the players (computer and human) take turns -- first one guesses, then the other, then repeat <br><br>

* **Refactor!** What code is shared between the two programs? Can you unify the code by extracting functions? Are your function and variable names descriptive? Can you remove any comments (without reducing clarity)?

<details>
<div>
<summary>Hint</summary>
You may want to make an `initialize` function that will ask which game you want to play and then call the function containing that version of the game depending on the users input.
</div>
</details>

* **Test!** How could you write unit tests for a game like this? Are there any parts of the algorithm that you can extract into a function, then write tests for just that function?

* **Test first!** Now that you've written it once, throw it away! Start over from scratch, but this time, use *test-driven development*: write a test, watch it fail, make it pass, repeat.

## References

* https://www.khanacademy.org/computing/computer-science/algorithms/intro-to-algorithms/a/a-guessing-game - this page has a nice visualization of the game (click on the numbers in the box there) and nicely describes the binary search algorithm
* http://www.101computing.net/guess-the-number-binary-search/
* https://en.wikipedia.org/wiki/Binary_search_algorithm
* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random

