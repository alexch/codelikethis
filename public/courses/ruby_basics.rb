require "course"

class Course
  RubyBasics = Course.new(name: "ruby_basics") do
    lesson name: "more_neat_things"
    lab "hello"
    lesson name: "types"
    lesson name: "conditionals"
    lesson name: "numbers"
    lesson name: "functions"
    lab "temperature"
    lab "calculator"
    lesson name: "strings"
    lesson name: "chaining"
    lab "simon_says"
    lesson name: "regexp"
    lab "pig_latin"
    lesson name: "symbols"
    lesson name: "loops"
    lesson name: "collections"
    lesson name: "arrays"
    # todo: lab on arrays
    lesson name: "ranges"
    lesson name: "hashes"
    # todo: lab on hashes
    lesson name: "exceptions"
    #todo: lab "exceptions"

    #lesson name: "time"
    #lesson name: "io"
    #todo: lab on file/io exercise, like scraper

  end
end
