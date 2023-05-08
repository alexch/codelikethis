# Overview
Passport boasts "simple, unobtrusive authentication for Node.js."

What this actually means is that, with relatively minimal housekeeping, one can create authentication *middleware* (remember middleware?) that handles the request from the client and, based on how the authentication process goes, grant or deny access!

- Offers 100s of *strategies*
- Configurable auth requirements.
- Highly modular.

# Basics
Passport's conventions are based on defining and utilizes the previously mentioned strategies. And, as mentioned, there are a lot. [See for yourself](http://www.passportjs.org/packages/)

These *strategies*, while plentiful, do share some similarities. They all need to be installed and configured via the `.use()` method on the `passport` instance. 

For this example, we will be utilizing the `passport-jwt` (JSON Web Token) and Postman to simulate requests. We'll create a token and include it in the header of subsequent requests to authorize the user to access certain areas. 

Be sure you have a working instance of Postman!

# Configuration
Three pieces are needed to properly configure Pasport for authentication:

- Authentication strategies
- Application middleware
- sessions (optional)

Before asking Passport to authenticate a request, the strategy (or strategies) used by an app has to be set up

These are provided by Passport depending on the module/package installed.


Note the `done` callback function is called a *verify callback*. It's job is to find the user that matches the given credentials.  In this case, the "credentials" are an `_id` contained in the expected token, which will be used to query the database to return the user! 

`User.findOne()` represents a yet-to-be-defined model that searches a `users` collection.

# Middleware
In Express, `passport.intialize()` is used for basic implementation of passport.  Like most middleware in express, that will look like this:

```javascript
app.use(passport.intialize())
```

If your app is using persistent sessions you would also need:

```javascript
app.use(passport.session())
```


# Lab: Postman it!
In this lab you will be provided with a basic server that, when setup properly, will redirect to a user dashboard when the JWT is properly verified. 

Clone down the following repository run `npm install` to bring in the proper packages.

https://github.com/pphelps28/postman-passport-lab

Run `server.js` once with the code as is to create a collection on your local machine that contains a mock user,then remove the indicated line to ensure no duplicates are written to the database.


# Setup
Under *passport setup*, add the following:

```javascript
const jsonwebtoken = require('jsonwebtoken')
const JwtStrategy = require('passport-jwt').Strategy
const passport = require('passport')
const ExtractJwt = require('passport-jwt').ExtractJwt

app.use(passport.initialize())
```
These are the modules used to enforce the authentication strategies *and* intialize passport as express middleware

# Defining Strategies
Now, let's set up the JWT strategy itself, so when we use it as middleware, it knows how to handle the request.

```javascript
const opts = {
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: 'secret'
}
passport.use(new JwtStrategy(opts, function (jwt_payload, done) {
    User.findOne({ _id: jwt_payload.sub }, function (err, user) {
        if (err) {
            return done(err, false);
        }
        if (user) {
            return done(null, user);
        } else {
            return done(null, false);
            // or you could create a new account
        }
    });
}));
```
This says: 

- I expect a JSON Web Token  
- I expect it to have an `_id` property
- I will use this `_id` to find the user from the `User` model
- If there is a `user`, I will return them so they are available for the response
- By adding the `jwtFromRequest` option, I expect the JWT to be in the header in the form of a Bearer Token

# Issuing a Token
Let's write a function that will build and sign a JWT and sent it back to the user if the `user` and `password` are correct.

```javascript
function issueJWT(user) {
    const _id = user._id;
    const expiresIn = '1d';
    const payload = {
        sub: _id,
        iat: Date.now()
    };
    const signedToken = jsonwebtoken.sign(payload, 'secret', { expiresIn: expiresIn });
    return {
        token: signedToken,
        expires: expiresIn
    }
}
```

# Logging In
Let's say we have a simple form, with `user` and `password` sent to `/login` via `POST` method. The following checks the database to see if the user and password are correct, and issues a token if they are.

```javascript
app.post('/login', (req, res, next)=>{
    User.findOne({user:req.body.user}).then(user=>{
        if(!user){
            res.status(401).json({success:false, msg:"no user found!"})
        }
            /*BEST PRACTICE: user.password should be encrypted in the database, 
            and compared with bcrypt or other trusted encryption libraries*/

            const isValid = (req.body.password === user.password) // => equates to Boolean

            if(isValid){
                // remember, issueJWT returns an object of our design, with a 'token'
                const tokenObject = issueJWT(user)
                res.status(200).json({success:true, token:tokenObject.token, expiresIn: tokenObject.expires})
            } else{
                res.status(401).json({ success: false, msg: "you entered the wrong password" })
            }

    }).catch((err)=>{
        next(err)
    })
} )
```

# Authentication Middleware
Now, we need to add a route to check the (presumably saved) JWT coming back from the browser!

After all that setup, this is where it finally starts looking like middleware!

```javascript
app.get('/dashboard', passport.authenticate('jwt', { session: false }),
    (req, res) => {
        res.status(200).json({ success: true, msg: "Success!!!" })
    })

})
```

And that should be all of the setup needed!

# See it in Postman
On the CLI, run your server with `node server.js`

Then open Postman, and run a POST request to `/login` with `{user:'user', password: 'password'}` in the body. 

Hit send.

In Postman, it should look something like this:

![Postman-login](/images/Postman-login.png)


# See it in Postman, cont.
Copy the `token` from the JSON response, and make a GET request to `/dashboard` and set your token as a *Bearer token* in the "Authentication" tab

That will look something like this:

![Postman-dashboard](/images/Postman-dashboard.png)

SUCCESS!!! We have effectively created a JSON Web Token, and used it to authenticate a using Passport authentication as middleware.

# Great! But What About Outside of Postman?

Unfortunately the code we just wrote won't work in a real world environment

It relies on 
