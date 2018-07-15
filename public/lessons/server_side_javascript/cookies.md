# Cookies

a *cookie* is a piece of data

that is *set* by the web server

but is *stored* by the web client

which *sends it back* to the server on *every request*

https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies

# Cookie Uses

* tracking users (of the same browser) across time
* storing data without allocating server space
* usually used as a *key* to a larger per-user server-side storage
  * aka "session" (yet another meaning)
* an early version of LocalStorage

# Cookie Limitations

* not very secure
  * can be encrypted
  * can be specified "httponly" or "secure"
* not a lot of bytes
* cross-origin limitations
  * the server specifies which other domains/hosts/sites to share this cookie with
  * but the client can restrict it further
* user can erase them at any time

# Cookie Headers

* response: `Set-Cookie: ice_cream=chocolate`
* request: `Cookie: ice_cream=chocolate; fruit=banana`

# `Set-Cookie` Header

* set on the server *response* to the client
* asks the client to *create* or *modify* a cookie for this
* `name=value`, plus other *options* for this cookie separated by `;`s

# `Cookie` Header

* set on the client *request* to the server
* tells the server "here are *all* the cookies I know about for you"
* `name=value` pairs separated by `;`s

# Fetch API vs Cookies

the Fetch API [does not always send cookies](https://developer.mozilla.org/en-US/docs/Web/API/Request/credentials)

(it's part of "same origin policy")

to send them you need to set `credentials: 'include'` like this:

```
fetch('/articles.json', {credentials: 'include'})
  .then(
```

# Sample Code

`cookie_counter.js`

