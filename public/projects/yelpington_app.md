# Yelpington: App

In this project, you will pair up and work with other teams to create an online directory of restaurants in Burlington.

This project builds on the [Yelpington Repo](yelpington_repo) project by turning a static set of markdown files into a dynamic web app.

# Tech

* JSON
* AJAX
* Maps

## Goals

learn how to...

* structure data in JSON files
* load JSON files into a JavaScript app
* display embedded maps on a web page

## Design

We will need to transform the data set by hand. Instead of this markdown:

```markdown
# Joe's Diner

**Address:** 123 King St. (at St. Paul)

**Phone number:** 555-1221

**Hours:** 7:00 am - 3:00 pm

Their sriracha breakfast sandwich is quite good. 

Every Thursday is meatloaf day.
```

we will need this JSON:

```json
@@@json
{
  "id": "joes-diner"
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

> **Note** that we are defining our own *id* format: all lowercase, no spaces 
> or symbols, kebab-case, same as the base file name. 
> This is *not* the same as an HTML element id; it's a *primary key* for our 
> database. (Yes, in this context, the filesystem is a database.)

## Stories

> TODO: move the git stories into a new intermediate project `yelpington_json`

<!--box-->

### Zero Pull Requests

Check https://github.com/BurlingtonCodeAcademy/yelpington/pulls and if any open PRs have your name on them, finish them up and getthe PRs accepted or closed.

<!--/box-->

<!--box-->

### Convert Data

In pairs, split up and convert one restaurant at a time. Make a PR for each restaurant file. 

Your commit should *remove* the `.md` markdown file and *add* a `.json` file with the same base name. (In `git status`, this may show up as a single "rename", or it may show as an add and a delete.)

*Many hands make light work!* Once this step is done, make *your own fork* of the repo and do the rest of the project in there. 

> We might deploy one or more student projects for regular classroom lunchtime use!

<!--/box-->

<!--box-->
### Show Restaurant

**Given** the id of a single restaurant (e.g. `joes-diner`)

**When** the user visits `http://localhost:5000/joes-diner`

**Then** they should see all the restaurant information, formatted and styled nicely 

Use AJAX or Fetch to load the data.

> Note: the Fetch API [does not work well with the `file:///` URL scheme](https://github.com/github/fetch/pull/92). 
> We've added a simple `node` app that serves files from a local server.
> Launch it with `node .` and access it with `http://localhost:5000`

To access *the path* -- from `/name` into `name` -- use this incantation:

```
let name = document.location.pathname.slice(1)
```

(`slice(1)` removes the `/` from the `pathname` field of the `document.location` URL object.)

<!--/box-->

<!--box-->
### Show Restaurant Map

**Given** the id of a restaurant (e.g. `joes-diner`)

**When** the user sees the restaurant's page (e.g. `/joes-diner`)

**Then** they see an [embedded map](/lessons/www/embedding_media.md), centered at that restaurant's location

> You must decide *how* and *when* to look up the restaurant's geolocation, and 
> whether to do it automatically or manually. 
> Note that the browser [Geolocation API](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API)
> will **not** work here, since that provides the location of the *current user*.
> [Nominatum](https://nominatim.openstreetmap.org/) is a good option. Try
> `https://nominatim.openstreetmap.org/search/?q=182 Main St.,Burlington,VT&format=json`


<!--/box-->


<!--box-->
### Show All Restaurants (list)

**When** the user visits `/`

**Then** the user sees all restaurants as a list with links to the respective restaurant pages

<!--/box-->
<!--box-->
### Show All Restaurants (map)

**When** the user visits `http://localhost:5000/` with no query string

**Then** the user sees all restaurants as "pins" on the embedded map

**And** clicking on a pin visits that restaurant's page

<!--/box-->
<!--box-->

### Formatted Notes

**Given** markdown-formatted text inside a `notes` item

**Then** the page should render it *into HTML* before inserting it into the page

#### Example:

JSON:
```
"notes": ["The pizza is **awesome** here!"]
```

HTML:

The pizza is **awesome** here!

<!--/box-->

