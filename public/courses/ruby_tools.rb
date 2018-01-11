require "course"

class Course
  RubyTools = Course.new(name: "ruby_tools") do
    lesson "tools"
    lesson "bundler"
    lesson "rspec"
  end
end
