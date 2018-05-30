# Personal Exercism Fork

Exercism.io is a web site and command-line tool for learning to program. It is a great way to get help from people far away.

For this course, we have made a *custom fork* of Exercism and modified it to work locally.

In </projects/exercism> you created a *local clone* of <https://github.com/BurlingtonCodeAcademy/exercism-javascript>. This clone lives on your own computer's disk drive and you can do anything you like with it!

In this exercise we will make *yet another* copy of the same repo. This will also be yours, and it will live on GitHub in your own account.

[diagram:]

Before:

```
/-------\
| main  |
\-------/
   ^
   |
  origin
   |
/-------\
| local |
\-------/
```

After:

```
/-------\         /-------\
| main  | =fork=> | yours | 
\-------/         \-------/
   ^           _____^ 
   |          /
upstream     /origin
   |        /
/-------\  /
| local |-/
\-------/
```

# Steps

1. Visit <https://github.com/BurlingtonCodeAcademy/exercism-javascript> and click the litle "Fork" button at the top of the page
1. Follow the prompts to create the fork in your own personal account
1. Click the "Clone or Download" button and copy the git URL (`git@...` not `http:...`). This should be very similar to the above URL, but with your github username in it instead of `BurlingtonCodeAcademy`.
1. Open your local Terminal program and visit your `exercism-javascript` directory
1. run `git remote -v` to see the current status; there should be one remote named `origin`
1. This is the fun part! **Paste in** your repo's URL in the second command below:

* `git rename origin upstream`
* `git remote add origin ` *paste your url here*

Finally, run `git remote -v` again and make sure the remotes are correct.

Now you can push your solutions to your own repo, and make Pull Requests from your repo to "upstream" (the main repo).
