require "track"

class Track
  React = Track.new(
    name: "react",
    display_name: "Client-Side Coding with React",
    description: "Learn React, the component-centric client-side Web library from Facebook."
  ) do

    lesson name: "what_is_react"
    lesson name: "jsx_and_the_virtual_dom",
           description: "How to write JSX and convert it to runnable React using Babel-Standalone in the browser."
    lesson name: "functional_behavior",
           description: "React adheres to a 'mostly' functional way of creating and composing components. This lesson will expose some of the ways this makes building interfaces easier."
    lesson name: "simple_api",
           description: "The React API is quite simple compared to other libraries and frameworks there are only a dozen or so functions which will be used regularaly."
    lesson name: "component_oriented",
           description: "React applications are organized into components. This lesson will show how components can be built up out of smaller components and then reused in new contexts."
    lesson name: "props_and_state",
           description: "Props and State are the two methods available to React to deal with immutable and mutable data within the application. This lesson will explain their uses and differences."

    # TODO: Update the Railsbridge Project
    # This Raisbridge project is great, but uses a very old version of React.
    # We should either update the project, or use something more recent.
    lesson name: "nested_components"
    lesson name: "using_the_context"
    lesson name: "responding_to_events"
    lesson name: "forms_in_react"
    lesson name: "testing_react_components"
    lesson name: "loading_server_data"
    lesson name: "routing_in_react"
    lesson name: "the_flux_design_pattern",
           description: "How a one way flow of state will make managing change easier"
    lesson name: "managing_state_with_redux",
           description: "The Redux library is a simple implementation of the 'Flux Design Pattern' and will be useful for managing change within your application."

    link href: "https://reactjs.org/tutorial/tutorial.html",
         name: "Build a Tic-Tac-Toe game in the browser with React"

    link href: "http://docs.railsbridge.org/javascript-to-do-list-with-react/",
         name: "RailsBridge Javascript To Do List With React"

    link href: "https://medium.com/@dan_abramov/you-might-not-need-redux-be46360cf367",
         name: "You might not need Redux - Dan Abramov"
  end
end
