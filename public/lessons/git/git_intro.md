# Git Intro

*git* is a distributed version control tool

used for tracking changes to files

# What is a version control system?

It's like a filesystem, plus:

  * a log of changes to the files
  * including *who* made each change
  * and *why* they made it
  
# Why is version control important?

* For a dev team?
* For an individual on that dev team?
* For a product manager or client?
* For a sysadmin?
* For a QA (Quality Assurance) engineer?

# Installing git

* Instructions vary based on your operating system
* MacOS with Homebrew: `brew install git`
* MacOS without Homebrew: https://git-scm.com/download/mac
* Windows: https://git-scm.com/downloads/win
* Linux: https://git-scm.com/download/linux

# Using git locally

Git is a *distributed* version control system, but for this lesson we will use it *locally* (i.e. only on a single computer)

# Core Concept: Repository

a *repository* (or "repo") contains the version history a collection of files 

in git, a repo comprises all files and subdirectories inside a single "root" directory

* the command `git init` "blesses" the current directory and makes it into a repo

* the command `git status` describes the state of the current repo

# LAB: Create a Repo

Open up your terminal, `cd code`, and type the following commands in order:

|command|explanation|
|---|---|
| `mkdir shopping` | makes a directory named `shopping` <br>(inside the directory named `code`) |
| `cd shopping` | change the *current directory* to the new `shopping` directory |
| `git init`    | bless the current directory as a git repo |
| `git status`  | show the state of the current repo |

You should see something like this:

```
$ git init
Initialized empty Git repository in /Users/alex/code/shopping/.git/

$ git status
On branch master

Initial commit

nothing to commit
```

If you don't, please ask your neighbors or teachers for help.

# Core Concept: Staging Area

git has a two-step process for tracking changes to files.

* First, you **add** the changes to the *staging area* (also called the *cache* or the *index*)

* Then, you **commit** the changes to the *history* (also called the *log*)

After a commit, the staging area is cleared, and the cycle continues.

