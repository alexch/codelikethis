# Yelpington: App

In this project, you will create an online directory of restaurants in Burlington.

# Screenshot

![bob's yelpington screenshot](/images/yelpington-screenshot.png)

# Tech

* ExpressJS
* JSON
* AJAX
* Leaflet Maps
* React

## Goals

learn how to...

* set up a server for a React app
* serve JSON files from a server
* load JSON files into a JavaScript app
* parse JSON files, and display data on a web page.
* display, and manipulate embedded maps on a web page

## Design

You should set up an API endpoint for serving JSON files with restaurant data that is structured like so:

```json
{
  "id": "joes-diner",
  "name": "Joe's Diner",
  "address": "123 King St.",
  "phone number": "555-1221",
  "hours": "7:00 am - 3:00 pm",
  "notes": [
    "Their sriracha breakfast sandwich is quite good.",
    "Every Thursday is meatloaf day."
  ]
}
```

This endpoint should also hold a directory of restaurant IDs formatted like so:

```json
[
  "joes-diner",
  "american-flatbread",
  "kountry-kart-deli",
  .
  .
  .

]
```

You need to include at least 8 restaurants on your site.

**Note** that we are defining our own *id* format; its rules are:

* contents are the same as the base file name, except:
* all lowercase
* no spaces or symbols
* kebab-case

This *id* is **not** the same as an HTML element id; instead, it's a *primary key* for our
database. (Yes, in this context, the API is a database.) Every record (restaurant)
needs a unique identifier.

> These JSON files should not be directly accessible through the browser. The only way to access the data should be through the endpoints you set up in your server.

## The Setup

React is a framework for creating single page web apps, that behave like they have multiple pages. When serving react you only ever need to serve the `index.html` file to handle all of the user-facing pages.

In the development environment React needs to be running its own prepackaged interpreter to parse the pages, so you will need to **BOTH** the React server (`cd client` then `npm start`) and your backend server (from the root level of your project `npm start`) running at the same time, on different ports, and proxying requests between them.

Currently the project is setup to proxy requests to a server running on `localhost:8000` while the front end will be running on React's default port `localhost:3000`

To view your page start both servers, and visit the site at `localhost:3000`

# Stories

<!--BOX-->

## Create a Server

Create a simple Express server so that:

**Given** the server is started with the command `npm start`

**When** the user visits the homepage (http://localhost:8080)

**Then** An HTML file should be served which displays the title:
<h1>Yelpington!</h1>

<!--/BOX-->

<!--BOX-->

## API endpoint: All restaurants

**Given** the server is running

**When** the user visits the route `/api`

**Then** the user should see a list of all available restaurant IDs in JSON format

<!--/BOX-->

<!--BOX-->

## API endpoint: Single Restaurants

**Given** the server is running

**When** the user visits the the route `/api/restaurant-id` (substituting `restaurant-id` for an actual restaurant's ID)

**Then** the user should see the information of the restaurant whose ID was used in JSON format

<!--/BOX-->

<!--BOX-->

## Home Page

**Given** the server is running

**When** the user visits the home page (e.g. `http://localhost:3000`)

**Then** a leaflet map should be displayed, centered on downtown burlington.

**And** there should be pins for each restaurant in the database.

**And** a list of all restaurants in a nav bar

<!--/BOX-->

<!--BOX-->

## Visit a restaurant page

**Given** the user is on the homepage

**When** they click on a pin *or* the restaurant's name in the nav bar

**Then** the user should be redirected to a dedicated restaurant page.

<!--/BOX-->

<!--BOX-->

## Show Restaurant

**Given** the id of a single restaurant (e.g. `joes-diner`)

**When** the user visits `http://localhost:3000/restaurant/joes-diner`

**Then** they should see all the information for that restaurant formatted and styled nicely

>Note: Use AJAX/Fetch to load the data.

<!--/BOX-->

<!--BOX-->

**Hint:** To access *the current page's path* -- to get from `http://localhost:3000/restaurant/joes-diner` to `joes-diner` -- review the [URLs and JavaScript](/lessons/client-side-coding/urls_and_javascript) lesson.
<details>
<summary>
Click here for a more detailed hint
</summary>

```
let name = document.location.path.split('/')[2]
```

(`split('/')` will break the path down into an array of its parts => `['', 'restaurant', 'joes-diner']`)
</details>

<!--/BOX-->

<!--BOX-->

## Show Restaurant Map

**Given** the id of a restaurant (e.g. `joes-diner`)

**When** the user sees the restaurant's page (e.g. `/restaurant/joes-diner`)

**Then** they see a [Leaflet web map](/lessons/client_side_coding/interactive_mapping), centered at that restaurant's location

> You must decide *how* and *when* to look up the restaurant's `Latitude/Longitude`, and whether to do it automatically or manually.

> [Nominatim](https://nominatim.openstreetmap.org/) is a good option. Try the following:

> `https://nominatim.openstreetmap.org/search/?q=182 Main St.,Burlington,VT&format=json`

> Read more about the Nominatum API here:

> 1. https://nominatim.openstreetmap.org/

> 2. https://wiki.openstreetmap.org/wiki/Nominatim

<!--/BOX-->

<!--BOX-->

## IceBox

* Create a contact form to submit user comments to the restaurant page which will then be displayed on that page.

* Use a database or local storage to get the comments to persist across sessions.

<!--/BOX-->
