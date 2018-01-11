require "course"

class Course
  Javascript = Course.new(
      name: "javascript",
      display_name: "JavaScript Topics",
      abstract: "Extend your exploration of JavaScript into distant lands. This course is a catch-all for advanced or esoteric topics that don't fit into other courses."
  ) do
    lesson "javascript_for_programmers"
    lesson "functions_and_closures"

    lesson "scope_review" # global, function, closure, private, this, arrows, etc.


    lesson "object_oriented_javascript"
    lesson "regexp", display_name: "Regular Expressions"

    lesson "tdd" # link to "Test Driven" perhaps?
    lesson "tdd_in_js"

    lesson "ecmascript_6"
    lesson "transpilers" # webpack, babel, etc.

    lesson "rest_and_spread"
    lesson "promises"
    lesson "iterators"
  end
end
