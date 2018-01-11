require "course"

class Course
  ServerSideJavascript = Course.new(
      name: "server_side_javascript",
      display_name: "Server-Side JavaScript",
      abstract: "Create web application servers using JavaScript.",
      goals: [ # "the student will learn..."
        "how to create a self-contained server-side web application using NodeJS",
        "how to deploy NodeJS applications to Heroku",
        # "how to deploy NodeJS applications to Amazon AWS Elastic Beanstalk", https://aws.amazon.com/getting-started/projects/deploy-nodejs-web-app/
        # "how to deploy NodeJS applications using Glitch",
        ""
      ]
  ) do

  end
end
