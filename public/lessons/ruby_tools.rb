require "track"

class Track
  RubyTools = Track.new(name: "ruby_tools") do
    lesson name: "tools"
    lesson name: "bundler"
    lesson name: "rspec"
  end
end
