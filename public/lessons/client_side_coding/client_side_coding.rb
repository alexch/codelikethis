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

    lesson name: "dom"
    lesson name: "jquery"

    link href: "http://docs.railsbridge.org/frontend/jquery"
    link href: "https://www.codecademy.com/tracks/jquery",
              name: "Codecademy Track for jQuery"

    lesson name: "ajax" do
      project name: "github_emoji"
      project name: "github_repos"
    end

    lesson name: "libraries" do # JS libs and NPM install
      project name: "markdown_preview"
    end

    lesson name: "calling_apis" do # calling APIs from JS
      project name: "dothraki_translator"
      project name: "socket_chat"
      project name: "umbrella_today"
    end

    lesson name: "geolocation" do
      link href: "https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation"
    end

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
