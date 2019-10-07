# Chat

The goal is to write the *client and server* for a simple web based chat application.

Use the [Blog lesson](/lessons/server_side_javascript/blog) for inspiration and sample code (but please keep the *copypasta* to a minimum).

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

Can be represented as a JSON object in a POST body or as a query string on GET requests

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

## Routes (with a single default room)

| Route        | Input                                    | Output                 |
|--------------|------------------------------------------|------------------------|
| `GET /`      | nothing                                  | HTML: main page        |
| `GET /chat`  | since= [optional]                        | JSON: list of messages |
| `POST /chat` | body= [required] <br> author= [optional] | JSON: list of messages |

## Object Model

Based on the metaphor of a "chat room", here is an object model to use on the server.

First, create three files:

`lib/message.js`:

```javascript
// a message has a sender, a time, and a body
module.exports = class Message {

}
```

`lib/room.js`:

```javascript
// a room contains messages, in chronological order
module.exports = class Room {

}
```

`lib/house.js`:

```javascript
// a chat house contains chat rooms
module.exports = class House {

}
```

When implementing a feature, consider which object should have that responsibility.

For example, the responsibility of listing all rooms *should* be on the house, not on an individual room.

Remember that it's possible to refactor to classes. If your code looks like this:

```javascript
function sendChatMessages(roomId, since, response) {
  let messages = rooms[roomId].messages;
  messages = messagesSince(messages, since);
  let data = JSON.stringify(messages);
  response.type('application/json').send(data);
}
```

then it could look like this after:

```javascript
function sendChatMessages(roomId, since, response) {
  let room = house.roomWithId(roomId);
  let messages = room.messagesSince(since);
  let data = JSON.stringify(messages);
  response.type('application/json').send(data);
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

### Tech:

* on the server, write code for the `POST` route
* on the client, write code to 
  * grab the data from the form
  * send it to the server
  * receive a list of messages in the response
  * put the messages in the chat room text area 

<!--/BOX-->

<!--BOX-->

## Recent Messages

**Given** a set of messages in the recent past

**When** a user clicks the Refresh button

**Then** their client adds a `since` parameter to the GET request

**And** only messages that were sent since then are returned

#### Tech:

Server-side:

* every GET accepts a parameter `since`
* if no `since` is specified, it sends *all* messages

Client-side:

* Create a variable named something like `latestMessageAt`
* When you receive a list of messages, set `latestMessageAt` to the *most recent* message time
* When you request a list of messages, add `since` to the request

> Q: should you log the time the message was *sent* or the time you *received* it? Does it matter?

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

## Validation

**Given** an incoming message

**When** the message body is more than 500 characters long

**Then** the message is rejected

**And** the user sees an error message

<!--/BOX-->

<!--BOX-->

## Rooms

Instead of the single Main room, enable a few different rooms that are always available, so

  * `GET /chat/rooms/dogs` gets all messages from the room whose id is "`dogs`".
  * `POST /chat/rooms/dogs` sends a message to that room

**Given** a room named Dogs

**When** a user is in the Dogs room, and submits a post

**Then** the message will appear in Dogs

**And** not in the Main room, but any message sent to /chat will still work, displayed in the Main room.

**And** The client should show a list of all available rooms, either in a popup menu or a scrolling list.

<!--/BOX-->


# Icebox

  * Build a beautiful, usable, responsive front end
    * possibly in React
  * Handle scrolling back through older messages (like Slack)
  * Persistence (after server restart)
  * [Socket.io](https://socket.io/) is a Node library that provides real-time asynchronous publish-and-subscribe messaging using [WebSockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API).
    * Implement a Web Sockets API instead of polling.
    * with Web Sockets, add "Someone is typing..." transient notifications
