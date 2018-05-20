require "track"

class Track
  RubyBlocks = Track.new(name: "ruby_blocks") do

    link href: "https://www.artima.com/intv/closures.html",
         name: "Blocks and Closures in Ruby",
         description: "A Conversation with Yukihiro Matsumoto, Part III"
    link href: "https://www.artima.com/intv/closures2.html",
         name: "Blocks and Closures in Ruby (cont.)",
         description: "A Conversation with Yukihiro Matsumoto, Part III"

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
