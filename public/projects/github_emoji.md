# GitHub Emoji

GitHub supports emoji inside commit messages and pull request comments.

Their list of emoji is long (currently 1500+) and they sometimes add emoji to this list, so instead of using a static web page to list them, they added an endpoint to their API that lists them all in a giant hash.

Check it out here: <https://api.github.com/emojis>

## Wireframes

```
GitHub Emoji
-------------

[___________] [Filter]

[OoO] :cloud_with_snow:
[:-)] :clown_face:
...

```

## Features

### One Big List

**When** the page is loaded,

**Then** the app should fetch the list of emoji from GitHub,

**And Then** the user should see all emoji in a long list

### Filter By Name

**When** the user enters a word into the "Filter" text field

**Then** the list should show only those emoji whose name contains that word

**Other Considerations**: if the list is immediately updated after every keypress, then it might cause performance problems or visual stutter. One way to limit this is to use a *cooldown timer* so that the filtering action only happens a second or so *after* the user presses a key, to allow for many keypresses in a row without interruption.



## Tech

* AJAX
* Iteration

