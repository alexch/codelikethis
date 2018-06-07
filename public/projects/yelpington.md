# Yelpington: Git Repo

In this project, you will pair up and work with other teams to create an online directory of restaurants in Burlington.

For this project we will *not* use a database, or a webapp, or even a programming language. Our entire directory will be inside a single GitHub repository, with each restaurant represented by a single file in Markdown format.

# Tech

* Git
* Github
* Markdown

## Usage

For the next 12 weeks, we will all eat lunch every day. This app can realistically help each of us find a place to eat downtown. This is *not* a toy problem. :-)

## Goals

* learn [Markdown](https://www.gitbook.com/book/gitbookio/markdown/details)
* learn about Git and GitHub workflow
* submit Pull Requests
* review Pull Requests
* merge other teammates' work into yours

## Design

  * Every restaurant is represented by one file in the top level of the repository.
  * The file name will be in `kabob-case`: all lowercase letters, no spaces or symbols, hyphens between words.
  * The file extension will be `.md` which stands for Markdown. This hint causes GitHub to render the file with style.
  * The contents of the file must contain the name, address, hours, and meal recommendations

**Example:** Let's say there's a restaurant called "Joe's Diner" on King Street. At the top level of the repository will be a file named `joes-diner.md`, containing:

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
2. If you have not added an SSH key to your GitHub account, follow these instructions: <https://help.github.com/articles/connecting-to-github-with-ssh/> and if that doesn't work, here's an article for generating an SSH key on github *for windows* <http://guides.beanstalkapp.com/version-control/git-on-windows.html#installing-ssh-keys>
2. visit the main repo <https://github.com/BurlingtonCodeAcademy/yelpington>
2. fork the repo (click the word "Fork" in the button in the top left)
2. clone *your* repo locally by clicking the green "Clone" button and then *using the `git:` URL* (not the `https:` URL). If you can't see the `git:` URL then look for and click the 'use SSH' link.
3. Think of a restaurant. *Do not* coordinate with other students (one of the goals of this lesson is to experience conflicts).
4. Create a local branch named after that restaurant. For example, `git checkout -b joes-diner`
5. Create the menu file (`joes-diner.md`) including its name and address **but *not* its hours** and when you're satisfied, add it to git (using `git add`, `git commit`).
6. Push your local branch to GitHub using `git push origin joes-diner`
7. Using a web browser, visit GitHub and create a Pull Request (PR).
8. In the description of the PR, put the names of both pair partners.
9. Submit the PR.
10. Ask another pair to review your PR, and raise your hand to signal that you are free to review someone else's PR. Visit <https://github.com/BurlingtonCodeAcademy/yelpington/pulls> to find PRs to review.
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

