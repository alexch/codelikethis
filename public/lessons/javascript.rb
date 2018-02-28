require "track"

class Track
  Javascript = Track.new(
      name: "javascript",
      display_name: "JavaScript Topics",
      description: "Extend your exploration of JavaScript into distant lands. This track is a catch-all for advanced or esoteric topics that don't fit into other tracks."
  ) do

    link href: "https://www.codecademy.com/tracks/javascript"
    link href: "https://www.theodinproject.com/courses/javascript"

    lesson name: "javascript_for_programmers"

    lesson name: "functions_and_closures" do
      link href: "https://dev.to/rpalo/closure-i-hardly-know-her--1h40",
           description: "a Python dev explains what closures are and why they're cool"
    end

    lesson name: "scope" # global, function, closure, private, this, arrows, etc.
    lesson name: "json"

    lesson name: "/cs/oo"
    lesson name: "object_oriented_javascript"

    lesson name: "/agile/test_driven"
    lesson name: "tdd_in_js"

    lesson name: "regexp", display_name: "Regular Expressions"

    lesson name: "ecmascript_6"
    lesson name: "transpilers" # webpack, babel, etc.

    lesson name: "rest_and_spread"
    lesson name: "promises"
    lesson name: "iterators"
  end
end
