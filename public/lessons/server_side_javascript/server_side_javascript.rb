require "track"

class Track
  ServerSideJavascript = Track.new(
    name: "server_side_javascript",
    display_name: "Server-Side Coding with JavaScript",
    description: "Once you know the use of JavaScript as a command-line language, you can use it to create web application servers (aka \"web apps\"). First ",
    ) do
    # "the student will learn..."
    goal "the rules of the HTTP protocol"
    goal "how to create a self-contained server-side web application using NodeJS"
    goal "how to deploy NodeJS applications to Heroku"
    goal "how to pass state from the client to the server and back again"

    # "how to deploy NodeJS applications to Amazon AWS Elastic Beanstalk", https://aws.amazon.com/getting-started/projects/deploy-nodejs-web-app/
    # "how to deploy NodeJS applications using Glitch",
    goal "how to use MongoDB to save state between user sessions"
    goal "the basics of authentication and web security"
    goal "how to extend your application's functionality by calling APIs"
    goal "how to streamline and codify your application with an API of its own"

    lesson name: "hello_node"

    lesson name: "http"
    lesson name: "http_server", description: "codealong walkthrough, building a simple file server in NodeJS"

    lesson name: "/www/forms"
    lesson name: "forms_and_parameters"

    lesson name: "routing"

    # lesson name: "state",
    #        description: "An overview of state in web applications" #definitions: transient vs persistent, local vs remote, etc. .. plus a definition/diagram of each of the following half-dozen state types

    lesson name: "cookies", display_name: "State: Cookies"
    lesson name: "sessions", display_name: "State: Sessions"
    lesson name: "/db/overview", display_name: "State: Databases",
           description: "Databases are very powerful, but they can also be very simple. For this lesson we will explore using a database to save a 'blob' of JavaScript data by name, then using that name to retrieve the blob later. We'll be using a 'NoSQL' document database (MongoDB or Firebase) but you can use these techniques with a relational (SQL) database as well."
    lesson name: "sessions_with_mongo"


    lesson name: "uploads", display_name: "State: Uploads" # forms, server store, cloud store, plugins  -- optional?

    lesson name: "express", description: "Express is a web framework for Node.js, adding features like middleware and routing to the barebones Node.js"

    lesson name: "security_overview" # id vs auth, login/logout, XSS etc?
    lesson name: "login_and_logout" # passport.js? http://www.passportjs.org/ https://github.com/jaredhanson/passport-local
    lesson name: "oauth"

    lesson name: "calling_apis"
    lesson name: "bots" do # todo: project: build a Slack Bot
      link href: "https://medium.com/glitch/when-good-bots-go-bad-4007a2b2f41e"
    end
    lesson name: "building_apis"

  end
end
