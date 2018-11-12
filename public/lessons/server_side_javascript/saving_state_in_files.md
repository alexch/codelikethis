# State: Files

Files on disk are the original database.


# File Tech

NodeJS is good at files.

The built-in `fs` and `path` libraries have some slick and efficient ways of reading and writing files.

Rather than go through the full API, it's best to look at sample code like that inside the [Blog project](/projects/blog)

> Remember that most of Node's I/O functions are asynchronous, so you may need to use callbacks, Promises, and/or async-await.

# Heroku's Ephemeral Filesystem

you can write files to the `/tmp` and `process.env.HOME` directories

they will stay there for a while, but will disappear when your server restarts

see https://stackoverflow.com/questions/12416738/how-to-use-herokus-ephemeral-filesystem

...so for apps on Heroku at least, we need a better solution for storing data long-term  

