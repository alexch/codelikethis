# GitHub Repos

## Background

In addition to their normal web site, GitHub supports a JSON API.

The full documentation is at <https://developer.github.com/v3/> and it's worth skimming (or reading in detail if you have time), but if you want a quick feel for it, visit this URL:

<https://api.github.com/> 

(it will be prettier, and the links will be clickable, if you install a browser extension like [JSON Viewer](https://github.com/tulios/json-viewer/tree/0.18.0) )   

## Description

This app will take a github username and display a list of that user's repositories.

## Wireframes

```
GitHub Repos
-------------

Username: [_alexch______] [Show Repos]

name            description
-----           ------------
rerun           Restarts an app when the filesystem changes
codelikethis    Code Like This web site
```

## Features

### Big List

**When** a user enters a name and clicks the "Show Repos" button

**Then** the user should see all repos including name and description

**And** the name should be a link to the repo URL

### Error Handling: No Such User

**When** a user enters a name that is *not* a world-visible GitHub account name 

**Then** the user should see a descriptive error message instead of the list

### Recent First

**When** a repo has been more recently updated than another

**Then** the list should show that repo above the other

**Hint:** there is a way to make GitHub perform this sort for you -- check the documentation for the "repos" endpoint here: https://developer.github.com/v3/repos/#list-user-repositories 

### v2 Ideas

* Show more information for each repo
* Use *authentication* to enable viewing private repos

## Tech

* AJAX
* Iteration
