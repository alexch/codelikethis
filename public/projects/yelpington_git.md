# Yelpington: Git Phase

In this project, you will pair up and work with other teams to create an online directory of restaurants in Burlington.

For this initial phase of the project we will *not* use a database, or a webapp, or even a programming language. Our entire directory will be inside a single GitHub repository, with each restaurant represented by a single file in Markdown format.

## Usage

For the next 12 weeks we will all be eating lunch every day. This app can realistically help all of us find a place to eat downtown. This is *not* a toy problem. :-)

## Goals

* learn Markdown
* learn about Git and GitHub workflow
* submit Pull Requests
* review Pull Requests
* merge other teammates' work into yours

## Design

  * Every restaurant is represented by one file in the top level of the repository.
  * The file name will be in `kabob-case`: all lowercase letters, no spaces or symbols, hyphens between words.
  * The file extension will be `.md` which stands for Markdown. This hint causes GitHub to render the file with style.
  * The contents of the file must contain the name, address, hours, and meal recommendations

Example: Let's say there's a restaurant called "Joe's Diner" on King Street. At the top level of the repository will be a file named `joes-diner.md`, containing:

```markdown
# Joe's Diner

**Address:** 123 King St. (at St. Paul)

**Phone number:** 555-1221

**Hours:** 7:00 am - 3:00 pm

Their sriracha breakfast sandwich is quite good. 

Every Thursday is meatloaf day.
```

## Steps

1. pair up
2. clone the repo locally *using the `git:` URL* (not the `https:` URL). If you can't see the `git:` URL then ask the professor to make you a contributor. 
3. Think of a restaurant. *Do not* coordinate with other students (one of the goals of this lesson is to experience conflicts).
4. Create a local branch named after that restaurant. For example, `git checkout -b joes-diner`
5. Create the menu file (`joes-diner.md`) including its name and address **but *not* its hours** and when you're satisfied, add it to git (using `git add`, `git commit`).
6. Push your local branch to GitHub using `git push origin` (or perhaps `git push origin joes-diner`)
7. Using a web browser, visit GitHub and create a Pull Request (PR).
8. In the description of the PR, put the names of both pair partners.
9. Submit the PR.
10. Ask another pair to review your PR, and raise your hand to signal that you are free to review someone else's PR.
11. Once the reviews are done, go back to your command line or GitHub GUI and switch back to your local master branch with `git checkout master`. 
12. Pull the latest changes -- you want to see several pairs' entries, including your own.  
13. Choose *someone else's* restaurant and find out their hours. Maybe they have a web site; maybe you need to call them and ask. Make a change to that restaurant file with the new information.
14. Make a new branch (e.g. `joes-diner-hours`) and submit a new PR, repeating the steps above and asking another pair to review your changes.

## Merge Conflicts

If there are merge conflicts, resolve them. This is a manual process and can be frustrating and confusing. The basic rule is that if there is a conflict, you need to look for lines like this:

```
<<<<<<<<<<<<<<<<
foo
----------------
bar
>>>>>>>>>>>>>>>>
```

and then manually edit the files until all the chevrons and dashes are gone, and what's left is correct. In this example, you might choose `foo` or `bar`, or both. Then `git add` the corrected file and follow the instructions on the console to finish the merge.

