require "wrong"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/lesson"

require "#{project}/public/courses/ruby" # ???


describe Lesson do

  include Files

  let(:course) {
    course = Course.new do
      lesson "scramble_eggs", abstract: "how to scramble"
      lab "egg_lab"
      lesson "boil_water"
      lab "turn_on_stove"
      lab "boiling"
    end

    course.dir = files.dir "how_to_cook" do
      file "scramble_eggs.md"
      file "boil_water.md", <<-MD
# water
water is a molecule
# LAB: using faucets
fill a glass of water at the sink
      MD
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

  it "has an abstract" do
    lesson.abstract.should == "how to scramble"
  end

  it "renders HTML" do
    lesson.to_html.should include("<p>contents of scramble_eggs.md</p>")
  end

  it "has a next lab" do
    lesson.labs.map(&:name).should == ["egg_lab"]
  end

  it "includes slide-defined labs" do
    course.lesson_named("boil_water").labs.map(&:name).should include("using faucets")
  end

  it "has several next labs" do
    course.lesson_named("boil_water").labs.map(&:name).should include("turn_on_stove", "boiling")
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
