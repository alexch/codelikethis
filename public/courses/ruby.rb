require "course"

Course::Ruby = Course.new(
    name: "ruby",
    display_name: "Ruby Topics",
    abstract: "Extend your exploration of Ruby into distant lands. This course is a catch-all for advanced or esoteric topics that don't fit into other courses."
) do
    lesson name: "credits"
    lesson name: "meta"

    lesson name: "ruby_for_programmers"
    lab "hello"
    lab "temperature"
    # course "ruby_basics"

    lesson name: "waka-waka"
    # course "ruby_blocks"
    # course "ruby_objects"
    lesson name: "bad_names"


    lesson name: "modules"
    lesson name: "variable_scope"
    lesson name: "method_scope"
    lesson name: "classes_as_objects"
    lesson name: "more_objects"
    lesson name: "more_classes"
end
