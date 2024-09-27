# Authentication

Authentication can be tricky. Information is a hot commodity.

Let's save ourselves a headache and use a third part service handle it.

Google's a good choice. They've already got all of our data anyway, so if they get hacked we're **all** screwed!

# Why Authenticate?

* Restrict access
* Save user data
* Track site use
* Provide a customized experience

# Barriers to Entry

* How hard is it to get into your site?
* How hard should it be?
* What parts of the site are accessible to which users?

# Authentication with Firebase

Firebase makes authentication very easy. They have a variety of different methods availiable for logging in, and provide integration for other services' authorization methods as well.

Not only that, but [their documentation](https://firebase.google.com/docs/auth) is extremely thorough.

# Email/Password Login

Enable 'Email and Password' in the Sign-in Method tab under Authentication in your Firebase app.

* Get the user's email and password from your front end (probably through a form)
* Pass the email and password to Firebase's login method:

```js
firebase.auth().createUserWithEmailAndPassword(email, password)
```

> This method will return a promise that will eventually resolve to the full user object

# Logging in with Google

* Enable in Firebase
* Set up the google auth provider where you initialized your firebase app
  * > `const googleProvider = new firebase.auth.GoogleAuthProvider();`

* Use the `.signInWithPopup` method on your firebase auth object passing the provider as an argument
  * > `firebaseApp.auth().signWithPopup(googleProvider)`

* This should probably be done as the response to some event (e.g. a button being clicked)

# Lab: Setting up a Login Page

* Go back to the app we set up in the "Configuring your App to work with Firebase" lab
* Build a front end that allows you to:
  * login with email and password
  * login with Google

* and then redirect to a personalized user dashboard
* celebrate

# Logging in with Other Providers

Logging in with other providers is trickier since you are reaching outside the Google ecosystem. In most cases you need to set up an OAuth application with the auth provider as well (e.g. GitHub, Facebook, Yahoo, etc.) and link that to both your web application and  firebase.

# Firebase Roles

Firebase has several ways to handle users with different roles.

Regardless of which  method you use to assign user roles you will need to set up some rules for accessing (or restricting access to) your database.

# Real Time Database Rules

You can set up rules for who can read from, or write to different sections of the database under the "rules" tab of your database.

* Rules are setup in a JSON like format mimicing the structure of your database
* Keys appended with a `$` represent variables
* if `.read` is set to true the user has view access to that section of the database
* if `.write` is set to true the user has edit access to that section
* You can access other sections of the database throught the `root` keyword which brings you to the top level of the database
  * and using the `.child('someSection')` to reference `someSection` of your database

* All values in rules must be either booleans, or strings
  * but you can write JS expressions as strings, and Firebase will interpret them.

# User Access

```json
{
  "rules": {
    "users": {
      "$user": {
        ".read": "$user === auth.uid",
        ".write": "$user === auth.uid"
      }
    }
  }
}
```

> This ruleset allows a user to read and write to a custom section of the database (the key is their user ID) and restricts them from accessing any other sections of the database.

# Database Methods

* All database methods are chained off the database object
  * You can initialize the database object with `firebasApp.database()`

* Once you connect to the database you will need to setup a reference to the section of the database you're interacting with
  * `database.ref('/users/' + userID)` would reference a specific user's section given the database structure from the previous slide.

* `.set(...)` passing a JavaScript object as the argument to adds entries to your database
* `.update(...)` passing a JavaScript object as the argument updates fields
* use the `.on(...)` event listener to read from the database
  * the first argument to `.on` should always be the string 'value'
  * the second argument is a callback function that determines what to do with that value



# Lab: Set up an Admin User

* Going back to the Firebase app we've been building up let's assign one user as an administrator
* When the administrator signs in they should see a list of all the users in the app
  * and be able to delete them from the app

* When a non-admin user signs in they should still only see their own information

# The User Object

Features:

- enforces one user per email
- tracks user data
- stored seperately from the database

Anti-Features:

- unalterable; create, read, and delete only
- super big and hard to parse

# User Tokens

Firebase can be set up to generate authentication tokens when a user signs up.

If you want to generate tokens you will need to use the [Firebase Admin SDK](https://firebase.google.com/docs/admin/setup) instead of the standard Firebase SDK

Unlike the user object this token can be manipulated by your JavaScript application, and is a good place to store metadata for user accounts. The setup can be a bit tricky, so for only one or two levels of authentication it may be easier to hard code those rules into your database

[Official Documentation](https://firebase.google.com/docs/auth/admin/create-custom-tokens)

# Storing User Data

Setting up a section of the database to store user information is a good way to allow your end users to control their settings providing a customizable experience.

It's also a good way to track user data for use by adminstrators/moderators on your site.

# Lab: Extending the Dashboard

Let's extend our front end app some more!

* When a user logs in
  * if they haven't already chosen a favorite color display a form asking them to choose a color

* Once a color has been chosen the next time that user logs in the background of their dashboard should be that color
  * and they should no longer be asked to enter their favorite color
  * but there should be a button which opens a form allowing them to change the color
  