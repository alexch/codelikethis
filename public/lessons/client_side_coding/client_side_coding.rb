require "track"

class Track
  ClientSideCoding = Track.new(
      name: "client_side_coding",
      display_name: "Client-Side Coding with JavaScript",
      description: "Learn the data structures, coding patterns, and libraries that enable client-side coding in Web pages.",
      ) do

    # "the student will learn..."
    goal "the Document Object Model (DOM), a data structure that represents all the elements that describe how a web page looks and behaves"
    goal "how to use the jQuery library for event-driven actions and animations"
    goal "AJAX, the system for asynchronously transmitting data between client-side and server-side applications"
    goal "Web APIs such as Google Maps and Google Analytics which add sophisticated features to simple Web sites"

    project name: "pomodoro"
    project name: "tic_tac_toe"
    project name: "hangman"

    lesson name: "embedding",
           description: 'how to use Web APIs and embedded widgets to serve maps, videos, surveys, and other content from around the Web inside your own sites' do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/embedding-images-and-video"
    end

    project name: "geo_guesser"

    lesson name: "jquery" do
      link href: "http://docs.railsbridge.org/frontend/jquery"
      link href: "https://www.codecademy.com/tracks/jquery",
                name: "Codecademy Track for jQuery"
    end

    lesson name: "ajax" do
      project name: "github_emoji"
      project name: "github_repos"
    end

    lesson name: "calling_apis", 
      display_name: "Calling APIs from JavaScript", 
      description: "jQuery.ajax(), XMLHttpRequest, Fetch" do
        link href: 'https://www.codecademy.com/tracks/parse'
        link href: 'https://scotch.io/tutorials/how-to-use-the-javascript-fetch-api-to-get-data'
        link href: 'https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API'
        link href: 'https://www.npmjs.com/package/node-fetch'

      project name: "dothraki_translator"
      project name: "socket_chat"
      project name: "umbrella_today"
    end

    lesson name: "geolocation" do
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation"
    end

    # probably should move all these lessons to later tracks
 
    lesson name: "local_storage" do
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Storage"
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage"
    end

    lesson name: "canvas"
    lesson name: "svg"

    lesson name: "security" do
      link name: "XSS"
      link name: "CSRF"
      link href: "https://www.quora.com/What-is-the-difference-between-XSS-and-CSRF-from-their-execution-perspective"
      link href: "https://blog.plan99.net/its-time-to-kill-the-web-974a9fe80c89#7a16",
        name: "Web apps are impossible to secure"
    end
  end
end
