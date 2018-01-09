require_relative('util')
require_relative('course')
require_all('courses')

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
