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

# Lab: Mongo CLI

Let's make our first Mongo collection through the terminal!

- Open your console and `cd` over to the location where you installed MongoDB
- Once you're in the `bin` directory you can type `mongo test` to start the mongo shell, and create a collection named "test"
- Once you're in the mongo shell type `help` to see the opttions available to you
- Create an object and insert it into the collection
  - Add a few
- View all the objects you just added
- View a single object
- Update an object
- Delete an object

# Concept: ObjectId

- `_id` is assigned by Mongo when a document is inserted
- `ObjectId` is a factory function that either generates a new id, or transforms a given string into a Mongo ID object

# Lab: Exploring with Compass

When you installed MongoDB you should have also installed an application called "Compass."  This is MongoDb's GUI tool. Let's open it up and see what it can do!

- Open compass and hit the green button that says "connect"
- Look for the database named "test" in the left side nav bar, and open it
- Create a new collection
- In the collection you just created try tunning through all the CRUD functions