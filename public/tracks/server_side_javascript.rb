require "track"

class Track
  ServerSideJavascript = Track.new(
    name: "server_side_javascript",
    display_name: "Server-Side JavaScript",
    description: "Create web application servers using JavaScript.",
    ) do
    # "the student will learn..."
    goal "how to create a self-contained server-side web application using NodeJS"
    goal "how to deploy NodeJS applications to Heroku"
    goal "etc."
    # "how to deploy NodeJS applications to Amazon AWS Elastic Beanstalk", https://aws.amazon.com/getting-started/projects/deploy-nodejs-web-app/
    # "how to deploy NodeJS applications using Glitch",


    # should these all go into an HTTP or WWW lesson?
    lesson name: "HTTP Headers"
    lesson name: "routing"
    lesson name: "state", description: "An overview of state in web applications" #definitions: transient vs persistent, local vs remote, etc. .. plus a definition/diagram of each of the following half-dozen state types
    lesson name: "parameters", display_name: "CGI and Parameters"
    lesson name: "forms"
    lesson name: "uploads" # forms, server store, cloud store, plugins  -- optional?
    lesson name: "cookies", display_name: "State: Cookies"
    lesson name: "sessions", display_name: "State: Sessions"
    lesson name: "files", display_name: "State: Files"
    lesson name: "databases", display_name: "State: Databases"


    lesson name: "mongodb" do
      link href: "http://mongoosejs.com/", name: "mongoose",
           description: "mongodb object modeling for node.js"
    end

    lesson name: "SQL" do
      link href: 'http://docs.sequelizejs.com/',
           name: 'Sequelize',
           description: 'a promise-based Object-Relational Mapper for Node.js'
    end

    lesson name: "MVC"
    lesson name: "NodeJS"
    lesson name: "Express"
    lesson name: "calling_apis"

    lesson name: "security_overview" # id vs auth, login/logout, XSS etc?
    lesson name: "login_and_logout"
    lesson name: "oauth"

    lesson name: "using_apis"
    lesson name: "bots" do # todo: project: build a Slack Bot
      link href: "https://medium.com/glitch/when-good-bots-go-bad-4007a2b2f41e"
    end

    lesson name: "building_apis"

    lesson name: "server_side_security" #

  end
end
