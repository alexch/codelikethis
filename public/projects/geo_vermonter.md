# Geo Vermonter

<https://geoguessr.com/> is a game built using Google Maps

In this project we will build our own version of the game using locations inside Vermont.

First, clone the starter project here: 

  http://github.com/BurlingtonCodeAcademy/geo-vermonter-react

`cd` into the repo directory and then run `npm install`

# Tech:

* web layout and UI
* embedding maps APIs
* geocoding APIs
* DOM event handlers

# Game Rules:

* when the player starts a game, they are dropped into a random spot inside Vermont
* initial score is 100
* the zoom level is pretty high (low to the ground) and there are no streets or markers, only satellite imagery
* the map does **not** support zoom out, or slippy click-and-drag-to-move -- all movements must be deliberate, by clicking one of the north / south / east / west buttons
* every time the user clicks a movement button, the map moves a fixed amount in that direction, and the score is decreased by 1
* when the player clicks "Guess!" they can choose a county from a popup menu
* if the guess is correct then:
  * the game displays "You win!" 
  * their final score is logged [how?] 
  * the Info box is filled in with the correct latitude and longitude
   
> How do we get the nested list of Vermont towns and counties?
 
# Stories

<!--BOX-->
## Basic Layout

* Sketch out wireframes for a page with the following page elements. 

|Selector|Description|
|---|---|
|`map`| shows the current map (initally the entire state of Vermont) |
|`nav`| top of page, placeholder for "about" and "high scores" and such |
|`info`| contains fields for... |
|  `latitude`, `long`, `county`, `town` | read-only text fields |
| `north`, `south`, `east`, `west` | buttons for movement |
|`start`, `guess`, `quit` | buttons labeled "Start a Game", "Guess the Spot", "I Give Up!" respectively - all disabled for now |
|`score`| text field |

* Then code the layout in HTML with placeholder information
* Run the cypress tests:
  * use `npm test` to run them immediately on the console - find screenshots under `cypress/screenshots/geo_vermonter_tests`
  * use `npx cypress open` to run them interactively in the browser GUI

<!--/BOX-->


<!--BOX-->
## State of the State

Using [leaflet.js](#TODO) place a map of the state of Vermont inside the `map` div. Use the [Isri.WorldImagery tileset](https://leaflet-extras.github.io/leaflet-providers/preview/) and make sure **not** to show any street or town info to the user -- only satellite images.

The map should be at a *fixed* zoom level, enough to show just the boundaries of the state and not much more.

The boundaries of Vermont are specified in [`border.js`](https://github.com/BurlingtonCodeAcademy/geo-vermonter/blob/master/border.js). Ask Josh for further instructions.

<!--/BOX-->

<!--BOX-->
## Game On

**Given** a page with a map, Start, Quit, and Guess buttons

**When** the user clicks *Start a Game*

**Then** the Start button is disabled

**And** the Guess button is enabled

**And** the Quit button is enabled

<!--/BOX-->


<!--BOX-->
## Random Spot

**Given** the game has not been started

**When** the user clicks *Start a Game*

**Then** the app chooses a random lat/long position *inside the boundaries of Vermont* 

  * [leaflet-pip](https://github.com/mapbox/leaflet-pip) is a library for finding out whether a point is inside a polygon

**And** zooms and centers the map to that location, with a *different fixed zoom level* of 18

**And** displays question marks inside the lat, long, county, and town fields

*(optional)* **And** displays a small map of Vermont counties on the side, e.g. https://geology.com/county-map/vermont-county-map.gif

<!--/BOX-->

<!--BOX-->
## I Give Up!

**Given** the game has been started

**When** the user clicks the "I Give Up" button

**Then** the app displays the lat/long position inside the `info` panel

**And** uses *geocoding* to look up the town and county, and displays those inside the `info` panel

<!--/BOX-->

<!--BOX-->
## Guess the County

**Given** the game has been started

**When** the user clicks the Guess button

**Then** the user sees a *modal dialog box* (or a *modeless dialog box*) asking "What county are we in?" with a [popup list of all Vermont counties](https://en.wikipedia.org/wiki/List_of_counties_in_Vermont)

**And** two buttons ("Guess" and "Cancel")

<hr>

**When** the user selects the correct county and clicks "Guess"

**Then** the game *fills in* that county name in the Info box (instead of a question mark) (as well as the other geocoded information)

**And** informs the user "Correct!"

<hr>

**When** the user selects an incorrect county 

**Then** The game *subtracts* 10 from score

**And** informs the user "Wrong!"

**And** the dialog box disappears

<hr>

**When** the user clicks "Cancel"

**Then** the dialog box disappears with no change to score

<!--/BOX-->

<!--BOX-->
## Move

**Given** the game has been started

**When** the user clicks the "North" button

**Then** the map scrolls a fixed distance to the north

**And** the score is reduced by 1 point

(and same as above for East, South, West buttons)

<!--/BOX-->

<!--BOX-->
## Return

**Given** the user has started the game, and moved from their initial location

**When** the user clicks the "Return" button

**Then** the game scrolls back to the original spot, with no change in score

<!--/BOX-->

<!--BOX-->
## breadcrumbs

When the user clicks a movement button

Then the map draws a dotted line between the previous map center and the new map center

And keeps showing the dotted line during the rest of game

<!--/BOX-->

<!--BOX-->
## save score (local)

**When** the user wins a game

**Then** the game asks the user for their name (or remembers from earlier)

**And** saves the name and score to a list of games

<hr>

**When** the user selects "high scores" from the nav bar

**Then** the app shows a list of all games, in score order (top to bottom)

> For the first pass, use [LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) so it persists across game sessions.  **BEWARE** that the values can only be strings, so you must use `JSON.stringify` on the way in and `JSON.parse` on the way out.

<!--/BOX-->

<!--BOX-->
## save score (server)

**When** the user wins a game

**Then** the game saves the name and score to the server

<hr>

**When** the user selects "high scores" from the nav bar

**Then** the app shows a list of all games, in score order (top to bottom), including scores from all other players

### Tech:

Initially, implement your server code as simply as possible. Over the course of the week, we will learn more ways of saving state on a server or database.

1. in RAM (a list of JS objects in an array) -- this will get erased when you restart the server but will be just fine for demos
2. in a file -- this will work locally but will not work on Heroku
3. in MongoDB

<!--/BOX-->

# Icebox

<!--BOX-->
## Previous Games:

**Given** the game is over

**When** the game is saved, don't just save the name and score: all the info, including spot and all moves taken, and any guesses, should be saved as well

**Then** viewing old games, the user can select one and see the above info

<!--/BOX-->

<!--BOX-->
## View Replay

**Given** the user is viewing previous games

**When** the user selects 'view replay' on a game

**Then** the game shows a replay at a speed of 1 move per second

<!--/BOX-->

Ideas for future work:

Invent some new game modes, and put links to the various modes inside the nav bar. For instance...

  * Guess the town, not the county
  * Daily Challenge - every user uses the same point
  * Burlington Challenge - guess the neigborhood

