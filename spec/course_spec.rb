require "wrong"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/course"

describe Course do
  it "takes a list of lesson names" do
    lessons = Course.new(["foo", "bar"])
    lessons.lesson_names.should == ["foo", "bar"]
  end

  it "renders HTML" do
    lessons = Course.new(["foo", "bar"])
    lessons.to_html.should ==
        "<h2>Course</h2>" +
        "<ul>" +
        "<li><a href=\"/lessons/course/foo\">Foo</a></li>" +
        "<li><a href=\"/lessons/course/bar\">Bar</a></li>" +
        "</ul>"

  end

  class HowToCook < Course
    lesson "scramble_eggs"
    lesson "boil_water"
  end


  it "lets a subclass define its lessons inline" do

    HowToCook.new.lesson_names.should == [
        "scramble_eggs",
        "boil_water",
    ]

  end

  it "has a name" do
    HowToCook.new.name.should == "how_to_cook"
  end

  it "has a title" do
    HowToCook.new.title.should == "How To Cook"
  end

end
