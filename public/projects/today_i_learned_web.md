# Today I Learned - Web Application

During your programming journey you will come across questions every day and need to find answers for those questions. Studies have found a [cognitive benefit to journaling](https://psychcentral.com/lib/the-health-benefits-of-journaling/) when learning new content, or balancing between multiple priorities. For many people the act of writing down a problem, the path to finding a solution, and the answer, stimulates pathways in the brain which help in memory recall and problem solving.

Your task for this project is to build a web-server and front-end application that you can use to record, search, edit, and reference answers for various programming tasks. The notes that you create will serve as both a log of your personal learning, and a reference of prior solved problems to remind yourself how to do tasks in the future.

# Tech

## Starter Code

Follow the Github Classroom link and clone the starter repository down to your local machine

This code includes a command-line program and an Express web server program which can both connect to a MongoDB database server running either locally on the development environment or remotely in the cloud.

## MongoDB Installation

Please make sure that you have a recent version of MongoDB installed on your development environment.

Use the following command in a terminal and look for a version of `4.x`.

`$ mongo --version`

You can follow the instructions here to achieve this if you **DO NOT** already have MongoDB installed.

- https://docs.mongodb.com/manual/administration/install-community/

## Sign up for a mongoDB Atlas Account

We use the free database as a service provider, Atlas, for connecting a production version of the application to a database hosted in the cloud. Please visit the following URL and sign-up for an Atlas account in order to create and use a database which is reachable from the internet.

- https://www.mongodb.com/cloud/atlas

## Considerations

  * What fields should be required for a TIL entry?
    - Title?
    - Content?
    - Author?
    - Topic or Category?
    - Links to resources?
  * How could you find and update an existing TIL entry?
  * How could you search for entries containing a word, phrase, or category?
  * How could you remove an existing TIL entry?
  * How could you format TIL entries so that `code` appears mono-spaced and syntax highlighted?
  * How could you add comments to TIL entries?
  * How do you enforce who can create/edit/delete new entries?

# Stories

<!--BOX-->

## Creating a new TIL entry

**Given**: an empty HTML form at the path `/`

**When** a user inputs:

```
To convert JSON to JavaScript object user JSON.parse("{'some': 'json'}");
```

**Then** a new TIL entry is created

**And** the TIL entry.text equals:

```
To convert JSON to JavaScript object user JSON.parse("{'some': 'json'}");
```

<!--/BOX-->

<!--BOX-->

## Listing existing TIL entries

**Given** an existing TIL entry with the text:

```
To convert JSON to JavaScript object user JSON.parse("{'some': 'json'}");
```

And a when of:
`2018-01-01T12:15:00+0400`

**When** a user visits the URL path:

`/facts`

**Then** the web-page should display a list of HTML formatted TIL entries including exactly one entry with:

| Attribute   | Value                                                                            |
| :---------- | :------                                                                          |
| text        | `To convert JSON to JavaScript object user JSON.parse("{'some': 'json'}"); |
| when        | `2018-01-01T12:15:00+0400`                                                       |

> Note: this section was first written in 2018, The actual date for your TIL entry should be much more recent

<!--/BOX-->

<!--BOX-->

## Display a TIL entry

**Given** an existing TIL entry with the `text` attribute of:

`To get an objects attributes use Object.keys(someObject);`

And the `when` attribute  of:

`2018-01-01T14:05:00+0400`

And an `_id` attribute with a value, *represented with a placeholder as* `:objectId`.

**When** a user visits the URL path:

`/facts/:objectId`

**Then** the web-page should display a single HTML formatted TIL entry with the attributes:

| Attribute   | Value                                                       |
| :---------- | :------                                                     |
| text        | `To get an objects attributes use Object.keys(someObject);` |
| when        | `2018-01-01T14:05:00+0400`                                  |

<!--/BOX-->

<!--BOX-->

## Listing multiple TIL entries

**Given** an existing TIL entry with the following attributes:

| Attribute   | Value                                                         |
| :---------- | :------                                                       |
| text        | `To get an objects attributes use Object.values(someObject);` |
| when        | `2018-01-01T15:30:00+0400`                                    |

**And** an second TIL entry with the following attributes:

| Attribute   | Value                                                                         |
| :---------- | :------                                                                       |
| text        | `To convert JSON to JavaScript object user JSON.parse("{'some': 'json'}");` |
| when        | `2018-01-01T12:15:00+0400`                                                    |


**When** a user visits the URL path in the browser:

`/facts`

**Then** the web-page should display two HTML formatted TIL entries with the attributes:

| Attribute   | Value                                                                         |  Order |
| :---------- | :------                                                                       | :----- |
| text        | `To get an objects attributes use Object.keys(someObject)`                    |      1 |
| when        | `2018-01-01T14:05:00+0400`                                                    |      1 |
| text        | `To convert JSON to JavaScript object user JSON.parse("{'some': 'json'}");` |      2 |
| when        | `2018-01-01T12:15:00+0400`                                                    |      2 |

**And** should be able to navigate to an individual entry's page by clicking on the text

<!--/BOX-->

<!--BOX-->

## Editing an existing TIL entry

**Given** an existing TIL entry with the following attributes:

| Attribute   | Value                                                                         |
| :---------- | :------                                                                       |
| text        | `To convert string input to an Integer use parseInt("42")` |
| when        | `2018-01-01T17:00:00+0400`                                                    |

**And** the record has an `_id` attribute with a value, *represented with a placeholder as* `:objectId`.

**When** a user visits the URL path `/facts/:objectId`

**Then** the web-page is populated with a `<form>` element containing the following inputs and values

| Input          | Value                                                      |
| :----------    | :------                                                    |
| text           | `To convert string input to an Integer use parseInt("42")` |
| datetime-local | `2018-01-01T17:00:00+0400`                                 |

>Note: Take a look at the `DateTime-Local` input type on Mozilla Developer Network [DateTime-Local Form Input Type](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/datetime-local)

<!--/BOX-->

<!--BOX-->

## Delete a TIL entry

**Given** an existing TIL entry with the following attributes:

| Attribute   | Value                                                                         |
| :---------- | :------                                                                       |
| text        | `To convert a number to a string use (42).toString()` |
| when        | `2018-01-01T19:30:00+0400`                                                    |

**And** the record has an `_id` attribute with a value, *represented with a placeholder as* `:objectId`.

**When** a user visits the URL path `/facts/:objectId` they should see a "Delete" button

**And** the user clicks on the "Delete" button

**Then** the user should be presented with a confirmation dialog asking `Are you sure you want to delete this TIL Entry?`

**And** the TIL entry should be `deleted` from the `facts` collection within the database, after clicking `Confirm`

**And** the user should be receive an HTTP response code of `200` and *then be redirected* to the `/` URL path

<!--/BOX-->

<!--BOX-->
# Icebox

- Tagging entries with a category
- Filtering entries by category
- Enter details containing Markdown and display the output of the Markdown as HTML.
- Search entries by the text they contain, such as 'Javascript', 'React', 'NodeJS', or 'Mongo'.
- Search entries by date

<!--/BOX-->
