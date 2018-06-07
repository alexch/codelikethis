# Git Branching Work-flows

* When working in Git you will find using branches helpful
* Branches are a core part of Git and can make working with others easier
* There are several *general* strategies for using branches

# Branch Basics Refresher

* Branches are a pointer to a commit which includes set of changes
* Branches are a lightweight tool for managing change in Git
* Branches contain all the changes since they diverged from **master**

# Example: Branch Basics Diagram

![Branch Basics Diagram](./git-branch-basics.png "Branch Basics Diagram")

# Long Running Branches

* This strategy uses two or more branches that are continuously **merged** into the **master** branch

## Benefits

* Simple
* Consistent
* Low cognitive overhead

## Problems

* Conflicts between **master** and the **other** branches
* Need to keep long running branches to a minimum

# Example: Master <- Develop

* Using the **master** branch as **stable**
* And using the **develop** branch as **experimental**

Using this strategy, you would **merge** the **development** branch into **master** when you want the new features.

# Example: Long Running Diagram

![Long Running Branches](./long-running-branches-many.png "Long Running Branches")

# Example: Long Running Code

```sh
@@@shell
$ git checkout master
$ git status

On branch master
Your branch is up-to-date with 'origin/master'.

$ git branch develop
$ git checkout develop
$ git add files_that_changed
$ git commit -m 'My awesome changes'
$ git checkout master
$ git pull
$ git merge develop
$ git push origin/master
```

# Feature Branches

* Feature branches are short lived and focus on **one** feature at a time
* They should be branched off the updated **master** and be merged quickly

## Benefits

* Isolated code changes
* Easy to merge when used as designed
* Leaves a trace about the intent of the branch

## Problems

* Can clutter the history
* Need to be disciplined

# Master <- Feature

* Using **master** branch as **stable**
* And using a new **topic** or **feature** branch as **experimental**

# Example: Feature Branch Diagram

![Topic Branches with Merge](./topic-branches-merged.png "Topic Branches with Merge")

# Example: Feature Branches Many

![Topic Branches Many](./topic-branches-git.png "Topic Branches Many")
