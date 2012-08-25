require "wrong"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/lesson"
require "#{project}/lib/ruby"


describe Lesson do

  include Files

  let(:course) {
    course = Course.new do
      lesson "scramble_eggs"
      lab "egg_lab"
      lesson "boil_water"
      lab "turn_on_stove"
      lab "boiling"
    end

    course.dir = files.dir "how_to_cook" do
      file "scramble_eggs.md"
      file "boil_water.md"
    end

    course
  }
  let(:lesson) { course.lesson_named "scramble_eggs" }

  it "has a name" do
    lesson.name.should == "scramble_eggs"
  end

  it "has a title" do
    lesson.display_name.should == "Scramble Eggs"
  end

  it "renders HTML" do
    breadcrumbs = Breadcrumbs.new(:display_name => lesson.display_name, :parents => [Courses.new, course])
    lesson.to_html.should include(breadcrumbs.to_html)
  end

  it "has a next lab" do
    lesson.next_labs.map(&:name).should == ["egg_lab"]
  end

  it "has several next labs" do
    course.lesson_named("boil_water").next_labs.map(&:name).should == ["turn_on_stove", "boiling"]
  end

  describe 'videos' do
    subject { Lesson.new(course, "scramble_eggs") }
    it "can add a video" do
      subject.video "abcdefg"
    end
    it "shows up in the rendered HTML" do
      subject.video "abcdefg"
      subject.to_html.should include("http://www.youtube.com/embed/abcdefg")
    end
    it "can add more than one video" do
      subject.video "abcdefg"
      subject.video "12345"
      subject.to_html.should include("http://www.youtube.com/embed/abcdefg")
      subject.to_html.should include("http://www.youtube.com/embed/12345")
    end
  end

end
