# Databases Overview

* Database definition
* Server vs. Server vs. Server
* Database concepts
* Database styles

# Database definition

> *database* (n.) -
> a structured set of data held in a computer, usually organized so that it can be easily accessed, managed and updated

# Database Examples

* Relational DBs: (SQL)
  * Oracle
  * MySQL
  * PostgresQL
  * Microsoft SQL Server
* Document DBs: (NoSQL)
  * MongoDB
  * CouchDB
  * Google BigTable
  * Apache Cassandra
* Object-Oriented DBs:
  * Smalltalk/Gemstone, Prevayler
* Graph DBs:
  * Neo4j
  * GraphQL (not a database *per se*, but a query language *for* graph DBs and APIs)
* File Systems: 
  * any Unix or DOS filesystem
  * IPFS

# Server vs. Server vs. Server

There are at least *three* overlapping uses of the term "server":

1. a *process* running on a computer that responds to queries
1. the *actual computer* running that process

So you could say "my Linux server is running a Mong server" without ambiguity.

There is similar fuzziness around the term "database" -- e.g. a single MongoDB database *server* has many independent *databases*, each with its own users, permissions, collections, etc.

Usually the meaning is clear from context, but sometimes you need to clarify.

# Application Database vs Integration Database

Martin Fowler makes the following distinction:

* an *[application database](https://martinfowler.com/bliki/ApplicationDatabase.html)* has only one client, a single application written and maintained by a single team of software engineers
* an *[integration database](https://martinfowler.com/bliki/IntegrationDatabase.html)* has many clients, and may even support direct hand-crafted console queries by humans

The needs of the two scenarios are often very different, and people with experience in one style can have very different assumptions than people with experience in the other style; they often end up talking past each other.
 
In an organization with a history of using integration DBs, it can be difficult to write applications, since common operations (like adding a table or renaming a field) must go through a process to make sure they don't break *other apps* or use cases.

> One the great advantages of an application database is that it is easier to change since all its use is **encapsulated** by a single application. Evolutionary database design and database refactoring can be used to make significant changes to an application database's design even after the database is put into production.
 

# Database concepts

  * Connection
  * Collection
  * Record
  * Primary Key
  * CRUD
  * Index
  * Query / Search
  * Transaction
  * Blob
  * Replication
  * Join

# Connection

Most database protocols are *stateful*, which means the communication between client and server involves more than a single request and response.

Generally the client connects to a server early on and *authenticates* itself (logs in), then *keeps the connection open* so it doesn't need to authenticate on later requests.

(This can lead to trouble because servers have a limit on the number of simultaneous connections they can preserve, leading to client-side software solutions like *connection pooling*.)

# Collection

Data is stored in *collections*; each collection has a unique name.

Example (SQL):

`SELECT * FROM students`  -- "give me all the data from the collection named 'students'"

(in SQL DBs, a collection is normally called a *table*)

# Record

In a database, the data is stored in packets called *records*.

Every record in a collection has the same *field names* but each record usually has different *values* in each field.

(in SQL DBs, a record is also called a *row*)

# Primary Key

a *primary key* is a field that *uniquely identifies* a record from among all other records in the collection

usually the primary key is an *integer* but often it's a *string* 

also called an *id* (and often the name of the field itself is `id`)

databases have ways to ensure uniqueness, usually by causing new records to automatically get the next id in sequence

# CRUD

The four basic database operations:

* **C**reate
* **R**ead
* **U**pdate
* **D**elete

# JIST

In addition to CRUD, the following features are also fairly standard: 

* **J**oin several documents (records) into one in response to a single query
* **I**ndex by field for fast lookup and search
* **S**earch by field or "free text"
* maintain **T**ransactional integrity (like making sure multiple simultaneous actions don't corrupt the data)

# Query / Search

definitions:

a *query* is any request to a database, *including requests to update records*

a *search* is either

1. any *find* operation that may return multiple results
2. a *full-text search* or a *keyword search* that looks for bits of text *inside* certain fields

# Transaction

One thing database servers are good for is handling many different queries happening simultaneously.

A *transaction* wraps up serveral operations so that they all happen together.

For example, when making a transfer between two bank accounts, you want the withdrawal and the deposit to happen *as one transaction*.

If any step in the transaction fails, the transaction is *rolled back* -- all its changes are reverted and no other connection will ever see the changes.

If everything succeeds, the transaction is *committed* and other connections can see all the changes.

# Blob

Blob stands for "Binary Large Object" but it is also a good metaphor.

A blob is *any piece of data* that the database treats like a blob -- it does not look inside it,  doesn't know its value, can't sort based on it, allows it to be arbitrarily small or large, etc.

# Join

In relational databases, the data is organized in *tables* and different records are connected only indirectly, using *foreign keys*.

So if a `Person` has an `Address`, and those are stored in separate tables, if you want to get a person *and* their address *in a single query*, you need to **join** those tables together.

The syntax and usage of joins can get very complicated, but at heart it's straightforward

In document DBs, joins are often not necessary because documents *contain their contents*; with SQL databases, the contents *point to their containers*

# Schema

a *schema* defines the *types, names, valid values* of a database

in SQL the schema is *explicit* and must be defined before inserting any data

in NoSQL, often, the schema is *implicit* and it's up to the application developer to ensure the data conforms to the application's needs


