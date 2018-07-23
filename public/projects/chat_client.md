# Chat Client

We are running a chat server; build and run the client

## Message Schema

Can be represented as a JSON object in a POST body or as a query string on GET requests

* when - a string in ISO8601 format
* body - a string
* author - a string

e.g.
```
{
    "when": "2018-07-15T20:00:47.696Z",
    "author": "alex",
    "body": "my dog has fleas"
}
```

## Routes (without rooms)

|Route|Input|Output|
|---|---|---|
|`GET /`     | nothing | HTML for main page |
|`GET /chat` | since= (optional) | JSON: list of messages |
|`POST /chat`| body= <br> author= (optional) | JSON: list of messages |

<!--box-->

## Step 1: Up and Running

* GET all messages at /chat route
* POST a message to /chat
* Use the Heroku instance we will deploy during class

<!--/box-->
<!--box-->

## Step 2: Recent Messages

**Given** a set of messages in the recent past

**When** a user requests all messages, if they add a `since` parameter to the GET request

**Then** only messages that were sent since then are returned

#### Tech:

Server-side:

* GET accepts a parameter `since`

Client-side:

* Create a variable `mostRecentMessageAt`
* When you receive a list of messages, set `mostRecentMessageAt` to the *most recent* message time
* When you request a list of messages, add `since` to the request

<!--/box-->
<!--box-->

## Step 3: Refresh Messages

* Implement a `<button>` to fetch new messages
  * if you're using the source code template, this is already implemented

<!--/box-->
<!--box-->

## Step 4: Poll for new messages every 10 seconds

Tech:

* use `setInterval` or `setTimeout`

<!--/box-->
<!--box-->

## Step 5: Names

Client: Add an `author` field to the "submit message" form.

Server: Process this `author` parameter and save it in the message.

More client: Make sure the client UI displays the name as well as the body of each message.

Extra credit: store the name in a cookie so the user doesn't have to keep typing it

<!--/box-->
<!--box-->

## Step 6: Rooms

Change stuff around so 

  * `GET /chat/debugging` gets all messages from the room whose id is "debugging".
  * `POST /chat/debugging` sends a message to that room

Assume that the server will create a new room if it doesn't already have one with that id.

#### Any message sent to /chat displays in the Main room

  * Message should be displayed with the `author` and `created_at`
  * Should there be a maximum message length/size?

<!--/box-->

## Routes (with rooms)

|Route|Input|Output|
|---|---|---|
|`GET /`     | nothing | HTML for main chat app page |
|`GET /chat` | since= (optional) | JSON: list of messages |
|`POST /chat`| body= <br> author= (optional) | JSON: list of messages |
|`GET /chat/room`     | since= (optional) | JSON: list of messages |
|`POST /chat/room`    | body= <br> author= (optional) | JSON: list of messages |

## Backlog

  * Handle scrolling back through older messages
  * Persistence (after server restart)

Next: write a [chat_server](chat_server) using classes
