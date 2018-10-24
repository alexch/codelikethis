# Yelpington: Git Repo

In this project, you will pair up and work with other teams to create an online directory of restaurants in Burlington.

For this project we will *not* use a database, or a webapp, or even a programming language. Our entire directory will be inside a single GitHub repository, with each restaurant represented by a single file in JSON format.

# Tech

* Git
* Github
* JSON

## Usage

We all eat lunch every day. This app can realistically help each of us find a place to eat downtown. This is *not* a toy problem. :-)

## Goals

* use JSON
* learn about Git and GitHub workflow
* submit Pull Requests
* review Pull Requests
* merge other teammates' work into yours

## Design

  * Every restaurant is represented by one file in the top level of the repository.
  * The file name will be in `kabob-case`: all lowercase letters, no spaces or symbols, hyphens between words.
  * The file extension will be `.json`
  * The contents of the file must contain the name, address, hours, and meal recommendations

**Example:** Let's say there's a restaurant called "Joe's Diner" on King Street. At the top level of the repository will be a file named `joes-diner.json`, containing:

#### Joes's Diner

```json
{
    "id": "joes-diner",
    "name": "Joe's Diner",
    "address": "123 King St. (at St. Paul)",
    "phone": "(802) 867-5309",
    "hours": "7:00 am - 3:00 pm",
    "notes": [
        "Their sriracha breakfast sandwich is quite good.",
        "Every Thursday is meatloaf day."
    ]
}
```

We will also need a file named `all.json` which contains a list of all the ids, e.g.:

```json
[
    "joes-diner",
    "burger-queen",
    "pizza-shack"
]
```

## Steps

1. Choose a pair partner to work with.
1. visit the main Yelpington repo. <https://github.com/BurlingtonCodeAcademy/yelpington>
1. fork the repo (click the word "Fork" in the button in the top left).
1. clone *your* repo locally by clicking the green "Clone" button and then *using the `git:` URL* (not the `https:` URL). If you can't see the `git:` URL then look for and click the 'use SSH' link. Use `git clone git@XXXX` (where XXX is the rest of the git URL you just copied).
1. connect your local repo to the main repo like this:

        $ git remote add upstream https://github.com/BurlingtonCodeAcademy/yelpington.git

1. Think of a restaurant. *Do not* coordinate with other students (one of the goals of this lesson is to experience conflicts).
1. Create a local branch named after that restaurant. For example:

        $ git checkout -b joes-diner

1. Create the menu file (`joes-diner.json`) including its name and address **but *not* its hours**.
1. Add a line to `all.json` with the new restaurant's id.
1. **Run the sanity checker** with:

        $ npm run test

1. When you're satisfied, add it to git:

        $ git add .
        $ git commit -m 'Commit message here'

1. Push your local branch to GitHub using:

        $ git push origin joes-diner

1. Using a web browser, visit GitHub and create a Pull Request (PR).
1. In the description of the PR, put the names of both pair partners.
1. Submit the PR.
1. Ask another pair to review your PR, and raise your hand to signal that you are free to review someone else's PR. 
    - Visit <https://github.com/BurlingtonCodeAcademy/yelpington/pulls> to find PRs to review.
1. Once the reviews are done, go back to your command line or GitHub GUI and switch back to your local master branch with:

        $ git checkout master

1. Pull the latest changes -- you want to see several pairs' entries, including your own -- using:

        $ git pull upstream master  

1. Choose *someone else's* restaurant and find out their hours. Maybe they have a web site; maybe you need to call them and ask. Make a change to that restaurant file with the new information.
1. Make a new branch (e.g. `joes-diner-hours`) and submit a new PR, repeating the steps above and asking another pair to review your changes.

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
"hours": "M-F open at 9, closed weekends"
----------------
"hours": "9:00 am to 5:00 pm"
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

