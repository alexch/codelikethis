# Sessions

> TERM OVERLAP ALERT

the term "session" is *very* overused

in this case we are using it to describe
 
  * short-lived data
  * about a single user's interactions with a web site
  * from a single browser or device
  * keyed off a cookie
  * stored on the server-side
  * usually cleared out after a few hours or weeks

https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies

# Algorithm

* Server-side:
  * if the request has a session cookie
    * then look up the session data
    * else create a new session
  * when the user does something interesting -- say, adds something to their shopping cart
    * then add it to the session data
    * no need to change the cookie!
  * when the response is sent
    * `Set-Cookie: sessionKey=xxx`
    * where `xxx` is the *key* for that session

# Key Choice

* When choosing keys (i.e. the actual value of the cookie)...
* What if we used a sequence of integers (1, then 2, then 3...)?

# Guessable Keys are bad

* If the key is guessable, then anyone can just guess a number and see someone else's shopping cart!
* Solution: use one-way asymmetric encryption
  * `SHA256` is probably okay
  * but check with experts first
* Then use the key as an index into a data store

`crypto` is built in to nodejs: 

https://nodejs.org/api/crypto.html#crypto_crypto

```
const crypto = require('crypto');
const secret = 'abcdefg';
let hash = crypto.createHmac('sha256', secret)
                 .update('session-101')
                 .digest('hex');
console.log(hash);
```

> "HMAC" means "hash-based message authentication code"


# Server Session Limitations

* probably don't want to store it in RAM, since your web server might be *scaled* (i.e. running on several different servers) so successive requests might go to different web server instances

* your server needs to maintain the storage for an unknown number of users
  * so you should figure out an *expiration* strategy if you don't want your database to fill up

# Sample Code

* in RAM
* in Files
* in Mongo
