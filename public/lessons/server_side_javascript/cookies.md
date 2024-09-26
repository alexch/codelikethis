# Cookies

a *cookie* is a piece of data

that is *set* by the web server

but is *stored* by the web client

which *sends it back* to the server on *every request*

* Docs: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies
* Spec: https://tools.ietf.org/html/rfc6265

# Cookie Uses

* tracking users (of the same browser) across time
* storing data without allocating server space
* an early version of LocalStorage for storing arbitrary objects on the client

# Cookie Limitations

* not very secure
  * can be encrypted
  * can be specified "httponly" or "secure"
* not a lot of bytes
* cross-origin limitations
  * the server specifies which other domains/hosts/sites to share this cookie with
  * but the client can restrict it further
* user can erase them at any time

# Cookie Sessions

* cookie data on the client is 
      1. not very secure
      2. limited in size and format
      3. unstable (it might be deleted, or edited, at any moment)
    
* so a cookie is often used not to store data directly, but as a *key* to a larger, long-term server-side database or 

    * this is called a "session cookie" (yet another meaning of the term "session")

* often that key identifies a *currently logged-in user* with a lot of related long-lived database records

    * this is how web sites implement "Remember Me" login checkboxes


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

(it's part of "[same origin policy](https://www.w3.org/Security/wiki/Same_Origin_Policy)", enforcement of which is often draconian)

to send them you may need to set `credentials: 'include'` like this

```js
fetch('/articles.json', {credentials: 'include'})
  .then(
```

> WARNING: this is a **security hole** and you should only add `credentials: include` if you are having trouble getting cookies to work on `localhost`; don't do it in production unless you have a good reason.

# Express Cookie Code

In Express, the incoming request's `Cookie` header is available (via `request.headers.cookie`), but it isn't pretty. Like URL-encoded parameters, it has to be parsed before it's useful.

Fortunately, Express has a middleware component called [cookie-parser](https://www.npmjs.com/package/cookie-parser) that parses the `Cookie` header and puts all available cookies into an object at `request.cookies`.

```javascript
const express = require('express');
const cookieParser = require('cookie-parser');
const app = express();
app.use(cookieParser());
app.get('/', function(request, response) {
  console.log('Cookies: ', request.cookies)
})
```

To set a cookie, use the method [response.cookie()](https://expressjs.com/en/4x/api.html#res.cookie):

```javascript
response.cookie('cart', ['milk', 'cheese', 'dog food'])
```

Express will take care of encoding the value into JSON, and then URI-encoding that, to satisfy the arcane demands of the Cookie spec.

# Cookie Counter

For a more detailed example, 
[`cookie_counter.js`](https://github.com/BurlingtonCodeAcademy/cookie-counter
) is a simple one-route Express "hit counter" which increments a hit count 
on every request.

Run this...

```bash
git clone https://github.com/BurlingtonCodeAcademy/cookie-counter.git 
cd cookie-counter
npm install
npm start
```

...then visit <http://localhost:5000/cookie.html> to see it in action. (Keep reloading the page!)
