require "track"

class Track
  React = Track.new(
      name: "react",
      display_name: "Client-Side Coding with React",
      description: "Learn React, the component-centric client-side Web library from Facebook."
  ) do

    lesson name: "what_is_react" do
      topic name: "react"
      topic name: "components"
      topic name: "virtual-dom"
      topic name: "declarative-intent"
    end

    lesson name: "jsx_and_the_virtual_dom",
           description: "How to write JSX and convert it to runnable React using Babel-Standalone in the browser." do
      topic name: "jsx"
      topic name: "react-dom"
      topic name: "javascript"
      link name: "JSX In Depth", href: "https://reactjs.org/docs/jsx-in-depth.html"
    end

    lesson name: "setting_up_react",
           description: "Preparing the development environment for React"

    lesson name: "component_oriented",
           description: "React applications are organized into components. This lesson will show how components can be built up out of smaller components and then reused in new contexts." do
      topic name: "react"
      topic name: "react-dom"
      topic name: "react-components"
      topic name: "react-component-lifecycle"
    end

    lesson name: "props_and_state",
           description: "Props and State are the two methods available to React to deal with immutable and mutable data within the application. This lesson will explain their uses and differences." do
      topic name: "react-component-props"
      topic name: "react-component-state"
    end

    lesson name: "stateless_functional_components",
           description: "Some components will only accept data from their Props and don't need a State object themselves or from their parents. These kind of components can be built using only functions and are very simple to reason about."

    lesson name: "responding_to_events" do
      topic name: "react"
      topic name: "react-events"
      topic name: "binding"
      topic name: "fat-arrow"
      topic name: "event-handling"
    end

    lesson name: "forms_in_react" do
      topic name: "react"
      topic name: "react-forms"
    end


    lesson name: "conditionally_rendering_components" do
      topic name: "react"
      topic name: "react-conditional-rendering"
    end

    lesson name: "rendering_multiple_components" do
      topic name: "react"
      topic name: "react-component-keys"
      topic name: "react-multiple-component-rendering"
    end

    lesson name: "fetching_data"
    lesson name: "lifting_state_to_parents"
    lesson name: "composition_vs_inheritance"
    lesson name: "using_refs"
    lesson name: "error_boundaries"
    lesson name: "using_the_context"
    lesson name: "routing_in_react"
    lesson name: "routing_in_react_going_further"

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
