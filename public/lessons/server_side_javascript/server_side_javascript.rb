require "track"

class Track
  ServerSideJavascript = Track.new(
    name: "server_side_javascript",
    display_name: "Server-Side Coding with JavaScript",
    description: "Once you know the use of JavaScript as a command-line language, you can use it to create web application servers (aka \"web apps\"). First ",
    ) do

    # "the student will learn..."
    goal name: "the rules of the HTTP protocol"
    goal name: "how to create a self-contained server-side web application using NodeJS"
    goal name: "how to deploy NodeJS applications to Heroku"
    goal name: "how to pass state from the client to the server and back again"


    # "how to deploy NodeJS applications to Amazon AWS Elastic Beanstalk", https://aws.amazon.com/getting-started/projects/deploy-nodejs-web-app/
    # "how to deploy NodeJS applications using Glitch",
    goal name: "how to use MongoDB to save state between user sessions"
    goal name: "the basics of authentication and web security"
    goal name: "how to extend your application's functionality by calling APIs"
    goal name: "how to streamline and codify your application with an API of its own"

    lesson name: "intro_to_server_side_js"  
      
    lesson name: "hello_node"

    lesson name: "hello_express"

    lesson name: "/www/http"

    lesson name: "client_vs_server_js"

    lesson name: '/www/urls'

    lesson name: "serving_files", description: "building a simple file server in Express/NodeJS" do
      topic name: "require"
      topic name: "http"
      topic name: "servers"
      topic name: "local-server"
      topic name: "telnet"
      topic name: "get-requests"
      topic name: "headers"
      topic name: "html"
      topic name: "requests"
      topic name: "ports"
      topic name: "try-catch"
      topic name: "url"
      topic name: "path"
      topic name: "mime-types"
    end

    lesson name: "/javascript/json"

    lesson name: "/www/forms" do
      topic name: "forms"
      topic name: "html"
      topic name: "http"
      topic name: "event-handlers"
      topic name: "get-request"
      topic name: "post-request"
    end

    lesson name: "parameters" do
      topic name: "get-request"
      topic name: "post-request"
      topic name: "http-methods"
      topic name: "query-parameters"
    end

    lesson name: "routing" do
      topic name: "routing"
      topic name: "servers"
      topic name: "state"
      topic name: "saving-state"
      topic name: "url"
      topic name: "path-parameters"
      topic name: "requests"
      topic name: "parsing"
      topic name: "http"
      topic name: "http-methods"
    end

    lesson name: "blog",
           description: "codealong walkthrough, building a blog server by adding routes and form submission to the core Express server" do
      topic name: "servers"
      topic name: "state"
      topic name: "saving-state"
      topic name: "apis"
      topic name: "fetch"
      topic name: "dom-manipulation"
      topic name: "path"
      topic name: "url"
      topic name: "path-parameters"
      topic name: "query-parameters"
      topic name: "requests"
      topic name: "request-response-cycle"
      topic name: "http"
      topic name: "http-methods"
    end

    # todo:
    # lesson name: "state",
    #        description: "An overview of state in web applications" #definitions: transient vs persistent, local vs remote, etc. .. plus a definition/diagram of each of the following half-dozen state types

    lesson name: "cookies", display_name: "State: Cookies" do
      topic name: "cookies"
      topic name: "requests"
      topic name: "get-requests"
      topic name: "state"
      topic name: "fetch"
      topic name: "cookie-headers"
      topic name: "client"
      topic name: "client-side-javascript"

    end

    lesson name: "saving_state_in_files", display_name: "State: Files" do
      topic name: "state"
      topic name: "saving-state"
      topic name: "apis"
      topic name: "node"
      topic name: "parameters"
      topic name: "post-request"
    end


  end
end
