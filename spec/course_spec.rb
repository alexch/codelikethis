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
    breadcrumbs = Breadcrumbs.new(display_name: "Course", parents: [Courses.new])
    lessons.to_html.should include(breadcrumbs.to_html)
    lessons.to_html.should include(
        "<ul>" +
        "<li><a href=\"/lessons/course/foo\">Foo</a></li>" +
        "<li><a href=\"/lessons/course/bar\">Bar</a></li>" +
        "</ul>")

  end

  describe "a subclass" do
    class HowToCook < Course
      lesson "scramble_eggs"
      lesson "boil_water"
    end

    subject { HowToCook.new }

    it "lets a subclass define its lessons inline" do

      HowToCook.new.lesson_names.should == [
          "scramble_eggs",
          "boil_water",
      ]

    end

    it "has a name" do
      subject.name.should == "how_to_cook"
    end

    it "has a title" do
      subject.display_name.should == "How To Cook"
    end

    it "has an href" do
      subject.href.should == "/lessons/how_to_cook"
    end

    describe 'Course.descendants' do
      it "knows all descendants of Course" do
        Course.descendants.should include(HowToCook)
      end
    end
  end

end
