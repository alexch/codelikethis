# MongoDB Example

Let's analyze the source code of the TIL app to understand the steps involved in using MongoDB from NodeJS.

Follow along here: <https://github.com/BurlingtonCodeAcademy/til/blob/master/til.js>

# Driver

the MongoDB library is called a *driver*

the metaphor is that it *drives* the underlying native interface, connecting a network protocol with NodeJS

Here are its API docs: 

* http://mongodb.github.io/node-mongodb-native/3.1/api/

# Connect

Connect to MongoDB with a URI:
  
    const url = process.env.MONGODB_URI || 'mongodb://localhost:27017';

> if there's a shell environment variable named MONGODB_URI, use it; otherwise, connect to localhost

# Read the Command Line Parameters

This isn't Mongo-related but it might be confusing.

When the user runs `til` like this:

    til add dogs like to bark
    
then `process.argv` looks like this:

    [ '/usr/local/Cellar/node/10.5.0_1/bin/node',
      '/usr/local/bin/til',
      'add',
      'dogs',
      'like',
      'to',
      'bark' ]     

The first two parameters are not useful to us; the next parameter is the command name; and all the remaining parameters comprise the text of the lesson we want to save.

So after running these commands:

    let params = process.argv.slice(2);
    let command = params.shift();
    let text = params.join(' ').trim();

we have the following values:

|variable|value|
|---|---|
|params| `['dogs', 'like', 'to', 'bark' ]` |
|command| `add`
|text| `'dogs like to bark'

# Callback Hell

Like many NodeJS libraries, `mongodb` relies heavily on *asynchronous events*.

This means that when you call a function, you often need to pass in a *callback function*. This lets your code regain control after the library has finished doing what you asked it to do.

see <http://callbackhell.com/> 

# I Put Callbacks In Your Callback

Additionally, sometimes your callback is passed  *yet another callback function* which you **must** call when your code is finished.  

![yo dawg callbacks](/images/yo-dawg-callbacks.png)

# `connectAnd`

This function is responsible for 

1. opening a connection to the MongoDB server
2. finding the *collection* of TIL entries
3. passing that collection to a callback
4. closing the connection to the MongoDB server

Step 3 uses a callback function that the caller passes in. This callback accepts 3 parameters:

1. the Mongo `db` object
2. the Mongo `collection` object
3. *another callback* to send control *back* to `connectAnd` to finish up 

```
function connectAnd(callback) {
  MongoClient.connect(url, { useNewUrlParser: true }, function (err, client) {
    assert.equal(null, err);

    const db = client.db(dbName);
    const collection = db.collection('entries');

    callback(db, collection, () => {
      client.close();
    });
  });
}
```

# `saveEntry`

This function 

1. uses `connectAnd` to retrieve the *collection* object
2. inserts an entry into it
3. *calls back* so `connectAnd` can finish up and close the connection

```
function saveEntry(entry) {
  connectAnd((db, collection, finishUp) => {
    collection.insertOne(entry, (err, r) => {
      assert.equal(null, err);
      assert.equal(1, r.insertedCount);
      finishUp();
    });
  });
}
```

# `printEntries`

This function 

1. uses `connectAnd` to retrieve the *collection* object
2. uses `collection.find` to retrieve a *cursor* to walk through all the entries in that collection
3. prints each entry
4. *calls back* so `connectAnd` can finish up and close the connection

```
function printEntries() {
  connectAnd((db, collection, finishUp) => {
    let cursor = collection.find({}).sort([['when', 1]]);
    let currentDay;
    cursor.forEach((entry) => {
      currentDay = printEntry(entry, currentDay);
    }, function (err) {
      assert.equal(null, err);
      finishUp();
    });
  });
}
```

# `find`

`collection.find` takes a parameter named `query` listing the *fields and values* to match on. 

For instance, `collection.find({author: 'alex')` returns all entries whose `author` field is the string `alex`

For more complicated queries, you can use operators like `$gte` (greater than or equal) and `$or`, e.g. this would find all items created on January 21, 2012:

```
collection.find({
 when: {
    '$gte': new Date(2012, 0, 21),
    '$lt': new Date(2012, 0, 22)
})
```

docs here: 
  * <http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#find>
  * <https://docs.mongodb.com/manual/tutorial/query-documents/>
  
# Cursor

a cursor is an iterator -- an object that keeps track of a position in a collection,, and keeps returning the next item until it's done

`cursor.forEach` takes two parameters:

1. a function to call on each item
2. a function to call when done

# `_id`

Every time you insert a document into a MongoDB collection, Mongo adds a field named `_id` with a *unique* value.

This id is *not* a normal integer! It's a long string with a hex code inside it. 

Mongo has an algorithm for ensuring that this id is unique across *all other documents* in itself (and probably inside every other MongoDB database in the universe too).

In JavaScript, Mongo defines a *class* named `ObjectId` that encapsulates this string and provides useful methods; that's why in the output of `find` you see the JS code: 

```
{ "_id" : ObjectId("5b5e27ba44c44608f97083f3"), "when" : ISODate("2018-07-29T20:46:50.749Z"), "text" : "dogs like to bark" }
```