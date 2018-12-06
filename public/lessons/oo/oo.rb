require "track"

Track::Oo = Track.new(
  name: "oo",
  display_name: "Object-Oriented Design with JavaScript",
  description: "The principles of designing programs using objects."
) do
  lesson name: "introduction_to_objects"
  lesson name: "oo_design" do
    link name:"Boundaries by Gary Bernhardt 2012",
         href: "https://www.destroyallsoftware.com/talks/boundaries"
    link href: "https://medium.com/javascript-scene/the-forgotten-history-of-oop-88d71b9b2d9f",
         name: "The Forgotten History of OOP by Eric Elliott"
  end
  link href: "https://www.infoq.com/presentations/Simple-Made-Easy",
        name: "Simple Made Easy by Rich Hickey"
end
