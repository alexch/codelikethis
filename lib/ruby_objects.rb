require "course"

class Course
  RubyObjects = Course.new("ruby_objects") do
    lesson "tiers"
    lesson "objects"
    lab "hello_friend"
    lesson "classes"
    lab "book_titles"

    lesson "class_inheritance"
    #todo: lesson "creation patterns"
    lab "temperature_object"
    lab "timer"
    lab "dictionary"
    lab "rpn_calculator"

    lesson "dispatching"
    lab "xml_builder"

    lesson "class_methods"
    lesson "reopening_classes"
    lab "array_extensions"
    lab "in_words"
    lesson "modules"
    lesson "variable_scope"
    lesson "method_scope"
    lesson "classes_as_objects"
    lesson "more_objects"
    lesson "more_classes"
  end
end
