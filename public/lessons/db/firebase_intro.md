# Firebase

Firebase is a full backend framework designed by Google

* Robust free tier
* Authentication made easy
* Built in databases
* Part of the Google Ecosystem
* Scaleable

# Getting Started with Firebase

Already have a google account?  Perfect!

Setting up a Firebase project is easy. Just visit [the main Firebase homepage](https://firebase.google.com/) click the button that says "Get Started" and then "Create Project"

* Give your project a name
* Accept the terms & conditions, then hit "Continue"
  * On the next page it will ask if you want Google analytics for your app. Your choice.

* Accept all applicable terms & conditions, and Continue

> Congratulations! You now have a Firebase App!

# Your App's Dashboard

The Dashboard is the control room, from which you can modify your application.

* Develop -Tools, and services to integrate with web aplications
* Quality -For testing, and customer support channels
* Analytics
* Grow -A variety of predictive, and market research services

# Authentication

User authentication tends to be very hard, and comes in several flavors.

* Logging in with credentials
* OAuth Login

Firebase supports both credential based login (username/password) and OAuth integration, and makes user authentication relatively easy.

# Database

Firebase provides two databases the Real Time Database, and Cloud FireStore.

* The RTDB is Firebases original database system
* ForeStore is a newer system
* Both are noSQL, document databases
* Both are scalable, effecient, and have a decent free tier
* They have provided a [handy survey](https://firebase.google.com/docs/database/rtdb-vs-firestore) to determine which database best fits your needs

# Storage

* The storage section is another way to store files for your app. It's generally used as more of a CDN than a Database
* Store files, such as images, audio, video, or even JS here so you don't need to store it in your web app's file system
* Raw data should still be stored in a dedicated database

# Hosting

You can also host your webapps through Firebase.
Deploy using the Firebase CLI

# The Firebase CLI

The Firebase CLI allows you to connect to, and interact with your Firebase application from your local terminal.

While there are installers available it's recommended that you install using npm: `npm install -g firebase-tools`

* To use the CLI you will first need be in the root directory of the app you want to connect to firebase `cd my-firebase-project`
* to log in to your firebase account (probably just your google account) `firebase login`
* Then initialize your project as a firebase project `firebase init`
* Make sure all static files (HTML, CSS, etc.) are in your "deploy directory." By default Firebase assumes this is named `public`
* Save and deploy your site to Firebase `firebase deploy`
* Profit

# The Firebase CLI continued

The Firebase CLI can be used to do more than just deploy apps

* Check status of all deployed apps
* Run tests on deployed apps
* Modify app behaviour
* Read app, and user data

# firebase.json

The `firebase.json` file is generated automatically, and tracks the settings for your firebase app. If you have static files in a `public` subdirectory the default setup will work.

The value of the `public` property in the `hosting` section of the file is the location Firebase's hosting service will attempt to serve files from.

# Functions

The functions section allows you to add scripts, and listeners to your Firebase application so that it can have the functionality of a full server, without having to actually set up a server file.

# Machine Learning

The ML Kit for Firebase provides integration for other Google Machine Learning technologies so you can bring the power of artificial intelligence to your app.

# Firebase as a service

While you can create an app that will live, and work entirely within Firebase it is quite common to create an external app, hosted elsewhere, and connect it to Firebase on the back end to utilize some of the tools avalable in Firebase.

# Connecting to Firebase from the Outside

[Firebase Documentation](https://firebase.google.com/docs/web/setup#node.js-apps)

# The Google Ecosystem

Firebase is developed, and maintained by Google.  As such it is part of the Google ecosystem.

What this means for us is that Firebase will work with other Google services with no setup, or minimal setup needed.

Setting up OAuth authentication with Google Login is a breeze with Firebase, though other OAuth providers, such as GitHub, might require a more complex setup.

# Why Firebase (or why not)?

# Lab: Configuring your App to work with Firebase

* Create a new directory, `cd` into it, and initialize it: `npm init -y`
* Install express, and firebase `npm install express firebase`
* Setup a new firebase app. Don't worry about tweaking any of the settings just yet
* Go back to VSCode, and create a simple server using express
* Link your server to your firebase app
  * You may find [their documentation](https://firebase.google.com/docs/web/setup) helpful.

* Test out the connection by creating a new user with email and password. The following code snippet assumes you set your initialized firebase app to a variable called firebaseApp:
> `firebaseApp.auth().createUserWithEmailAndPassword(email, password)`

* Visit your firebase dashboard and check the Authentication section to make sure your new user has been created
