# How to Query MongoDB Documents in JS

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

# Finding ALL documents in a Collection

* The most basic query is "Get all the documents in a collection"
* With no conditions
* With all the fields from the document

```javascript
const results = await collection.find({})
await results.forEach(doc => console.log(doc))
```

* Similar to the `SELECT * FROM inventory` in SQL

# Finding a Single Match

* The `db.some-collection.findOne()` method can be used with any of the queries shown in this lesson to limit the results to the first found document.

```javascript
const results = await collection.findOne({item:"planner"})
console.log(results)
```

Doing so will return the document, NOT a a *cursor* so there is no need to iterate over it to display results

# Finding SOME documents in a Collection

* Simple conditions can be added like below:

```javascript
const results = await collection.find( { status: "D" } )
await results.forEach(doc => console.log(doc))
```

* Multple conditions imply an AND between the constraints

```javascript
const results = collection.find( { status: "D", item: "planner" } )
await results.forEach(doc => console.log(doc))
```

# Finding SOME documents using OR

* Can be used with the same properties

```javascript
const results = await collection.find(
  { $or: [
          { item: "Planner" },
          { item: "Notebook" }
         ]
  }
)
await results.forEach(doc => console.log(doc))
```

* Can be used with the different properties

```javascript
const results = await collection.find(
  { $or: [
          { status: "A" },
          { item: "Notebook" }
         ]
  }
)
await results.forEach(doc => console.log(doc))
```

# Finding SOME documents using RANGES

* Simple ranges have the general form syntax of the below template:

```javascript
const results = await collection.find( { <field>: { $gt: <value1>, $lt: <value2> } } );
```

* Multple conditions imply an AND between the constraints

```javascript
const results = await collection.find( { status: "A", qty: { $lt: 30 } } )
await results.forEach(doc => console.log(doc))
```

# Querying for properties IN a set

* Example one

```javascript
const results = await collection.find( { status: { $in: ["A", "B", "C"] } } )
```

* Example two

```javascript
const results = await collection.find( { item: { $in: ["Journal", "Notebook", "Paper"] } } )
await results.forEach(doc => console.log(doc))
```

# Querying Nested Documents

* Matches can be made using exact nested fields like below:

```javascript
const results = await collection.find({ status: "A", size: { h: 14, w: 21, uom: "cm" } })
await results.forEach(doc => console.log(doc))
```

* Matches can also be made using more relaxed nested conditions:

```javascript
const results = await collection.find({ "size.h": 14 });
await results.forEach(doc => console.log(doc))
```

* OR using a combination of an EXACT property and a relaxed nested condition

```javascript
const results = await collection.find({ status: "A", "size.h": 14 })
await results.forEach(doc => console.log(doc))
```

# Range Queries in Nested Documents

* Reminder of document shape and properties

```javascript
{
	"_id" : ObjectId("5b631aff2f6ff13721a2e38b"),
	"item" : "journal",
	"status" : "A",
	"size" : {
		"h" : 14,
		"w" : 21,
		"uom" : "cm"
	}
}
```

* Single Range in a nested document

```javascript
const results = await collection.find({ "size.h":  { $gt: 10 } })
await results.forEach(doc => console.log(doc))
```

* Multiple ranges in a nested document

```javascript
const results = await collection.find({ "size.h":  { $gt: 10, $lt: 100 } })
await results.forEach(doc => console.log(doc))
```

# Range Queries in Nested Documents using OR

```javascript
const results = await collection.find( {
     status: "A",
     $or: [
            { qty: { $lt: 30 } },
            { "size.h": { $gt: 10 } }
          ]
    }
)
await results.forEach(doc => console.log(doc))
```

# List of Comparisons for Ranges

| Name | Description                                                        |
|------|--------------------------------------------------------------------|
| $eq  | Matches values that are equal to a specified value.                |
| $gt  | Matches values that are greater than a specified value.            |
| $gte | Matches values that are greater than or equal to a specified value |
| $in  | Matches any of the values specified in an array                    |
| $lt  | Matches values that are less than a specified value.               |
| $lte | Matches values that are less than or equal to a specified value.   |
| $ne  | Matches all values that are not equal to a specified value.        |
| $nin | Matches none of the values specified in an array.                  |
