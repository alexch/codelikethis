require "track"

class Track
  RubyObjects = Track.new(name: "ruby_objects") do
    lesson name: "tiers" do
      video youtube_id: "FZkjE1_0XtI"
    end

    lesson name: "objects"
    lab name: "hello_friend"

    lesson name: "classes"
    lab name: "book_titles"

    lesson name: "class_inheritance"
    #todo: lesson name: "creation patterns"
    lab name: "temperature_object"
    lab name: "timer"
    lab name: "dictionary"
    lab name: "rpn_calculator"

    lesson name: "dispatching"
    lab name: "xml_builder"

    lesson name: "class_methods"
    lesson name: "factories"
    lesson name: "reopening_classes"
    lab name: "array_extensions"
    lab name: "in_words"
  end
end
