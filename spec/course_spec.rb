require "wrong"
require "files"

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

    include Files

    class HowToCook < Course
      lesson "scramble_eggs"
      lesson "boil_water"
    end

    subject {
      HowToCook.new.tap do |course|
        course.dir = files.dir "how_to_cook" do
            file "scramble_eggs.md"
            file "boil_water.md"
        end
      end
    }

    it "lets a subclass define its lessons inline" do

      subject.lesson_names.should == [
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

    it "has lessons" do
      subject.lessons.map(&:name).should == ["scramble_eggs", "boil_water"]
    end

    describe 'Course.descendants' do
      it "knows all descendants of Course" do
        Course.descendants.should include(HowToCook)
      end
    end

    describe 'next and previous lesson' do
      it 'returns the next lesson' do
        subject.next_lesson('scramble_eggs').name.should == "boil_water"
      end
      it 'returns nil if there are no more lessons' do
        subject.next_lesson('boil_water').should be_nil
      end
      it 'returns the previous lesson' do
        subject.previous_lesson('boil_water').name.should == "scramble_eggs"
      end
      it 'returns nil if there are no previous lessons' do
        subject.previous_lesson('scramble_eggs').should be_nil
      end
    end
  end

end
