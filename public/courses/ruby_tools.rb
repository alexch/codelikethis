require "course"

class Course
  RubyTools = Course.new(name: "ruby_tools") do
    lesson name: "tools"
    lesson name: "bundler"
    lesson name: "rspec"
  end
end
