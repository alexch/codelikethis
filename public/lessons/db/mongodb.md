# MongoDB

# MongoDB Overview

* document database (NoSQL)
* horizontal sharding => can theoretically serve *trillions* of records
* uses JavaScript for data definition and manipulation
* built-in map-reduce for dynamic collections
* indexing on fields by value or free-text search 

> "Mongo is not a toy, although it can be fun to play with." - Josh Burke

# Concept: Database

to connect to a database you need a Mongo URI (or URL) identifying the server, port, etc.:

Connection URL format:

```
mongodb://username:password@host/database
```

for example

```
mongodb://mydatabasehost.com:27017/til
```

Note that the term "database" is overloaded: it refers to either:

1. a single MongoDB *process* hosting many data sets
2. a single MongoDB *data set* containing many related *collections*

# Concept: Collection

a *collection* holds documents

this is analogous to a *table* in SQL

# Concept: Document

In MongoDB, a *document* is essentially a single JavaScript object

Like in a relational database, a document can be created, read, updated, deleted, indexed, searched for, ...

*Unlike* in a relational database, a document can contain *any* value for its fields, *including arrays and nested objects*.

This nesting and type-flexibility makes it very appropriate to store whatever JavaScript objects your app uses, without needing to devise a *mapping* between nested objects and joined relational tables.

# Mongo Console

MongoDB has a JavaScript REPL console, like `node`. 

Launch it by typing `mongo dbname` on the command line -- e.g. for the `til` database, run `mongo til`

In this console, run `help` to see what's possible.

```
> db.entries.find({})
{ "_id" : ObjectId("5b5d0e45114a7c1433296d71"), "when" : ISODate("2018-07-29T00:45:57.074Z"), "text" : "hello" }
{ "_id" : ObjectId("5b5d1595e71e8e073c15b229"), "when" : ISODate("2018-07-29T01:17:09.191Z"), "text" : "hello there" }
{ "_id" : ObjectId("5b5e143b203dd808f88d2548"), "when" : ISODate("2018-07-29T19:23:39.695Z"), "text" : "chickens like corn" }
{ "_id" : ObjectId("5b5e27ba44c44608f97083f3"), "when" : ISODate("2018-07-29T20:46:50.749Z"), "text" : "dogs like to bark" }

> db.entries.find({ when: {'$gte': new Date(2018, 6, 29) }})
{ "_id" : ObjectId("5b5e143b203dd808f88d2548"), "when" : ISODate("2018-07-29T19:23:39.695Z"), "text" : "chickens like corn" }
{ "_id" : ObjectId("5b5e27ba44c44608f97083f3"), "when" : ISODate("2018-07-29T20:46:50.749Z"), "text" : "dogs like to bark" }

```

# Concept: ObjectId

- `_id` is assigned by Mongo when a document is inserted
- `ObjectId` is a factory function that either generates a new id, or 

# Lab: Connect and Collect

