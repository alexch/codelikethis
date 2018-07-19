# Chat Client

We are running a chat server; build and run the client

## Message Schema

Can be represented as a JSON object in a POST body or as a query string on GET requests

* when - a string in ISO8601 format
* content - a string
* author - a string

e.g.
```
{
    "when": "2018-07-15T20:00:47.696Z",
    "author": "alex",
    "content": "my dog has fleas"
}
```

## Step 1: Up and Running

* GET all messages at /chat route
* POST a message to /chat
* Use the Heroku instance we will deploy during class

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

## Step 3: Refresh Messages

* Implement a `<button>` to fetch new messages
  * if you're using the source code template, this is already implemented

## Step 4: Poll for new messages every 10 seconds

Tech:

* use `setInterval` or `setTimeout`

## Step 5: Names

Client: Add an `author` field to the "submit message" form.

Server: Process this `author` parameter and save it in the message.

More client: Make sure the client UI displays the name as well as the body of each message.

Extra credit: store the name in a cookie so the user doesn't have to keep typing it

## Step 6: Rooms

Change stuff around so `/chat/1` sends a message to room number 1.

What is a room? Why is it number 1? TBD in a design session.

#### Any message sent to /chat displays in the Main room

  * Message should be displayed with the `author` and `created_at`
  * Should there be a maximum message length/size?

## Backlog

  * Handle scrolling back through older messages
  * Persistence (after server restart)

