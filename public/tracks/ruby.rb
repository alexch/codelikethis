require "track"

Track::Ruby = Track.new(
    name: "ruby",
    display_name: "Ruby Topics",
    description: 'Extend your exploration of Ruby -- the programming language designed to "make programmers happy" -- into distant lands. This track is a catch-all for advanced or esoteric topics that don\'t fit into other tracks.'
) do
    lesson name: "credits"
    lesson name: "meta"

    lesson name: "ruby_for_programmers" do
      link href: "http://www.artima.com/intv/rubyP.html",
           name: "The Philosophy of Ruby",
           description: "an interview with Yukihiro Matsumoto (Matz)"
    end
    lab name: "hello"
    lab name: "temperature"
    # track "ruby_basics"

    lesson name: "waka-waka"
    # track "ruby_blocks"
    # track "ruby_objects"
    lesson name: "bad_names"


    lesson name: "modules"
    lesson name: "variable_scope"
    lesson name: "method_scope"
    lesson name: "classes_as_objects"
    lesson name: "more_objects"
    lesson name: "more_classes"
end
