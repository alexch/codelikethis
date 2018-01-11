require_relative('util')
require_relative('course')

# add "public/courses" dir to Ruby load path
here = ::File.expand_path(File.dirname(__FILE__))
public_dir = ::File.expand_path(File.join(here, "..", "public"))
courses_dir = File.join(public_dir, "courses")
$: << courses_dir
# load every course before making the ordered list of all courses
require_all(courses_dir)

class Courses
  ALL = [
      ::Course::AgileDevelopment,

      ::Course::Separator,

      ::Course::LearnToCodeWithJavascript,
      ::Course::Javascript, # "JavaScript Topics"
      ::Course::ClientSideCoding,
      ::Course::ServerSideJavascript,

      ::Course::Separator,

      ::Course::LearnToCode, # in Ruby
      ::Course::RubyTools,
      ::Course::RubyBasics,
      ::Course::RubyBlocks,
      ::Course::RubyObjects,
      ::Course::Ruby, # "Ruby Topics"
  ]
end
