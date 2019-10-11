# Yelpington: App

In this project, you will pair up and work with other teams to create an online directory of restaurants in Burlington.

# Screenshot

![bob's yelpington screenshot](/images/yelpington-screenshot.png)

# Tech

* JSON
* AJAX
* Leaflet Maps
* Accessing and parsing URLs from JavaScript

## Goals

learn how to...

* structure data in JSON files
* load JSON files into a JavaScript app
* display embedded maps on a web page

## Design

As specified in the [Yelpington Repo](./yelpington_repo) project, we will need JSON formatted like this:

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

**Note** that we are defining our own *id* format; its rules are:

* contents are the same as the base file name, except:
* all lowercase
* no spaces or symbols
* kebab-case

This *id* is **not** the same as an HTML element id; instead, it's a *primary key* for our
database. (Yes, in this context, the filesystem is a database.) Every record (restaurant)
needs a unique identifier.

We will also need a file named `all.json` which contains a list of all the ids, e.g.:

```
[
    "joes-diner",
    "burger-queen",
    "pizza-shack"
]
```


# Stories

<!--BOX-->

## Zero Pull Requests

* If you previously did the [Yelpington Repo](yelpington_repo) project, please check <https://github.com/BurlingtonCodeAcademy/yelpington/pulls>  
  * If any open PRs have your name on them, finish them up, get the PRs accepted, and close them out.
* Otherwise, **clone** the Yelpington repository, either from the GitHub Classroom link provided by your instructor.
* Make sure your local setup is working. First run `npm install`, then run `npm start` and visit <http://localhost:8080/all.json> You should see something like this:

```json
[
  "kountry-kart-deli",
  "american-flatbread",
  "august-first",
  "farmhouse-grill",
  "pascolo-ristorante",
  "el-cortijo",
  "mr-mikes",
  "ahli-babas-kabob",
  "city-market",
  "honey-road",
  "hen-of-the-wood"
]
```

**Hint**: you may want to install a [JSON Viewer Browser Extension](/lessons/javascript/json#anchor/viewing_json_in_browser) so the JSON is easier to read.

<!--/BOX-->

<!--BOX-->
## Show Restaurant

**Given** the id of a single restaurant (e.g. `joes-diner`)

**When** the user visits `http://localhost:8080/restaurant.html#joes-diner`

**Then** they should see all the information for that restaurant formatted and styled nicely

>Note: Use AJAX or Fetch to load the data.

> Note: the Fetch API [does not work well with the `file:///` URL scheme](https://github.com/github/fetch/pull/92).
> That's why we've added a simple `node` static server to this repository.
> Install it with `npm install` and run it with `npm start`

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
## Show All Restaurants (list)

**When** the user visits `http://localhost:8080/`

**Then** the user sees all restaurants as a list with links to the respective restaurant pages

<!--/BOX-->

<!--BOX-->
## Show All Restaurants (map)

**When** the user visits `http://localhost:8080/` with no query string

**Then** the user sees all restaurants as "pins" on the embedded map

**And** clicking on a pin visits that restaurant's page

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
