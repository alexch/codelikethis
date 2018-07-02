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

<!--box-->
### Convert Data

In pairs, split up and convert one restaurant at a time. Make a PR for each restaurant file. Your commit should *remove* the `.md` markdown file and *add* a `.json` file with the same base name.

<!--/box-->

<!--box-->
### Show Restaurant

**Given** the id of a single restaurant (e.g. `joes-diner`)

**When** the user visits `/joes-diner`

**Then** they should see all the restaurant information, formatted and styled nicely 

Use AJAX or Fetch to load the data.

> Note: the Fetch API [does not work well with the `file:///` URL scheme](https://github.com/github/fetch/pull/92). 
> We've added a simple `node` app that serves files from a local server.
> Launch it with `node .` and access it with `http://localhost:5000`

<!--/box-->

<!--box-->
### Show Restaurant Map

**Given** the id of a restaurant (e.g. `joes-diner`)

**When** the 

<!--/box-->


<!--box-->
### Show All Restaurants

* as a list with links to 
* On an embedded map, with pins.

<!--/box-->


<!--box-->

<!--/box-->


## Merge Conflicts

If there are merge conflicts, resolve them. This is a manual process and can be frustrating and confusing. The basic rule is that if there is a conflict, you need to look for lines like this:

```
<<<<<<<<<<<<<<<<
foo
----------------
bar
>>>>>>>>>>>>>>>>
```

and then manually edit the files until all the chevrons and dashes are gone, and what's left is correct. In this example, you might choose `foo` or `bar`, or `foobar`, or `bar + foo`, or something altogether different. Then `git add` the corrected file and follow the instructions on the console to finish the merge.

As a more realistic example of a conflict:

```
<<<<<<<<<<<<<<<<
M-F open at 9, closed weekends
----------------
9:00 am to 5:00 pm
>>>>>>>>>>>>>>>>
```

This example shows why git *cannot* automatically resolve intra-line conflicts. As a human, you are the only one capable of making this sort of *semantic* choice. You must decide whether this file would be better off with one or the other or a creative combination of both changes, and you should communicate with other humans about this decision, in the GitHub discussion thread or face-to-face.

## Secret Sneaky Teacher Step

* If a student team is not getting merge conflicts, force one: after a PR is created, go into the main repo and commit a change to that file.  

## Icebox

* make it a web app and/or API
* make a slack plugin

## References

book: https://book.git-scm.com/book/en/v2

tutorial: http://gitimmersion.com :
 
  * most important chapters are 1-10, 20, and 24-30 (but they depend on each other, so don’t skip the intermediate chapters, just don’t worry *too* much if you don’t fully understand them)

