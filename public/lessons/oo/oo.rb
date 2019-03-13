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


  lesson name: 'oo_js', display_name: "Object-Oriented JavaScript" do
    topic name: "objects"
    topic name: "hashes"
    topic name: "object-oriented-programming"
    topic name: "prototypes"
    topic name: "encapsulation"
    topic name: "this"
    topic name: "object-creation"
    topic name: "fat-arrow"
    topic name: "binding"
    topic name: "callbacks"
  end


  lesson name: 'oo_js_creation', display_name: "Creating Objects" do
    topic name: "object-creation"
    topic name: "new"
    topic name: "constructors"
    topic name: "classes"
    topic name: "encapsulation"
  end

  lesson name: 'oo_js_inheritance'

  lesson name: 'oo_js_prototypes', display_name: "Using Prototypes" do
    topic name: "prototypes"
    topic name: "objects"
  end

  lesson name: "/javascript/encapsulation"

  link href: "https://www.infoq.com/presentations/Simple-Made-Easy",
        name: "Simple Made Easy by Rich Hickey"

end
