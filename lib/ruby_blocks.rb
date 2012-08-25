require "course"

class Course
  RubyBlocks = Course.new("ruby_blocks") do

    lesson "blocks" do
      video "K8uhD8mtorE"
    end
    lesson "chaining"
    lab "Blocks"
    lesson "block_scope"
    lesson "stubbing"
    lab "Performance Monitor"
    lesson "iterators"
    lesson "more_blocks"
    lesson "enumerators_advanced"

  end
end
