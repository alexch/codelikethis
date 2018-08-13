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
    lesson name: "setting_up_react",
           description: "Preparing the development environment for React"
    lesson name: "component_oriented",
           description: "React applications are organized into components. This lesson will show how components can be built up out of smaller components and then reused in new contexts."
    lesson name: "props_and_state",
           description: "Props and State are the two methods available to React to deal with immutable and mutable data within the application. This lesson will explain their uses and differences."
    lesson name: "stateless_functional_components",
           description: "Some components will only accept data from their Props and don't need a State object themselves or from their parents. These kind of components can be built using only functions and are very simple to reason about."
    lesson name: "responding_to_events"
    lesson name: "forms_in_react"
    lesson name: "conditionally_rendering_components"
    lesson name: "rendering_multiple_components"
    lesson name: "fetching_data"
    lesson name: "lifting_state_to_parents"
    lesson name: "routing_in_react"
    lesson name: "loading_server_data"
    lesson name: "using_the_context"

    link href: "https://reactjs.org/tutorial/tutorial.html",
         name: "Build a Tic-Tac-Toe game in the browser with React"

    # TODO: Update the Railsbridge Project
    # This Raisbridge project is great, but uses a very old version of React.
    # We should either update the project, or use something more recent.
    link href: "http://docs.railsbridge.org/javascript-to-do-list-with-react/",
         name: "RailsBridge Javascript To Do List With React"

    link href: "https://medium.com/@dan_abramov/you-might-not-need-redux-be46360cf367",
         name: "You might not need Redux - Dan Abramov"
    link href: "http://buildwithreact.com/tutorial"
    link href: "https://tylermcginnis.com/reactjs-tutorial-a-comprehensive-guide-to-building-apps-with-react/"
  end
end
