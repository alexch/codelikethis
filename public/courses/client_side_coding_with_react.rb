require "course"

class Course
  ClientSideCodingWithReact = Course.new(
      name: "client_side_coding_with_react",
      display_name: "Client-Side Coding with React",
      abstract: "Learn React, the component-centric client-side Web framework from Facebook"
  ) do
    lesson name: "react" # http://docs.railsbridge.org/javascript-to-do-list-with-react/
    lesson name: "redux"
  end
end
