# Querying Arrays

This lesson makes the following assumptions:

**1.** You have properly connected to your database, and declared the following:

```javascript
const { MongoClient } = require("mongodb");
const uri = "mongodb://localhost:27017"
const client = new MongoClient(uri, { useUnifiedTopology: true })

async function runQuery() {
    await client.connect()
    const database = client.db('test')
    const collection = database.collection('inventory')
    
     // insert query here
    const results =  

 
    await results.forEach(doc => console.log(doc))
    // close connection
    await client.close()

}
runQuery()
```
**2.** You have added the following test-data:

```javascript
await collection.insertMany([
   { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "A" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
   { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
   { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" }
]);

```
Here is the document we will be querying for (in a variety of ways)

```javascript
// Matching document
{ item: "journal", instock: [ { warehouse: "A", qty: 5 }, { warehouse: "C", qty: 15 } ] }
```

# Querying Conditions on Nested Arrays 1

* To query with relaxed conditions, use the property name "." sub-document property concatenation within quotes.

```javascript
const results = await collection.find( { 'instock.qty': 5 } )
```

* Range conditions are also supported

```javascript
const results = await collection.find(
  { 'instock.qty':
    { $lte: 20 }
  }
)
```

# Querying Conditions on Nested Arrays 2

* Multiple range conditions are also supported
* Is there a difference betweeen the two below queries?

```javascript
const results = await collection.find(
  { 'instock.qty':
    { $lte: 20, $gte: 5 }
  }
)
```

```javascript
const results = await collection.find(
  { 'instock.qty':
    { $lte: 20 },
    'instock.qty': { $gte: 5}
  }
)
```

# Querying Array Documents at Index

* It is possible to direct the query to a specific Array document
* Syntax is: `'<property>.<index>.<subProperty>'`

```javascript
const results = await collection.find(
  { 'instock.0.qty':
    { $lte: 20 }
  }
)
```

# Liberal Matching Without $elemMatch

* Warning: If you provide multiple conditions without `$elemMatch` the semantics mean: "If ANY COMBINATION of these conditions are met, then match"
* This makes the conditions act like OR condtions

```javascript
const results = await collection.find(
  {
    "instock.qty": 5,
    "instock.warehouse": "A"
  }
)
```

# Querying with Many Conditions on Arrays

* `$elemMatch` matches any document with a sub-document that satisfies the full query
* This acts like an AND between the two conditions

```javascript
const results = await collection.find(
  { "instock":
    { $elemMatch:
      {
        qty: 5,
        warehouse: "A"
      }
    }
  }
)
```

# Querying with Range Conditions on Arrays

* `$elemMatch` can be used with range conditions

```javascript
const results = await collection.find(
  { "instock":
    { $elemMatch:
      {
        qty: { $gte: 5 },
        warehouse: "A"
      }
    }
  }
)
```

# Querying with Many Range Conditions on Arrays

* `$elemMatch` can also be used with multiple range conditions

```javascript
const results = await collection.find(
  { "instock":
    {
      $elemMatch: {
        qty: {
          $gte: 5,
          $lte: 20
        },
        warehouse: "A"
      }
    }
  }
)
```
