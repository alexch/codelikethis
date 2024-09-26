# Overview
When writing to a database, it is often important to ensure the data is as expected.

Enter schema-validation with **Mongoose**. 

[Mongoose](https://mongoosejs.com/) is an object data modeling (ODM) library.
 
Or in their words,

        "A straight-forward, schema-based solution to model your application data"

# Getting Started
* Mongoose replaces the `mongodb` driver
* Runs `mongodb` queries under the hood

Make a new directory named `mongoose-example` 

```
cd mongoose-example
npm init -y
npm install mongoose
```
# Getting Started, cont.
Create a file called `mongoose.js`
In it, write the following code.

`example_db` in the connection string `"mongodb://localhost:27017/example_db"` denotes a database name, and can be anything you choose. 

```javascript
const mongoose = require('mongoose')
/* 
pass { useNewUrlParser: true, useUnifiedTopology: true } as a second 
argument to the connect method to avoid deprecation warnings
*/
mongoose.connect('mongodb://localhost:27017/example_db') 
const db = mongoose.connection

db.on('error', console.error.bind(console, 'connection error:'))
```

# Concept: Schemas
A database schema outlines the expected structure of the data that will be inserted into a *collection*

A database schema can also define *methods* on the documents being inserted. 

* *defines* what that data should look like, and how it should behave.
* used to create a *model* 
* definitions are based on `SchemaTypes`



# Lab: Schemas 

```javascript
const studentSchema = new mongoose.Schema({
    name: String,
    age: Number,
    hobbies: Array,
    current: Boolean
})
```

The `SchemaType` is the 'value' to the right of the `:`, and is by default a *configuration object*.

`String` is supported shorthand for `{type:String}`. Same goes for `Number, Array, Boolean, etc...`

The code above defines a simple schema that expects a certain datatype for the given field.
A comprehensive list can be found [here](https://mongoosejs.com/docs/guide.html#definition).


# Concept: Model
While the definition of the data's structure is held in the Schema, a *Model* actually handles the work.

* *constructors* built using the *schema*
* *enforces* definition of schema
* creates a collection based on provided name
* instances of models are documents


# Lab: Models
Take our previous schema, `studentSchema`. Let's create a *model* from that schema, and call it `Student`.

```javascript
const Student = mongoose.model('Student', studentSchema)

const paul = new Student({ name: 'Paul', age: 29, hobbies: ['guitar', 'd&d', 'coding'] })
// call the save() method on a model instance (document) to insert it to the collection 
paul.save()
```
Or a version with error handling

```javascript
paul.save((err, paul) => {
    if (err) {
        return console.error(err)
    } else {
        return console.log("document inserted!")
    }
})
```
Think of `Student` as a *Class* with enforcement run by the *Schema* underneath.

We can create an *instance* of the `Student` model like we would any class!


# Models and Collections
* creating an *instance* of a Model makes a document that can be saved to a collection
* that *collection* is is a lower-case, pluralized version of the Model name 
    - Model: `Student`
    - Collection: `students`
* the collection can be queried directly with methods on the Model:
    - supports MongoDB query syntax
    - takes a callback for error handling


# Seeing it work
```javascript
Student.find({ name: 'Paul' }, (err, results) => {
    if (err) {
        return console.log(err)
    } else {
        return console.log(results) // => [{name:'Paul, age: 29, ...}]
    }
})
```
You can also open up **Compass** and what it does with the collection name. 
You should see `students` under `example_db`, or whatever you ended your connection string with.

# Seeing it break
Let's try create an instance of the `Student` model, and intentionally give it bad data:

```javascript
let sam = new Student({name:"Samantha", age:"thirty-two", hobbies:["carpentry", "archery"]})
sam.save()
`Student validation failed: age: Cast to Number failed for value "thirty-two" at path "age"`
```
It thorws an error! It's working!