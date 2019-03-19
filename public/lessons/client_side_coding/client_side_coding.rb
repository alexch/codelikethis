require "track"

class Track
  ClientSideCoding = Track.new(
      name: "client_side_coding",
      display_name: "Client-Side Coding with JavaScript",
      description: "Learn the data structures, coding patterns, and libraries that enable client-side coding in Web pages.",
      ) do

    # "the student will learn..."
    goal name: "the Document Object Model (DOM), a data structure that represents all the elements that describe how a web page looks and behaves"
    goal name: "how to use the jQuery library for event-driven actions and animations"
    goal name: "AJAX, the system for asynchronously transmitting data between client-side and server-side applications"
    goal name: "Web APIs such as Google Maps and Google Analytics which add sophisticated features to simple Web sites"

    project name: "markdown_preview"
    project name: "pomodoro"
    project name: "tic_tac_toe_www"
    project name: "hangman"

    lesson name: "dom"
    lesson name: "/www/dom_debugging"
    lesson name: "dom_scripting"
    lesson name: "dom_events"

    lesson name: "/www/embedding_media"

    lesson name: "embedding",
           description: 'how to use Web APIs and embedded widgets to serve maps, videos, surveys, and other content from around the Web inside your own sites' do
            topic name: "embedding"
            link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/embedding-images-and-video"
    end

    lesson name: "jquery" do
      topic name: "jquery"
      topic name: "jquery-selectors"
      topic name: "jquery-collections"
      topic name: "jquery-binding"
      link href: "http://docs.railsbridge.org/frontend/jquery"
      link href: "https://www.codecademy.com/tracks/jquery",
                name: "Codecademy Track for jQuery"
    end

    lesson name: "ajax" do
      topic name: "ajax"
      topic name: "json"
      topic name: "parsing"
      topic name: "promises"
      topic name: "fetch"
      project name: "yelpington_app"
      project name: "github_emoji"
      project name: "github_repos"
      link href: "https://www.youtube.com/watch?v=rJesac0_Ftw",
             name: "JSON and AJAX Tutorial: With Real Examples"
    end

    lesson name: "calling_apis",
      display_name: "Calling APIs from JavaScript",
      description: "jQuery.ajax(), XMLHttpRequest, Fetch" do
        topic name: "postman"
        topic name: "apis"
        link href: 'https://www.codecademy.com/tracks/parse'
        link href: 'https://scotch.io/tutorials/how-to-use-the-javascript-fetch-api-to-get-data'
        link href: 'https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API'
        link href: 'https://www.npmjs.com/package/node-fetch'

      project name: "dothraki_translator"
      project name: "socket_chat"
      project name: "umbrella_today"
    end

    # more advanced mapping
    lesson name: "geolocation" do
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation"
    end

    lesson name: "geocoding" do
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation"
    end

    lesson name: "interactive_mapping" do
      topic name: "leaflet"
      topic name: "geocoding"
      topic name: "geolocation"
      topic name: "embedding"
      topic name: "json"
      link href: "http://geojson.org/"
      project name: "geo_vermonter"
    end

    lesson name: "urls_and_javascript" do
      topic name: "url"
    end

    lesson name: "local_storage" do
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Storage"
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage"
    end

    # probably should move all these lessons to later tracks

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
