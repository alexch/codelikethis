require "track"

Track::Oo = Track.new(
  name: "oo",
  display_name: "Object-Oriented Design with JavaScript",
  description: "The principles of designing programs using objects."
) do
  lesson name: "introduction_to_objects"
  lesson name: "oo_design" do
    link name:"Boundaries by Gary Bernhardt 2012", href:
    "https://www.destroyallsoftware.com/talks/boundaries"
  end
end
