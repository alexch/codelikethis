require "course"

class Course
  RubyBlocks = Course.new(name: "ruby_blocks") do

    lesson name: "blocks" do
      video youtube_id: "K8uhD8mtorE"
    end
    lesson name: "chaining"
    lab name: "blocks"
    lesson name: "block_scope"
    lesson name: "stubbing"
    lab name: "performance_monitor"
    lesson name: "iterators"
    lesson name: "more_blocks"
    lesson name: "enumerators_advanced"
  end
end
