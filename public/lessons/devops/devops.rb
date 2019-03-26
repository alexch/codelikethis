require "track"

require_relative '../../../lib/link.rb' # :-(

Track::Devops = Track.new(
  name: "devops",
  description: "DevOps comprises a series of practices and tools that help bring operations -- meaning revision control, server management, deployment, testing, monitoring, etc. -- into the hands of developers, while still maintaining communication and cooperation with dedicated ops experts and network managers."
) do
  # "the student will learn..."
  goal name: "all about devops :-)"

  lesson name: "intro"
  lesson name: "the_twelve_factors"

end
