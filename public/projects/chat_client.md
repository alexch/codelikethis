# Chat Client

We are running a chat server; build and run the client

## Message Schema

Can be represented as a JSON object in a POST body or as a query string on GET requests

* DateTime
* Content
* Author

## Features

### GET messages at /chat route

#### First visit responds with ALL messages

  * What about really a large message history?

#### Return visits responds with messages since last visit

  * Implement in a `<button>` to fetch new messages

#### Poll for new messages every 10 seconds

  * Implement in a `<button>` to fetch new messages

#### Large message list + paging messages

  * Handle scrolling back through older messages

### POST messages to /chat

#### Any message sent to /chat displays in the Main room

  * Message should be displayed with the `author` and `created_at`
  * Should there be a maximum message length/size?
