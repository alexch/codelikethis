# Git Commands
Please note that any text in angle brackets `<>` is a placeholder for an actual value, you shouldn't type it in literally (or include the angle brackets).

## From Scratch

* `git init` initializes a repo inside a directory. Adding repositories inside repositories is not a good idea, and will cause issues with tracking changes.

## From a Remote Repository

* `git clone <git repo URL>` takes the repository from the specified URL and makes a copy of it on your local machine, and sets the local repository to track changes in the remote repository.

## Removing a Repo from a Directory

* `rm -r .git` will remove your git repository from a directory. If you've already added some commits it will warn you about deleteing these files.  You can just hit <kbd>enter</kbd> through these (there will be a warning for every commit) and it will remove the git repo.

# Tracking Your Changes

## the Two Step Commit Process

* `git add .` stages all current local changes, including new files and edits inside existing files
  * Alternatively you can add files individually by using `git add <file name>`
  * `git add ./<subdirectory name>` will add all the files inside the specified subdirectory
  >Note: If you are adding a file that is inside a subdirectory you will need to pass the path to that file e.g. `git add ./client/public/index.html`
<br /><br />

* `git commit -m "message"` turns the *staged* changes into a new *commit* history entry

## Viewing Your History

* `git status` shows the current status of your repo including which files are tracked and untracked, and how many commits you are ahead or behind your remote repository.  It is a very good idea to check your status incessantly.

* `git log` shows all commits and *metadata*

* `git show <commit ID>` expands a single commit to show the *metadata* **and** *changes*

## Syncing Your Local and Remote Repositories

* `git push` sends your change history from your local repository to a remote repository
  * If you are pushing from a local repository to a *new* GitHub repository use the command `git push -u origin master` to make your local repo track changes to the remote repo.
<br /><br />

* `git pull` gets new changes from a remote repository and applies them to your local repository.
  * If you're code has changed in both the local and remote repositories you might get merge conflicts.  Git will try to auto resolve merges where possible, but sometimes you will have to tell it explicitly which changes should overwrite, or if you want to apply the changes from both repositories.

# Misc

* a git ID is a SHA-1 hash that uniquely identifies a single commit
