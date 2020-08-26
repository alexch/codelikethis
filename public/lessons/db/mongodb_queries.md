# How to Query MongoDB Documents

* The queries below assume the following documents have been inserted

```javascript
db.inventory.insertMany([
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
db.inventory.find( {} )
```

* Similar to the `SELECT * FROM inventory` in SQL

# Finding a Single Match

* The `db.some-collection.findOne()` method can be used with any of the queries shown in this lesson to limit the results to the first found document.

```javascript
db.inventory.findOne()
```

# Finding SOME documents in a Collection

* Simple conditions can be added like below:

```javascript
db.inventory.find( { status: "D" } )
```

* Multple conditions imply an AND between the constraints

```javascript
db.inventory.find( { status: "D", item: "planner" } )
```

# Finding SOME documents using OR

* Can be used with the same properties

```javascript
db.inventory.find(
  { $or: [
          { item: "Planner" },
          { item: "Notebook" }
         ]
  }
)
```

* Can be used with the different properties

```javascript
db.inventory.find(
  { $or: [
          { status: "A" },
          { item: "Notebook" }
         ]
  }
)
```

# Finding SOME documents using RANGES

* Simple ranges have the general form syntax of the below template:

```javascript
db.collection.find( { <field>: { $gt: <value1>, $lt: <value2> } } );
```

* Multple conditions imply an AND between the constraints

```javascript
db.inventory.find( { status: "A", qty: { $lt: 30 } } )
```

# Querying for properties IN a set

* Example one

```javascript
db.inventory.find( { status: { $in: ["A", "B", "C"] } } )
```

* Example two

```javascript
db.inventory.find( { item: { $in: ["Journal", "Notebook", "Paper"] } } )
```

# Querying Nested Documents

* Matches can be made using exact nested fields like below:

```javascript
db.inventory.find({ status: "A", size: { h: 14, w: 21, uom: "cm" } })
```

* Matches can also be made using more relaxed nested conditions:

```javascript
db.inventory.find({ "size.h": 14 });
```

* OR using a combination of an EXACT property and a relaxed nested condition

```javascript
db.inventory.find({ status: "A", "size.h": 14 })
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
db.inventory.find({ "size.h":  { $gt: 10 } })
```

* Multiple ranges in a nested document

```javascript
db.inventory.find({ "size.h":  { $gt: 10, $lt: 100 } })
```

# Range Queries in Nested Documents using OR

```javascript
db.inventory.find( {
     status: "A",
     $or: [
            { qty: { $lt: 30 } },
            { "size.h": { $gt: 10 } }
          ]
    }
)
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
