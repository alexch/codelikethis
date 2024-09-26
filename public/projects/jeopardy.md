# Jeopardy

Jeopardy! The great American quiz show has been a staple of network television since the 60s.  In this project we will be creating our own Jeopardy games that will run in the browser using the awesome powers of HTML, and JavaScript!

The game of Jeopardy consists of several teams that copmete to earn points by selecting questions of varying points values from a board. The board is a 6 X 6 square with each column representing a category, and the first row containing the titles of each category, and every row after being incresingly difficult questions (with correspondingly higher point values) for their categories

We are going to make a slightly smaller version of Jeopardy with only four categories, but still five levels of questions. You may create a game with the full six categories if you want, but we recommend you do that *after* you've succesfully completed all the stories for the  four category game. (We want you to be focused on writing code, not questions.)

We also recommend you start with it being a two player game *until* you reach the story to add multiple teams. It will help you focus more on creating a solid set of game rules before extending them to cover more teams.

# Stories

<!--BOX-->

## Start Game

**Given** the game has not been started

**When** the user clicks 'Start Game'

**Then** the 'Start Game' button is disabled ("grayed out")

**And** the status area contains "Team One's turn"

<!--/BOX-->


<!--BOX-->

## Select a Question

**Given** an empty board, and team one is currently up

**When** the user selects a card

**Then** the score on the card is replaced by a question

**And** The "Submit Answer" button is enabled

**And** the "Pass Question" button is enabled

<!--/BOX-->

<!--BOX-->

## Pass a Question

**Given** a question has been chosen

**When** the user clicks on the "Pass Question" button

**Then** the next team gets an opportunity to answer the question

<!--/BOX-->

<!--BOX-->

## Answer a Question Correctly

**Given** a question has been chosen

**When** the user submits an answer

**And** the answer is correct

**Then** the game awards the player's team 100 points

**And** the card is removed from the board

**And** the current team does not change

<!--/BOX-->

<!--BOX-->

## Respect the Row

**When** the user submits an answer

**And** the answer is correct

**Then** the game awards the amount of points appropriate for the card's row to the guesser's team

<!--/BOX-->

<!--BOX-->

## Answer a Question Incorrectly

**Given** a question has been answered

**And** the answer is *incorrect*

**When** the user submits the answer

**Then** the game *subtracts* the points value of the card from the player's score

**And** the next team gets an opportunity to answer the question

<!--/BOX-->


<!--BOX-->

## Only Allow One Question

**Given** a card has been selected

**When** the user tries to pick a new card

**Then** the question does not change

**And** the game alerts the player that they must answer, or pass the question

<!--/BOX-->

<!--BOX-->

## Score Board

**Given** the game has been started

**Then** the game should display each team's current score on the page

<!--/BOX-->

<!--BOX-->

## Winner

**Given** the final question is selected

**When** the question is answered

**Then** the game declares the team with the highest score the winner

**And** the game prompts the user to reset the board

<!--/BOX-->

<!--BOX-->

## Multiple Teams

**Given** the game has not been started

**When** the user clicks "Start Game"

**Then** the game should ask how many teams are playing

**And** create that number of teams for score tracking

<!--/BOX-->

<!--BOX-->

## Say my Name!

**Given** the game has been started

**When** the user enters the number of teams that are playing

**Then** the game should allow the user(s) to set their team names

<!--/BOX-->

# Icebox

<!--BOX-->

## Jeopardy formatted answers

**Given** a question has been selected

**When** the user submits an answer

**Then** the game should check if the answer is formatted like a question

**And** if it's not prompt the user to answer with a question

**And** allow the user to try again

<!--/BOX-->

<!--BOX-->

## Double Jeopardy

**Given** the game has been started

One question should be set as the "Double Jeopardy" question

**When** the Double Jeopardy question is chosen

**Then** the game prompts the player to enter a wager

**And** awards or subtracts points based on the wager when the question is answered

**And** the turn *does not pass regardless of if the answer was correct, or incorrect*

<!--/BOX-->

<!--BOX-->

## Time Out!


**Given** a game has been started

**When** the user selects a question

**Then** a clock should be displayed, counting down from two minutes

**And when** the time runs out

**Then** the turn passes to the next team

**And** the score remains the same

**And** the clock resets

<!--/BOX-->

<!--BOX-->

## Random Questions

**Given** a game has been completed

**When** the user resets the board

**Then** generate a new set of questions, and/or categories to be used for the next game

<!--/BOX-->
