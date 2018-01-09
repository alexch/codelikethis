require "course"

class Course
  ClientSideCoding = Course.new(
      name: "client_side_coding",
      display_name: "Client-Side Coding",
      abstract: "Learn the data structures, coding patterns, and libraries that enable client-side coding in Web pages.",
      goals: [ # "the student will learn..."
          "the Document Object Model (DOM), a data structure that represents all the elements that describe how a web page looks and behaves",
          "how to use the jQuery library for event-driven actions and animations",
          "AJAX, the system for asynchronously transmitting data between client-side and server-side applications",
          "Web APIs such as Google Maps and Google Analytics which add sophisticated features to simple Web sites",
      ]
  ) do
    lesson "dom"
    lesson "jquery"
    lesson "ajax"
    lesson "apis"
  end
end
