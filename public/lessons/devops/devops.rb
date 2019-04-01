require "track"

require_relative '../../../lib/link.rb' # :-(

Track::Devops = Track.new(
    name: "devops",
    description: "DevOps comprises a series of practices and tools that help bring operations -- meaning revision control, server management, deployment, testing, monitoring, etc. -- into the hands of developers, while still maintaining communication and cooperation with dedicated ops experts and network managers."
) do
  # "the student will learn..."
  goal name: "all about devops :-)"

  lesson name: "intro"

  project name: "hello_bottle"

  lesson name: "the_twelve_factors",
         description: "Originally created at Heroku, the Twelve Factor Architecture provides a foundation for an application deployment architecture that supports rapid deployment, scalability, clustering, and other DevOps practices. You may choose to use some or all of the factors, or devise your own, but understanding the reasoning behind the Twelve Factors is an important prerequisite before making your own decisions."

  lesson name: "vagrant_overview",
         description: "Vagrant is a tool that 'leverages a declarative configuration file which describes all your software requirements, packages, operating system configuration, users, and more.' It has a very useable CLI and is a great first step towards normalizing your various workstation and production environments." do
    link href: "https://www.vagrantup.com/"
    project name: "hello_vagrant",
            description: "install a virtual machine; use Vagrant to configure it so other developers (or you on a different machine) can replicate the setup; connect to it using ssh; share your config using git and github"
  end


  lesson name: "docker_overview"
  project name: "hello_docker", description: "Run a Python Web App (Hello World / Hello Bottle) in a Docker Container" do
    # Use a dotenv file
    # Use “heroku local” first
    # Then via “docker run”
    link href: "https://devcenter.heroku.com/articles/container-registry-and-runtime#testing-an-image-locally"
    link href: "https://devcenter.heroku.com/articles/local-development-with-docker-compose"
    # then Lab: Push your Docker Container (web only)
    link href: "https://devcenter.heroku.com/articles/local-development-with-docker-compose#pushing-your-containers-to-heroku"
    link href: "https://devcenter.heroku.com/articles/container-registry-and-runtime#building-and-pushing-image-s"
    # (Alpine Python Flask Example" git:  https://github.com/heroku/alpinehelloworld )
  end

  link href: "http://www.pidramble.com/"

end
