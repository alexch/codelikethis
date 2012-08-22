require "course"

class Course
  RubyObjects = Course.new("ruby_objects") do
    lesson "tiers"
    lesson "objects"
    lesson "classes"
    lab "Hello Friend"
    lesson "class_inheritance"
    #todo: lesson "creation patterns"
    lab "Temperature Object"
    lab "Book Titles"
    lab "Timer"
    lab "Dictionary"
    lab "RPN Calculator"

    lesson "dispatch"
    lab "XML Builder"

    lesson "class_methods"
    lesson "reopening_classes"
    #lab "# Labs:\n* Array Extensions\n* In Words\n"
    lesson "modules"
    lesson "variable_scope"
    lesson "method_scope"
    lesson "classes_as_objects"
    lesson "more_objects"
    lesson "more_classes"
  end
end