> Confusingly, the term "commit" is both a noun and a verb -- you run "git commit" on the command line to create a "git commit" in the history :-(

# LAB: Make a shopping list

1. Inside your `shopping` directory, create a file named `groceries.txt`. 

  * You can use your editor by running `code .` (that's "code" then a space then a period)

2. Inside `groceries.txt` add the following lines:

        milk
        eggs
        chunky monkey ice cream

3. Go **back to the command line** and type the following commands:

  * `git add .`  -- that's "git <kbd>Space</kbd> add <kbd>Space</kbd> dot <kbd>Enter</kbd>"
  * `git status`

# LAB: Make a shopping list (cont.)

You should now see something like this:

```
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   groceries.txt
```

> **Don't skim past the status message!** You won't understand it all yet, but get used to reading over console output and checking for anomalies. 

This message is saying that there is one file with staged changes, and it's a file git has never seen before, and its name is `groceries.txt`. It's also trying to be helpful by telling you how to *unstage* this change if you want. 

(But you *don't* want to do this now, so that message isn't actually very helpful, and in fact is adding to the confusing by cluttering the output.)

# LAB: Make a shopping list (cont.)

Now, *commit* your changes with the following command:

    git commit -m 'shopping list'
    
You should see something like this:

    [master (root-commit) d8b9565] shopping list
     1 file changed, 3 insertions(+)
     create mode 100644 groceries.txt

Note that your *commit message* ("shopping list") is in the top line, and your file name ("groceries.txt") is in the bottom line.

Once again, run `git status`, expecting to see:

    On branch master
    nothing to commit, working tree clean

# LAB: Make a shopping list (cont.)

And to prove that the change actually made it into the history, run `git log`. 

    commit d8b95657eebea7083de1a4fb96ba7fb296637342
    Author: Alex Chaffee <achaffee@burlingtoncodeacademy.com>
    Date:   Fri Sep 7 11:24:33 2018 -0400
    
        shopping list

Again, **don't skim past this message**. Look for terms you understand. Try to figure out what the program is telling you. Is everything as you would expect? If not, what's different? What don't you understand?

# Add vs Commit

Q: Why does git have a two-step process for tracking changes? Why doesn't `git add` just add the changes to the history immediately?

A: ?

# Add vs Commit

Q: Why does git have a two-step process for tracking changes? Why doesn't `git add` just add the changes to the history immediately?

A: This lets you tie several related changes together across several files into a single history entry. That single entry is usually related to a *coherent functional change*, with a descriptive *commit message* and clear purpose. 

Think of "git add" as a *rough draft* and "git commit" as a *published version*. "git commit" means "I'm done working for the moment, and I'm ready to share this chunk of work with the team, and discuss it as a single item".

# Commit Hash IDs

Every *commit* has a unique *id* (also known as a *hash*), which is a long string of letters and numbers.

    commit d8b95657eebea7083de1a4fb96ba7fb296637342

Fortunately, git allows you to *abbreviate* a hash by using its first few digits... 

...and in fact, git already showed you an abbreviation when you ran `git commit`!

    [master (root-commit) d8b9565] shopping list

Look carefully at the digits inside the brackets -- **`d8b9565`**. They are the *same digits* as the beginning of the full hash above.

> The commit id is generated using a cryptographic algorithm known as "SHA-1 hash", which assures that no two commits will ever have the exact same sequence of digits in their ids.

# LAB: More shopping

Let's pretend that you've gone shopping. You bought ice cream and milk, but the store was out of eggs. And when you got home you noticed you were out of ketchup. 

1. Edit `groceries.txt` to contain only the following lines:

        eggs
        ketchup

2. Go **back to the command line** and type the following command:

        git status

You should see:

    On branch master
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
    
    	modified:   groceries.txt
    
    no changes added to commit (use "git add" and/or "git commit -a")

Again, git is *trying* to be helpful here, but mostly just adding parenthetical clutter. Try to figure out what it's *actually* telling you about the state of your filesystem. (Some answers are on the next slide.)

# LAB: More shopping (cont.)

|message|explanation|
|---|---|
|`On branch master`| you are "on" the *branch* named "master" -- more about branches later |
|`Changes not staged for commit:`| you have edited some files but haven't added or committed those changes yet|
|`modified: groceries.txt`| there are some changes inside the file named `groceries.txt` |
|`no changes added to commit` | you haven't *staged* any of these changes | 

Finally, do the two-step:

1. `git add .`
2. `git status`
3. `git commit -m 'oh no, out of condiments'`
4. `git status`

> It is a **very good habit** to run `git status` incessantly. Like, all the time, between every other `git` command.

# LAB: Shopping History

Now let's pretend that a few days have passed... (or a few hours...) and you ate all that ice cream and you want more. 

But Ben & Jerry's has such weird ice cream names, and you can't remember whether you bought Chunky Monkey or Chubby Hubby or Cherry Garcia!

> oh no, it's an **ICE CREAM-ERGENCY!!!**

Fortunately, git is a time machine. You can view *any point* in history and see the changes made at that point in history.

1. Use `git log` to show the history list
2. Find the *commit id* corresponding to the very first history entry
3. Use `git show` to show that entry

My commit id is `d8b9565` so I would run

    git show d8b9565

# LAB: Shopping History (cont.)

`git show` reveals a lot of information about a single commit, including: 

* *metadata* (like the id and date and author and message) 
* *changes* (in the *unix diff* format, illustrated below)

```
commit d8b95657eebea7083de1a4fb96ba7fb296637342
Author: Alex Chaffee <alex@stinky.com>
Date:   Fri Sep 7 11:24:33 2018 -0400

    shopping list

diff --git a/groceries.txt b/groceries.txt
new file mode 100644
index 0000000..9f0ab0a
--- /dev/null
+++ b/groceries.txt
@@ -0,0 +1,3 @@
+milk
+eggs
+chunky monkey ice cream
```

# LAB: Shopping History (cont.)

Now we remember ... 

![chunky monkey](chunky-monkey-detail.png)

Oh, Chunky Monkey, how could I ever forget you?

# Diffs

Reading diffs can be difficult.

The most important thing is that every line beginning with a `+` was *added* and every line beginning with `-` was *removed*.

Run `git show` on your *second* commit to see something like this:

```
git show e9c9b25c6
commit e9c9b25c65a83729a90c8740f71dc89432d7b548
Author: Alex Chaffee <alex@stinky.com>
Date:   Fri Sep 7 11:53:23 2018 -0400

    oh no, out of condiments

diff --git a/groceries.txt b/groceries.txt
index 9f0ab0a..5ae9411 100644
--- a/groceries.txt
+++ b/groceries.txt
@@ -1,3 +1,2 @@
-milk
 eggs
-chunky monkey ice cream
+ketchup
```

It's saying "milk" and "chunky monkey ice cream" were *removed*, and "ketchup" was *added*, during that commit.
  
# Summary

* `git init` initializes a repo inside a directory
* `git add .` stages all current local changes, including new files and edits inside existing files
* `git commit -m 'message'` turns the *staged* changes into a new *commit* history entry
* `git show` expands a single commit to show the *metadata* and *changes*
* a git ID is a SHA-1 hash that uniquely identifies a single commit

