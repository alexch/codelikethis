# Chat

The goal is to write the *client and server* for a simple web based chat application, and to store messages on a MongoDB database hosted on an Atlas Cluster

## Wireframe

This wireframe is meant to give you a rough idea of the necessary user interace elements. Use your own imagination to design the placement and look of panels and buttons.

```
Hi, alex!

        Main Room               All Rooms
/--------------------------\  /-----------------\
|                          |  | Main            |
|                          |  | Dogs            |
| alex: hi                 |  | Debugging       |
| abby: woof               |  \-----------------/
\--------------------------/
/------------------------\  /------\  /---------\
| good mor|              |  | Send |  | Refresh |
\------------------------/  \------/  \---------/
```

## Message Schema

Can be represented as a JSON object in a POST body

| name | format | details |
|--------|--------|---------|
| when   | Date (in [ISO8601](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString) format) | the moment the message was sent |
| body   | String (max 500 characters)  | the content of the message |
| author | String (max 100 characters)  | the username of the message sender |

e.g.
```json
{
  "when": "2018-07-15T20:00:47.696Z",
  "author": "alex",
  "body": "my dog has fleas"
}
```


# Stories

<!--BOX-->

## Send And Receive

**Given** an empty chat room

**When** a user types their name into the `username` field

**And** types a message into the `message` field

**And** clicks the "Send" button

**Then** the message appears in the chat room (including the username, e.g. `alex: good morning`

**And** is written to your Mongo DataBase

### Tech:

* on the server, write code for the `POST` route
  * grab the data from the form
  * send it to the data-store
* on the client, write code to 
  * receive a list of messages in the response
  * put the messages in the chat room text area
    * You may want to use the `useEffect` `useState` hooks for this

<!--/BOX-->

<!--BOX-->

## Poll for new messages every 10 seconds

**Given** a new message is sent

**Then** the client will see it in less than 10 seconds (without clicking Refresh)

### Tech:

* use [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval) or [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setTimeout)

<!--/BOX-->

<!--BOX-->

## Names

Client: Add an `author` field to the "submit message" form.

Server: Process this `author` parameter and save it in the message.

More client: Make sure the client UI displays the name as well as the body of each message.

Extra credit: store the name in a cookie so the user doesn't have to keep typing it

Message should be displayed with the `author` and `created_at`

<!--/BOX-->

<!--BOX-->

## Rooms

Instead of the single Main room, enable a few different rooms that are always available, so

  * `GET /chat/rooms/dogs` gets all messages from the room whose id is "`dogs`".
  * `POST /chat/rooms/dogs` sends a message to that room

**Given** a room named Dogs

**When** a user is in the Dogs room

**And** submits a post

**Then** the message will appear in Dogs

**And** not in the Main room, but any message sent to /chat will still work, displayed in the Main room.

**And** The client should show a list of all available rooms, either in a popup menu or a scrolling list.

<!--/BOX-->

# Icebox

  * Handle scrolling back through older messages (like Slack)
  * Validation - when a message exceeds 500 characters in it's body, it should be rejected, and not sent to the database  
