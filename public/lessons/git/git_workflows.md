# Git Workflows

# Branching Strategies

* Different teams will choose different strategies for managing their branches.
* A branching strategy is also called a "workflow"
  * one popular strategy is named "Git Flow" but it's not the only git flow

# Long Running Branches

* This strategy uses two or more branches that are periodically **merged** into the **master** branch.
* In this strategy, once you merge a change `master` you are saying "this change is ready for testing and deployment"

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

Using this strategy, you would **merge** the **development** branch into **master** when you want to activate the new features.

# Example: Long Running Diagram

![Long Running Branches](/images/long-running-branches-many.png "Long Running Branches")

# Example: Long Running Code

```shell
$ git checkout master
$ git status

On branch master
Your branch is up-to-date with 'origin/master'.

$ git branch develop
$ git checkout develop
$ git add files_that_changed
$ git commit -m "My awesome changes"
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
* Need to be disciplined about keeping feature branches *focused* and *short-lived*

# Master <- Feature

* Using **master** branch as **stable**
* And using a new **topic** or **feature** branch as **experimental**

# Example: Feature Branch Diagram

![Topic Branches with Merge](/images/topic-branches-merged.png "Topic Branches with Merge")

# Example: Feature Branches Many

![Topic Branches Many](/images/topic-branches-git.png "Topic Branches Many")

# Continuous Delivery

* Some teams merge new features directly to master
* After every commit, the code is automatically...
  * tested
  * deployed
* This flow depends on a solid, stable set of automated tests
* Benefits from *feature flags* which can switch new features on and off

<https://martinfowler.com/bliki/ContinuousDelivery.html>
