# Overview
Web security is a complex topic, the scope of which far surpasses this course.  With that in mind, there are a number of **key risks** to be mindful of.

Let's start with the OWASP (Open Web Application Security Project) top 10. 

This is a continually-updated list of the most prevalent and dangerous risks, as well as actionable steps to prevent them. 

[Link]((https://owasp.org/www-project-top-ten/)

Note how many of these involve proper *authentication*. This will be our main focus.


# Authentication

Authentication is the process of verifiying that an individual, entity or website is whom it claims to be.

Typically, this comes in the form of submitting a username or ID and one or more items of private information that only a given user should know.

- User IDs should be case-insensitive ('johnDoe' and 'JohnDoe' should be recognized as the same user) 
- User IDs should be unique
- For high-security applications, usernames should be assigned and secret, not user-defined public data

[Authentication Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)

# Session Management
A process by which a server maintains the state of an entity interacting with it. 

That state informs how a server will react to subsequent requests throughout the exchange.

- Maintained on the server by a *session identifier* 
- Should be unique per user
- Should be difficult to predict
- User data is stored on the server
- Only a unique `id` is stored in the browser (on a cookie)

[Session Cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)

# Tokens
Many web applications use a [JSON Web Token](https://jwt.io/) instead of using sessions.

From the JWT [site](https://jwt.io/introduction/):

**JWTs are a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed.**

Instead of the data being stored on the server, the server creates a JWT with a `secret`, a private key used to encrypt and decode the payload, and sends that to the client.

- Client stores the JWT, often in [`localStorage`](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

- Included in the *header* of every request
- Less resource-intensive on server
- Server validates the JWT with every `request`, and sends a `response` accordingly
- More frequent authentications than sessions
- Are *signed* by the server

# Lab: Visualizing JWTs
Let's see what a JWT looks like! Make a new directory `jwt-example`

```
mkdir jwt-example
cd jwt-example
npm init -y
npm install dotenv jsonwebtoken
```
Now, make a file name `jwt-example.js` and a separate `.env` file (for secrets). In `jwt-example.js`

```javascript
const jwt = require('jsonwebtoken')
require('dotenv').config() //allows reading of .env file 
```

# Visualizing JWTs, cont.
Next, add a *payload*, which contains the *claims*.  Claims are statements about an entity (normally the user) and additional data. 

**Remember, if it's on the front end, it can and will be seen! If you're sending sensitive information, be sure to encrypt it first! We'll be covering that next.**

```javascript
const payload = {
    "sub": "1234567890",
    "name": "John Doe",
    "admin": true
}
```
In your `.env` file, add a secret string that will be used in signing

```
SECRET_KEY=thisisasecret
```
and back in your `jwt-example.js`

```javascript
const signedJWT = jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: 2 })
console.log(signedJWT) // will show encrypted string

const verified = jwt.verify(signedJWT, process.env.SECRET_KEY)
console.log(verified) // will show unencrypted payload again! 
```

The `signedJWT` token we've created doesn't last long, however. That `expiresIn` property is in seconds.
Set a timeout to verify it again, and you'll see it's expired not 3 seconds later!

You'll also notice a new property, `iat`.  This is the the time the token was issued.

```javascript
setTimeout(() => console.log(jwt.verify(signedJWT, process.env.SECRET_KEY)), 3000)
```
# Encryption
*Encryption* is a way of scrambling data so that only authorized parties can understand the information (like JWTs!)

When dealing with passwords, say, stored in a database, it is good practice to store an encrypted version known as a *hash* instead of the literal string. Different server-side languages utilize their own encryption protocols, of which there are many.

*hashes* are created with a *salt*, or random data that is used to make the output (hash) unique, even for users that reuse their passwords.  

`Node.js` comes with a core module [`crypto`](https://nodejs.org/dist/latest-v12.x/docs/api/crypto.html#crypto_crypto) that will serve that general purpose, but a current standard resides elsewhere.

enter [`bcrypt`](https://www.npmjs.com/package/bcrypt)

# Lab: Hashing
Create a simple password, create a hashed version with `bcrypt`, and compare it that hash to the original!

Set it up:

```
mkdir bcrypt-example
cd bcrypt-example
npm init -y
npm i bcrypt
```
create a file called `encrypt.js` and include the following code:

```javascript
const bcrypt = require('bcrypt')
const saltRounds = 10
const plainTextPassword = 'password1234'
```

# Hashing, cont.
Now, let's take that `plainTextPassword` and *salt* it to return a *hash*, or encrypted string

```javascript
bcrypt.hash(plainTextPassword, saltRounds, (err, hash) => {
    console.log(`unhashed password: ${plainTextPassword}`)
    console.log(`hashed password: ${hash}`)
    //Store hashed password in DB here
})
```
Running this code should show you a before and after:

```javascript
unhashed password: password1234
hashed password: $2b$10$CbPOlQSQhFnz71CrS5h9M.t6IJBOtA3cQaDn/ams1IPTP0ffFPkaO
```

# Hashing, cont.
Now, after a password hash has been stored in your database, how would you compare it to a user's input?

`bcrypt` comes fully prepared to "undo" those multiple rounds of salt for you!
Simply run it through the `compare` method, like so:

```javascript
    // retrieve stored (and hashed) password from DB
    bcrypt.compare(plainTextPassword, hash, (err, result) => {
        console.log(`Password matches hash: ${result}`) // true
    })
```
The above code will need to be within the previous `hash` method, due to their asynchronous nature.

# Insights
Much like setting up servers, don't feel the need to reinvent the wheel.  There are many libraries and third-party resources to help take the guesswork out of proper authentication. 

Some provide a variety of approaches to authentication, like signing in/up through other services, like Google, Facebook, Github, etc. 

In the case of `Passport`, there are many, many options just like that.  To date, their documentation boasts over *500* strategies (what they call individual authentication modules).  