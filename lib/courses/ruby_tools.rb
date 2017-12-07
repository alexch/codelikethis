require "course"

class Course
  RubyTools = Course.new("ruby_tools") do
    lesson "tools"
    lesson "bundler"
    lesson "rspec"
  end
end
