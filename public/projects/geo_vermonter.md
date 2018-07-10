# Geo Vermonter

<https://geoguessr.com/> is a game built using Google Maps

In this project we will build our own version of the game using locations inside Vermont.

First, clone the starter project here: 

  http://github.com/BurlingtonCodeAcademy/geo-vermonter

`cd` into the repo directory and then run `npm install`

# Tech:

* web layout and UI
* embedding maps APIs
* geocoding APIs
* DOM event handlers

# Game Rules:

* when the player starts a game, they are dropped into a random spot inside Vermont
* initial score is 20
* the zoom level is pretty high (low to the ground) and there are no streets or markers, only satellite imagery
* the map does **not** support zoom out, or slippy click-and-drag-to-move -- all movements must be deliberate, by clicking one of the north / south / east / west buttons
* every time the user clicks a movement button, the map moves a fixed amount in that direction, and the score is decreased by 1
* when the player clicks "Guess!" they can choose a county from a popup menu
  * if the guess is correct then the next time they click "Guess!" they can choose a town from a popup menu
  * if the guess is incorrect then the score is decreased by 1
* if they guess the correct town then 
  * the game displays "You win!" 
  * their final score is logged [how?] 
  * the Info box is filled in with the correct latitude and longitude
   
> How do we get the nested list of Vermont towns and counties?

# State Transition Diagram

TODO
 
# User Stories

<!--box-->
### Basic Layout

* Sketch out wireframes for a page with the following page elements. 

  * `map` - shows the current map (initally the entire state of Vermont)
  * `nav` - top of page, placeholder for "about" and "high scores" and such
  * `info` - side of page, contains fields for
    * `latitude`, `long`, `county`, `town` - read-only text fields
    * `score` - text field
    * `start`, `guess`, `quit` - buttons labeled "Start a Game", "Guess the Spot", "I Give Up!" respectively - all disabled for now

* Then code the layout in HTML with placeholder information
* Run the cypress tests:
  * use `npm test` to run them immediately on the console - find screenshots under `cypress/screenshots/geo_vermonter_tests`
  * use `npx cypress open` to run them interactively in the browser GUI

<!--/box-->


<!--box-->
### State of the State

Using [leaflet.js](#TODO) place a map of the state of Vermont inside the `map` div.

The map should be at a *fixed* zoom level, enough to show just the boundaries of the state and not much more.

The boundaries of Vermont are specified in `border.js`. Ask Josh for further instructions.

<!--/box-->

<!--box-->
### Game On

**When** the user clicks *Start a Game*

**Then** the Start button is disabled

**And** the Guess button is enabled

**And** the Quit button is enabled

<!--/box-->


<!--box-->
### Random Spot

**When** the user clicks *Start a Game*

**Then** the app chooses a random lat/long position *inside the boundaries of Vermont* 

  * [ask Josh for help with finding a point inside a GeoJson boundary]

**And** zooms and centers the map to that location, with a *different fixed zoom level* of 18

**And** displays question marks inside the lat, long, county, and town fields

<!--/box-->

<!--box-->
### I Give Up!

**When** the user clicks the "I Give Up" button

**Then** the app displays the lat/long position inside the `info` panel

**And** uses *geocoding* to look up the town and city, and displays those inside the `info` panel

<!--/box-->

