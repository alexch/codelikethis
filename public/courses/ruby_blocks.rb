require "course"

class Course
  RubyBlocks = Course.new(name: "ruby_blocks") do

    lesson "blocks" do
      video "K8uhD8mtorE"
    end
    lesson "chaining"
    lab "blocks"
    lesson "block_scope"
    lesson "stubbing"
    lab "performance_monitor"
    lesson "iterators"
    lesson "more_blocks"
    lesson "enumerators_advanced"
  end
end
