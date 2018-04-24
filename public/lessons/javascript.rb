require "track"

class Track < Thing
  Javascript = Track.new(
      name: "javascript",
      display_name: "JavaScript Topics",
      description: "Extend your exploration of JavaScript into distant lands. This track is a catch-all for advanced or esoteric topics that don't fit into other tracks."
  ) do

    link href: "https://www.codecademy.com/tracks/javascript"
    link href: "https://www.theodinproject.com/courses/javascript"

    lesson name: "javascript_for_programmers",
           description: "a whirlwind tour of JavaScript features for people already fluent in another programming language"

    lesson name: "functions_and_closures" do
      link href: "https://dev.to/rpalo/closure-i-hardly-know-her--1h40",
           description: "a Python dev explains what closures are and why they're cool"
    end

    lesson name: "scope",
      description: "When can you access a JavaScript variable? It depends on its scope. Let's discuss the various scopes a variable can occupy, including global vs local, functional vs lexical, private vs public. We'll also consider hoisting, this, bind/call/apply, fat and skinny arrows, and more." do
      link href: "https://toddmotto.com/everything-you-wanted-to-know-about-javascript-scope/"
      link href: "https://scotch.io/tutorials/understanding-scope-in-javascript"
    end

    lesson name: "data_structures" do # maybe put this in "CS"?
      project name: "animal"
      project name: "hangman"
    end
    lesson name: "json"

    lesson name: "/oo/intro"
    lesson name: "object_oriented_javascript"

    lesson name: "functional_programming_in_javascript" do
      link href: "https://hackernoon.com/two-years-of-functional-programming-in-javascript-lessons-learned-1851667c726"
    end

    lesson name: "/agile/test_driven"
    lesson name: "tdd_in_js"
    lesson name: "no_frills_testing"

    lesson name: "regexp", display_name: "Regular Expressions"

    lesson name: "ecosystem",
           display_name: "The JavaScript Ecosystem",
           description: "ECMAScript? ES2015? Babel? Webpack? Browserify? Node? NPM? Wasm? WTF?"

    lesson name: "ecmascript_6"
    lesson name: "transpilers" # webpack, babel, etc.

    lesson name: "rest_and_spread"
    lesson name: "promises"
    lesson name: "async_and_await" do
      link href: "https://javascript.info/async-await"
    end
    lesson name: "iterators"
    link name: "named_parameters", href: "http://2ality.com/2011/11/keyword-parameters.html"

    link href: "http://news.codecademy.com/your-guide-to-semicolons-in-javascript/"
  end
end
