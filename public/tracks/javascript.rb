require "track"

class Track
  Javascript = Track.new(
      name: "javascript",
      display_name: "JavaScript Topics",
      description: "Extend your exploration of JavaScript into distant lands. This track is a catch-all for advanced or esoteric topics that don't fit into other tracks."
  ) do
    lesson name: "javascript_for_programmers"
    lesson name: "functions_and_closures"

    lesson name: "scope_review" # global, function, closure, private, this, arrows, etc.

    lesson name: "object_oriented_javascript"
    lesson name: "regexp", display_name: "Regular Expressions"

    lesson name: "tdd" # link to "Test Driven" perhaps?
    lesson name: "tdd_in_js"

    lesson name: "ecmascript_6"
    lesson name: "transpilers" # webpack, babel, etc.

    lesson name: "rest_and_spread"
    lesson name: "promises"
    lesson name: "iterators"
  end
end
