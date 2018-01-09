require_relative('util')
require_relative('course')
require_all('courses')

class Courses
  ALL = [
      ::Course::LearnToCodeWithJavascript,
      ::Course::AgileDevelopment,

      ::Course::Javascript,


      ::Course::LearnToCode,
      ::Course::Ruby,
      ::Course::RubyTools,
      ::Course::RubyBasics,
      ::Course::RubyBlocks,
      ::Course::RubyObjects,
      ::Course::RubyAdvanced,
  ]
end
