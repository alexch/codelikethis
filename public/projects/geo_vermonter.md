# Geo Vermonter

<https://geoguessr.com/> is a game built using Google Maps

In this project we will build our own version of the game using locations inside Vermont.

# Tech:

* web layout and UI
* embedding maps APIs
* geocoding APIs
* DOM event handlers

# Rules:

# Stories

<!--box-->
### Basic Layout

Sketch out wireframes for a page with the following page elements. Then code the layout in HTML with placeholder information and run the first Cypress test.

* `map` - shows the current map (initally the entire state of Vermont)
* `nav` - top of page, placeholder for "about" and "high scores" and such
* `info` - side of page, contains fields for
  * `lat`, `long`, `county`, `town` - read-only text fields
  * `score` - text field
  * `start`, `guess`, `quit` - buttons labeled "Start a Game", "Guess the Spot", "I Give Up!" respectively - all disabled for now

<!--/box-->


<!--box-->
### State of the State

Using [leaflet.js](#TODO) place a map of the state of Vermont inside the `map` div.

The boundaries of Vermont are:
  * North: 45.???
  * South: 44.???
  * West: -70.???
  * East: -70.???

The map should be at a *fixed* zoom level, enough to show just the boundaries of the state and not much more.

<!--/box-->


<!--box-->
### Random Spot

**When** the app starts

**Then** the `start` button should be enabled

**When** the user clicks *Start a Game*

**Then** the app chooses a random lat/long position *inside the boundaries of Vermont*

**And** zooms and centers the map to that location, with a *different fixed zoom level* of 18 [?]

**And** disables the Start button and enables the "I Give Up" button

**And** displays question marks inside the lat, long, county, and town fields

<hr>

**When** the user clicks the "I Give Up" button

**Then** the app displays the lat/long position inside the `info` panel

**And** uses *geocoding* to look up the town, city, and state, and displays those inside the `info` panel

<!--/box-->


<!--box-->
### Game On

**When** the user clicks *Start a Game*

...more specification needed from here on

<!--/box-->
