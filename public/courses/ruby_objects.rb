require "course"

class Course
  RubyObjects = Course.new(name: "ruby_objects") do
    lesson name: "tiers" do
      video "FZkjE1_0XtI"
    end

    lesson name: "objects"
    lab "hello_friend"

    lesson name: "classes"
    lab "book_titles"

    lesson name: "class_inheritance"
    #todo: lesson name: "creation patterns"
    lab "temperature_object"
    lab "timer"
    lab "dictionary"
    lab "rpn_calculator"

    lesson name: "dispatching"
    lab "xml_builder"

    lesson name: "class_methods"
    lesson name: "factories"
    lesson name: "reopening_classes"
    lab "array_extensions"
    lab "in_words"
  end
end
