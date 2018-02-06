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


    lesson name: "HTTP Headers"
    lesson name: "State: CGI"
    lesson name: "State: Cookies"
    lesson name: "State: Sessions"
    lesson name: "State: Files"
    lesson name: "State: Databases"
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
    lesson name: "Routes"
    lesson name: "Calling_APIs"
    lesson name: "oauth"

    lesson name: "Bots" # todo: project: build a Slack Bot
    # link "https://medium.com/glitch/when-good-bots-go-bad-4007a2b2f41e"
    lesson name: "Building_APIs"

  end
end
