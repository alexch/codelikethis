# Querying Arrays

* Assume the following slides operate on a collection with the following documents

```javascript
@@@javascript
db.inventory.insertMany( [
   { item: "journal", instock: [ { warehouse: "A", qty: 5 }, { warehouse: "C", qty: 15 } ] },
   { item: "notebook", instock: [ { warehouse: "C", qty: 5 } ] },
   { item: "paper", instock: [ { warehouse: "A", qty: 60 }, { warehouse: "B", qty: 15 } ] },
   { item: "planner", instock: [ { warehouse: "A", qty: 40 }, { warehouse: "B", qty: 5 } ] },
   { item: "postcard", instock: [ { warehouse: "B", qty: 15 }, { warehouse: "C", qty: 35 } ] }
]);
```

# Matching Nested Array Documents

* At least ONE of the documents in the nested array must match exactly
* Order of the properties matters in the query

```javascript
@@@javascript
db.inventory.find(
  { "instock":
    { warehouse: "A", qty: 5 }
  }
)
```

```javascript
@@@javascript
// Matching document
{ item: "journal", instock: [ { warehouse: "A", qty: 5 }, { warehouse: "C", qty: 15 } ] }
```

# Querying Conditions on Nested Arrays

* To query with relaxed conditions, use the property name "." sub-document property concatenation within quotes.

```javascript
@@@javascript
db.inventory.find( { 'instock.qty': 5 } )
```

* Range conditions are also supported

```javascript
@@@javascript
db.inventory.find(
  { 'instock.qty':
    { $lte: 20 }
  }
)
```

* Multiple range conditions are also supported
* Is there a difference betweeen the two below queries?

```javascript
@@@javascript
db.inventory.find(
  { 'instock.qty':
    { $lte: 20, $gte: 5 }
  }
)
```

```javascript
@@@javascript
db.inventory.find(
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
@@@javascript
db.inventory.find(
  { 'instock.0.qty':
    { $lte: 20 }
  }
)
```

# Liberal Matching Without $elemMatch

* Warning: If you provide multiple conditions without `$elemMatch` the semantics mean: "If ANY COMBINATION of these conditions are met, then match"
* This makes the conditions act like OR condtions

```javascript
@@@javascript
db.inventory.find(
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
@@@javascript
db.inventory.find(
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

* `$elemMatch` can be used with range conditions

```javascript
@@@javascript
db.inventory.find(
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

* `$elemMatch` can also be used with multiple range conditions

```javascript
@@@javascript
db.inventory.find(
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
