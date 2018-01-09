require "course"

Course::Ruby = Course.new(
    name: "ruby",
    display_name: "Ruby Topics",
    abstract: "Extend your exploration of Ruby into distant lands. This course is a catch-all for advanced or esoteric topics that don't fit into other courses."
) do
    lesson "credits"
    lesson "meta"

    lesson "ruby_for_programmers"
    lab "hello"
    lab "temperature"
    # course "ruby_basics"

    lesson "waka-waka"
    # course "ruby_blocks"
    # course "ruby_objects"
    lesson "bad_names"


    lesson "modules"
    lesson "variable_scope"
    lesson "method_scope"
    lesson "classes_as_objects"
    lesson "more_objects"
    lesson "more_classes"
end
