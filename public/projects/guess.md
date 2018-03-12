# Guess The Number

In this game, the *human* thinks of a number between 1 and 100 and the *computer* tries to guess it.

In the *optimal* solution, the game will find the correct number in no more than [log2(n)+1] guesses -- so for n=100, that's 7 guesses *max*. This solution is a good example of a *binary search algorithm* (not to be confused with *binary notation* which is a different kind of binary). 

However, if you have trouble coding a binary search, start by getting it to work with something simpler, like guessing a [random number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) between 1 and 100. 

> "Make it work, make it right, make it fast -- in that order." - Kent Beck

## Usage
```
$ node guess.js
Please think of a number between 1 and 100 (inclusive).
Is it higher than 50? Y
Is it higher than 75? N
Is it higher than 63? Y
Is it higher than 69? N
Is it higher than 66? N
Is it higher than 65? Y
Your number was 66!
```

## Hints

> Think of the guesses not as *confirming* a possibility, but as *eliminating* a range of possible solutions.

> Remember to keep track of the previous answers, or at least keep track of the current high and low possibilities.

> Off-by-one errors will bite you here. Be clear in your own mind (and in the code!) about the distinction between "greater than" and "greater than or equal to" and the like.

> We've called it a "guess" but a better name might be "pivot" or "fulcrum" since it's essentially dividing the set of solutions in half.

## v2 
* After you get it working, make the computer seem even more intelligent and mysterious by randomly asking "lower" instead of "higher". Be sure to adjust the pivot value up or down by 1 as appropriate.
* Accept a parameter specifying the maximum guess; e.g. `node guess.js 500` means `Please think of a number between 1 and 500 (inclusive)`.

## References

* https://www.khanacademy.org/computing/computer-science/algorithms/intro-to-algorithms/a/a-guessing-game - this describes the reverse guessing game, where the *computer* thinks of a number and the *human* guesses it
* http://www.101computing.net/guess-the-number-binary-search/
* https://en.wikipedia.org/wiki/Binary_search_algorithm
* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random

