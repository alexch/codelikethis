# Yelpington: App

In this project, you will create an online directory of restaurants in Burlington.

# Screenshot

![bob's yelpington screenshot](/images/yelpington-screenshot.png)

# Tech

* JSON
* AJAX
* Leaflet Maps

## Goals

learn how to...

* load JSON files into a JavaScript app
* parse JSON files, and display data on a web page.
* display, and manipulate embedded maps on a web page

## Design

We have set up an API endpoint for serving JSON files with restaurant data that is structured like so:

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

Which you can access through this endpoint: <https://json-server.burlingtoncodeacademy.now.sh/restaurants>

**Note** that we are defining our own *id* format; its rules are:

* contents are the same as the base file name, except:
* all lowercase
* no spaces or symbols
* kebab-case

This *id* is **not** the same as an HTML element id; instead, it's a *primary key* for our
database. (Yes, in this context, the API is a database.) Every record (restaurant)
needs a unique identifier.

# Stories


<!--BOX-->
## Home Page

**Given** the server is running

**When** the user visits the home page (e.g. `http://localhost:8080`)

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

**When** the user visits `http://localhost:8080/restaurant.html#joes-diner`

**Then** they should see all the information for that restaurant formatted and styled nicely

>Note: Use AJAX/Fetch to load the data.

> We've added a simple `node` static server to this repository.
> Install it with `npm install` and run it with `npm start`
> Feel free to write your own server if you want to using ExpressJS

<!--BOX-->
**Hint:** To access *the current page's path* -- to get from `http://localhost:8080/restaurant.html#joes-diner` to `joes-diner` -- review the [URLs and JavaScript](/lessons/client-side-coding/urls_and_javascript) lesson.
<details>
<summary>
Click here for a more detailed hint
</summary>

```
let name = document.location.hash.slice(1)
```

(`slice(1)` removes the `#` from the `hash` field of the `document.location` URL object.)
</details>

<!--/BOX-->
<!--/BOX-->

<!--BOX-->
## Show Restaurant Map

**Given** the id of a restaurant (e.g. `joes-diner`)

**When** the user sees the restaurant's page (e.g. `/joes-diner`)

**Then** they see a [Leaflet web map](/lessons/client_side_coding/interactive_mapping), centered at that restaurant's location

> You must decide *how* and *when* to look up the restaurant's `Latitude/Longitude`, and whether to do it automatically or manually.

> [Nominatim](https://nominatim.openstreetmap.org/) is a good option. Try the following:

> `https://nominatim.openstreetmap.org/search/?q=182 Main St.,Burlington,VT&format=json`

> Read more about the Nominatum API here:

> 1. https://nominatim.openstreetmap.org/

> 2. https://wiki.openstreetmap.org/wiki/Nominatim

<!--/BOX-->

<!--BOX-->

## Formatted Notes

**Given** markdown-formatted text inside a `notes` item

**Then** the page should render it *into HTML* before inserting it into the page

#### Example:

JSON:

<!--BOX-->

```
"notes": ["##Mr Mikes\nThe pizza is **awesome** here!"]
```

<!--/BOX-->

HTML:

<!--BOX-->

```html
<h2>Mr Mikes</h2>
<p>The pizza is <strong>awesome</strong> here!</p>
```

<!--/BOX-->

Result:

<!--BOX-->

## Mr Mikes

The pizza is **awesome** here!

<!--/BOX-->

<!--/BOX-->
