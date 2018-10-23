require "track"

class Track < Thing
  Javascript = Track.new(
      name: "javascript",
      display_name: "Intermediate JavaScript",
      description: "Explore JavaScript topics. (This track is a catch-all for advanced or esoteric topics that don't fit into other tracks.)"
  ) do

    link href: "https://www.codecademy.com/tracks/javascript"
    link href: "https://www.theodinproject.com/courses/javascript"

    lesson name: "javascript_for_programmers",
           description: "This lesson is a whirlwind tour of JavaScript features for people already fluent in another programming language. For a more measured and beginner-focused tutorial, check out the Learn to Code with JavaScript track instead."

    lesson name: "json",
      description: "JSON is a coding language, but it's not a programming language. Its purpose is to represent data with no behavior attached. It's useful for saving state, transferring information across a network, writing config files or editing settings. And since it's a strict subset of the JavaScript language syntax, it's natural to use it in JavaScript programs and JavaScript-aware text editors."

    lesson name: "data_structures" do # maybe put this in "CS"?
      project name: "animal"
      project name: "hangman"
    end

    link href: "http://news.codecademy.com/your-guide-to-semicolons-in-javascript/"

    lesson name: "regexp", display_name: "Regular Expressions"

    lesson name: "scope",
           description: "When can you access a JavaScript variable? It depends on its scope. Let's discuss the various scopes a variable can occupy, including global vs local, functional vs lexical, private vs public." do
      link href: "https://toddmotto.com/everything-you-wanted-to-know-about-javascript-scope/"
      link href: "https://scotch.io/tutorials/understanding-scope-in-javascript"
    end
    lesson name: 'hybrid', display_name: "Hybrid Styles" do
    topic name: "procedural-programming"
    topic name: "functional-programming"
    topic name: "object-oriented-programming"
    end

    lesson name: "encapsulation",
           description: "Encapsulation is an important part of Object-Oriented programming, but we don't need objects to achieve it. This lesson covers using scope and IIFEs to make truly private variables in JavaScript without classes or prototypes." do
            topic name: "encapsulation"
            topic name: "closure-scope"
            topic name: "private-variable"
            topic name: "immediately-invoked-function-expressions"
          end

    lesson name: 'oo_js', display_name: "Object-Oriented JavaScript" do
      topic name: "objects"
      topic name: "hashes"
      topic name: "object-oriented-programming"
      topic name: "prototypes"
      topic name: "encapsulation"
      topic name: "this"
      topic name: "object-instantiation"
      topic name: "fat-arrow"
      topic name: "binding"
      topic name: "callbacks"
    end


    lesson name: 'oo_js_creation', display_name: "Object-Oriented JavaScript: Creating Objects" do
      topic name: "object-instantiation"
      topic name: "new"
      topic name: "constructors"
      topic name: "classes"
      topic name: "encapsulation"
    end

    lesson name: 'oo_js_prototypes', display_name: "Object-Oriented JavaScript: Using Prototypes" do
      topic name: "prototypes"
      topic name: "objects"
    end

    # lesson name: '/oo/oo_design' do
    #   topic name: ""
    # end

    # todo?: We'll also consider hoisting, this, bind/call/apply, fat and skinny arrows, and more.

    lesson name: "/agile/test_driven"
    lesson name: "tdd_in_js"
    lesson name: "no_frills_testing"

    lesson name: "ES6" do
      link name: "Exploring ES6",
           href: "http://exploringjs.com/es6.html"
    end

    lesson name: "evented_io" do
      topic name: "es6"
      topic name: "promises"
      topic name: "async-await"
    end

    lesson name: "ecosystem",
           display_name: "The JavaScript Ecosystem",
           description: "ECMAScript? ES2015? ES6? CoffeeScript? Babel? Webpack? Browserify? Node? NPM? Wasm? WTF? In this lesson, we try to unravel the rat's nest of JavaScript tools, transpilers, and language variants."

    lesson name: "rest_and_spread",
      description: "Rest and Spread are modern JavaScript language features that let you transform argument lists, arrays, and key-value pairs into each other concisely. Perhaps too concisely! They can be difficult to understand since a single operator -- dot-dot-dot or '...' -- does a lot of heavy lifting. In this lesson we unpack the dots and examine when to use them... and when not to." do
        link href: "https://dmitripavlutin.com/how-three-dots-changed-javascript/"
        link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax"
        link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters"
    end
    lesson name: "named_parameters" do
      link name: "named_parameters", href: "http://2ality.com/2011/11/keyword-parameters.html"
    end

    # todo: FP track
    lesson name: "functional_programming_in_javascript" do
      link href: "https://hackernoon.com/two-years-of-functional-programming-in-javascript-lessons-learned-1851667c726"
    end

    lesson name: "promises" do
     link name: "Promises - Fun Fun Function", href: 
     "https://www.youtube.com/watch?v=2d7s3spWAzo"
    end 
    lesson name: "async_and_await" do
      link href: "https://javascript.info/async-await"
      link name: "Async/Await Fun Fun Function", href:
      "https://www.youtube.com/watch?v=568g8hxJJp4"
    end
    lesson name: "iterators"

    lesson name: "cypress"
  end
end
