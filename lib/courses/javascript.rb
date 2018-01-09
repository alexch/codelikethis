require "course"

class Course
  Javascript = Course.new(
      name: "javascript",
      display_name: "JavaScript Topics",
      abstract: "Extend your exploration of JavaScript into distant lands. This course is a catch-all for advanced or esoteric topics that don't fit into other courses."
  ) do
    lesson "javascript_for_programmers"
    lesson "functions_and_closures"
    lesson "object_oriented_javascript"
    lesson "regular_expressions"
  end
end
