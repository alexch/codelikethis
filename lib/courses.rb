require_relative('util')
require_relative('course')
require_all('courses')

class Courses
  ALL = [
      ::Course::LearnToCode,
      ::Course::LearnToCodeWithJavascript,
      ::Course::AgileDevelopment,
      ::Course::Ruby,
      ::Course::RubyTools,
      ::Course::RubyBasics,
      ::Course::RubyBlocks,
      ::Course::RubyObjects,
      ::Course::RubyAdvanced,
      ::Course::Javascript,
  ]
end
