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
    lessons.to_html.should == "<ul>" +
        "<li><a href=\"foo/\">foo</a></li>" +
        "<li><a href=\"bar/\">bar</a></li>" +
        "</ul>"

  end

  it "lets a subclass define its lessons inline" do

    class HowToCook < Course
      lesson "scramble_eggs"
      lesson "boil_water"
    end

    HowToCook.new.lesson_names.should == [
        "scramble_eggs",
        "boil_water",
    ]

  end

end
