require "course"

class Course
  ClientSideCodingWithReact = Course.new(
      name: "client_side_coding_with_react",
      display_name: "Client-Side Coding with React",
      # abstract: "Learn the data structures, coding patterns, and libraries that enable client-side coding in Web pages.",
      goals: [ # "the student will learn..."
      ],
      ) do
    lesson "react" # http://docs.railsbridge.org/javascript-to-do-list-with-react/
    lesson "redux"
  end
end
