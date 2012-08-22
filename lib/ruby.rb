require "course"

class Course
  Ruby = Course.new("ruby") do
    lesson "credits"
    lesson "meta"
    lesson "intro"
    lab "hello"
    lab "temperature"
    # course "ruby_basics"
    lesson "waka-waka"
    # course "ruby_blocks"
    # course "ruby_objects"
    lesson "bad_names"
  end
end
