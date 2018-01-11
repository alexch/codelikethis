require "course"

class Course
  ClientSideCoding = Course.new(
      name: "client_side_coding",
      display_name: "Client-Side Coding",
      abstract: "Learn the data structures, coding patterns, and libraries that enable client-side coding in Web pages.",
      ) do

    # "the student will learn..."
    goal "the Document Object Model (DOM), a data structure that represents all the elements that describe how a web page looks and behaves"
    goal "how to use the jQuery library for event-driven actions and animations"
    goal "AJAX, the system for asynchronously transmitting data between client-side and server-side applications"
    goal "Web APIs such as Google Maps and Google Analytics which add sophisticated features to simple Web sites"

    lesson name: "dom"
    lesson name: "jquery"
    lesson name: "ajax"
    lesson name: "apis" # calling APIs from JS
  end
end
