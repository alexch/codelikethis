require "course"

class Course
  RubyBlocks = Course.new("ruby_blocks") do

    lesson "blocks"
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
