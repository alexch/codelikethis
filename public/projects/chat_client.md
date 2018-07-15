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

* GET accepts a parameter `since`
* Create a variable `lastMessageWhen`
* When you receive a list of messages, set `lastMessageWhen` to the *most recent* message time
* When you request a list of messages, add `since` to the request

#### 

  * Implement in a `<button>` to fetch new messages

#### Poll for new messages every 10 seconds

  * Implement in a `<button>` to fetch new messages

#### Large message list + paging messages

  * Handle scrolling back through older messages

### POST messages to /chat

#### Any message sent to /chat displays in the Main room

  * Message should be displayed with the `author` and `created_at`
  * Should there be a maximum message length/size?
