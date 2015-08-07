require "course"

class Course
  RubyAdvanced = Course.new("ruby_advanced") do
    lesson "modules"
    lesson "variable_scope"
    lesson "method_scope"
    lesson "classes_as_objects"
    lesson "more_objects"
    lesson "more_classes"
  end
end
