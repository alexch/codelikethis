# Git Branching Work-flows

* When working in Git you will find using branches helpful
* Branches are a core part of Git and can make working with others easier
* There are several *general* strategies for using branches

# Branch Basics

* Branches are a lightweight tool for managing change in Git
* **`master`** is the name of the default branch
* a branch always points to a commit 
    * which could point to other commits recursively
    * eventually all branches point back to some spot on `master`
    * other branches contain all the changes since they diverged from `master`

# Example: Branch Basics Diagram

![Branch Basics Diagram](/images/git-branch-basics.png "Branch Basics Diagram")

# Branching Commands

|command|description|
|---|---|
|`git checkout -b x` | create a new branch named `x` based off the current commit |
|`git checkout x` | switch to the branch named x |
|`git branch` | list all known branches |
|`git merge x` | *merge* branch x into the current branch |

# LAB: branch

We will now pretend to be planning a party. We want to think about the party favors for a while before *merging* them into the main shopping list.

1. enter your Shopping List repo

        cd shopping
2. create a new branch called `party`

        git checkout -b party
3. in this branch, add a few party items (like cake or booze) to the list using your text editor
4. make a *commit* on this branch containing the party items

        git add .
        git commit -m "party stuff"
5. *switch back* to master. Notice that the party items are now **gone**.

        git checkout master

6. *switch back and forth* a few times and see the party items reappear and disappear

# Git Merge

* `git merge` takes a branch and connects it to another
  * usually you merge *to and from* `master` into a *feature branch*

* to *merge* is to create a *new commit* on the current branch
  * that "merge commit" has two parents, and represents all changes from both branches

# Merge Conflicts

If there are merge conflicts, resolve them. This is a manual process and can be frustrating and confusing. The basic rule is that if there is a conflict, you need to look for lines like this:

```
<<<<<<<<<<<<<<<<
foo
----------------
bar
>>>>>>>>>>>>>>>>
```

and then manually edit the files until all the chevrons and dashes are gone, and what's left is correct. In this example, you might choose `foo` or `bar`, or `foobar`, or `bar + foo`, or something altogether different. Then `git add` the corrected file and follow the instructions on the console to finish the merge.

# Merge Conflicts (cont.)

As a more realistic example of a conflict:

```
<<<<<<<<<<<<<<<<
Hours: M-F open at 9, closed weekends
----------------
Hours: 9:00 am to 5:00 pm
>>>>>>>>>>>>>>>>
```

This example shows why git *cannot* automatically resolve intra-line conflicts. As a human, you are the only one capable of making this sort of *semantic* choice. You must decide whether this file would be better off with one or the other or a creative combination of both changes, and you should communicate with other humans about this decision, in the GitHub discussion thread or face-to-face.

# LAB: merge

* **on master**, add some other non-party-related items to the list, and *make a new commit* with these items
* **merge** your party branch into master
* there will probably be conflicts. **Don't panic!**
* in a text editor, resolve the conflicts
* when you're satisfied, **finish the merge** with `git add` and `git commit`

> with merges, it's usually best to run `git commit` **without** *a message* since git fills in a good message for merges already. This will open the message in a console text editor, usually `vi`. If it looks good, exit `vi` by typing `:q!` 

* finally, run `git log --graph` to see your commit history with a little ASCII art diagram of the branches diverging and converging

