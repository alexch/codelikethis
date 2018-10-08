# Animal

Based on an [vintage BASIC game](http://www.vintage-basic.net/games.html)  -- see the source code at [ANIMAL.BAS](http://www.vintage-basic.net/bcg/animal.bas) (but don't try to understand it; it's very dense).

This is a variation on [twenty questions]() -- the program flows like this:

1. The user thinks of an animal
2. The computer asks a yes/no question about that animal
3. The user answers the question
4. Repeat step 2 until the computer runs out of questions and guesses an animal
5. If the computer got it right, it wins!
6. If the computer got it wrong, then the player wins, and...
7. The player *writes a new question* that would distinguish the (wrong) guess from the (correct) animal, and the computer adds that to its list of questions for next time

## Tech

* storage
* data structures

## Design

This game demonstrates a classic use of a *binary tree*. At each node in the tree, there are two choices, each of which leads to a separate tree; eventually you reach an answer node, and that's the guess.

Here is a diagram:

```
            [Does it fly?]
             YES       NO
              /        \ 
[Does it tweet?]      [Does it bark?]
 YES       NO          YES       NO      
  |        |            |        |
[Bird]   [Bat]       [Dog]     [Cat]
```

Before sitting down to code this, plan your data structures using a notepad or a whiteboard. Try to design them abstractly (with boxes and arrows) first, then write out some sample JavaScript or JSON code. Make sure to think about the process of *adding* a new question or animal to the tree. What existing values need to change? What new values must be added? 


