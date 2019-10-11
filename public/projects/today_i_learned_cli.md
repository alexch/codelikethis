# Today I Learned - Command Line

During your programming journey you will come across questions every day and need to find answers for those questions. Studies have found a [cognitive benefit to journaling](https://psychcentral.com/lib/the-health-benefits-of-journaling/) when learning new content, or balancing between multiple priorities. For many people the act of writing down a problem, the path to finding a solution, and the answer, stimulates pathways in the brain which help in memory recall and problem solving.

Your task for this project is to build a command line program which you can use to record, search, edit, and reference answers for various programming questions and answers.

## Considerations

* How could you record the Date and Time of each TIL entry?
* How could you find and edit an existing TIL entry?
* How could you write multi-line TIL entries?

# Stories

<!--BOX-->

## Creating a new TIL entry

**Given** an empty command prompt

**When** a user inputs:

```sh
til To convert JSON to a JavaScript object use JSON.parse(myObject)
```

**Then** a new TIL entry is created

**And** the TIL entry.content equals:

```
To convert JSON to a JavaScript object, use JSON.parse(myObject)
```

<!--/BOX-->
<!--BOX-->

## Listing existing TIL entries

**Given** an existing TIL entry with the content:

```
To convert JSON to a JavaScript object, use JSON.parse(myObject)
```

And the Date-Time:
`2018-01-01T12:15:00+0400`

**When** a user inputs:

```sh
til --list
```

**Then** the command prompt will contain

```sh
0 2018-01-01T12:15:00+0400 To convert JSON to a JavaScript object, use JSON.parse(myObject)
```

<!--/BOX-->
<!--BOX-->

## Display a TIL entry

**Given** an existing TIL entry with the content:
`To convert JSON to a JavaScript object, use JSON.parse(myObject)`

And the Date-Time:
`2018-01-01T12:15:00+0400`

**When** a user inputs:

```sh
til --show 0
```

**Then** the terminal will output

```sh
CREATED: 2018-01-01T12:15:00+0400
CONTENT: To convert JSON to a JavaScript object, use JSON.parse(myObject)
```

<!--/BOX-->
<!--BOX-->

## Listing multiple TIL entries

**Given** an existing TIL entry with the content:
`To convert JSON to a JavaScript object, use JSON.parse(myObject)`
And the Date-Time:
`2018-01-01T12:15:00+0400`

**And** an existing TIL entry with the content:
`To get the length of a JavaScript Array, ['some', 'array'].length`
And the Date-Time:
`2018-03-02T18:30:00+0400`

**When** a user inputs:

```sh
til --list
```

**Then** the command prompt will contain:

```sh
0 2018-01-01T12:15:00+0400 To convert JSON to a JavaScript object, use JSON.parse(myObject)
1 2018-03-02T18:30:00+0400 To get the length of a JavaScript Array, ['some', 'array'].length
```

<!--/BOX-->
<!--BOX-->

## Editing an existing TIL entry

**Given** an existing TIL entry with the content:

`To convert JSON to a JavaScript object, use JSON.parse(myObject)`

**When** a user inputs:

```sh
til --edit 0
```

**And** the user changes the contents:

From:

```text
To convert JSON to a JavaScript object, use JSON.parse(myObject)
```

To:

```text
To convert JSON to a JavaScript object, use JSON.parse('{"name": "Ada Lovelace"}')
```

**And** the TIL entry is saved

**Then** the contents of the TIL entry will contain:

```text
To convert JSON to a JavaScript object, use JSON.parse('{"name": "Ada Lovelace"}')
```

<!--/BOX-->
<!--BOX-->

## Delete a TIL entry

**Given** an existing TIL entry with the content:

```text
To convert JSON to a JavaScript object, use JSON.parse('{"name": "Ada Lovelace"}')
```

**When** a user inputs:

```sh
til --delete 0
```

**Then** the terminal will output

`D 0 2018-01-01T12:15:00+0400 To convert JSON to a Javascript object, use JSON.parse('{"name": "Ada Lovelace"}')`

**And** there are zero entries when the user inputs

```sh
til --list
```

<!--/BOX-->

# Icebox

<!--BOX-->
- Tagging entries with a category
- List entries after or before some date
- List between two dates
- Reports of TIL entry activity:
  - Heatmap with:
    - entries with days of week descending on Y axis and weeks of year on the X axis
    - X for a day with an entry and an O for a day without an entry
    - Could you use colors in the terminal instead of an X or O?

<!--/BOX-->
