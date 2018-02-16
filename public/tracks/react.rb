require "track"

Track::React = Track.new(
  name: "react",
  display_name: "Client-Side Coding with React",
  description: "Learn React, the component-centric client-side Web framework from Facebook."
) do

    lesson name: "react" do
        link href: "http://docs.railsbridge.org/javascript-to-do-list-with-react/",
             name: "RailsBridge Javascript To Do List With React"
    end

    lesson name: "redux" do
        link href: "https://medium.com/@dan_abramov/you-might-not-need-redux-be46360cf367"
    end
end
