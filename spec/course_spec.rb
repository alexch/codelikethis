require "wrong"
require "files"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/course"

describe Course do

  include Files

  describe "by default" do

    subject {Course.new}

    it "has a default name" do
      subject.name.should == "course"
    end

    it "has no abstract" do
      subject.abstract.should be_nil
    end
  end

  it "takes a list of lesson names" do
    lessons = Course.new do
      lesson "foo"
      lesson "bar"
    end
    lessons.lesson_names.should == ["foo", "bar"]
  end

  it "renders HTML" do
    lessons = Course.new do
      lesson "foo"
      lesson "bar"
    end

    lessons.dir = files.dir "foo" do
      file "foo.md"
      file "bar.md"
    end

    breadcrumbs = Breadcrumbs.new(display_name: "Course", parents: [CoursesTable.new])
    lessons.to_html.should include(breadcrumbs.to_html)
    lessons.to_html.should include("<a href=\"/lessons/course/foo#content\">Foo")
    lessons.to_html.should include("<a href=\"/lessons/course/bar#content\">Bar")
  end

  describe 'with markdown lesson files' do

    subject {

      course = Course.new(name: "how_to_cook",
                          abstract: "learn how to cook with these great tips",
                          goals: ["boil water", "scramble eggs"]
                          ) do

        lesson "scramble_eggs"
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

    it "can have an abstract" do
      subject.abstract.should == "learn how to cook with these great tips"
    end

    it "can have a list of goals" do
      subject.goals.should == [
          "boil water",
          "scramble eggs",
          ]
    end

    it "lets a subclass define its lessons inline" do
      subject.lesson_names.should == [
          "scramble_eggs",
          "boil_water",
      ]
    end

    it "lets a subclass define its labs inline" do
      subject.lab_names.should include(
          "egg_lab",
          "turn_on_stove",
          "boiling",
          )
    end

    it "has a name" do
      subject.name.should == "how_to_cook"
    end

    it "has a title (aka display name)" do
      subject.display_name.should == "How To Cook"
    end

    it "can have a custom display name" do
      title = "Now We're Cooking!"
      c = Course.new(name: "how_to_cook", display_name: title)
      c.display_name.should == title
    end

    it "has an href" do
      subject.href.should == "/lessons/how_to_cook"
    end

    it "has lessons" do
      subject.lessons.map(&:name).should == ["scramble_eggs", "boil_water"]
    end

    it "can find a lesson by name" do
      subject.lesson_named("boil_water").name.should == "boil_water"
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

    describe 'next_labs' do
      it "returns one lab" do
        subject.next_labs("scramble_eggs").map(&:name).should == ["egg_lab"]
      end
      it "returns two labs" do
        subject.next_labs("boil_water").map(&:name).should == ["turn_on_stove", "boiling"]
      end
    end

    describe 'labs' do
      it 'should include slide labs' do
        subject.labs.map(&:name).should include("using faucets")
      end
      it 'should include declared labs (next_labs)' do
        subject.labs.map(&:name).should include("turn_on_stove", "boiling")
      end
    end
  end

  describe 'videos' do
    it "can be set during course declaration" do
      course = Course.new(name: "course") do
        lesson "lesson" do
          video "video1"
          video "video2"
        end
      end
      lesson = course.lesson_named "lesson"
      lesson.instance_variable_get(:@videos).should == ["video1", "video2"]
    end
  end

  describe 'without markdown lesson files' do
    subject {
      Course.new(name: "gaming") do
        lesson "shooters"
      end
    }
    let(:lesson) { subject.lesson_named "shooters" }
    it "still works" do
      expect(lesson.slides).to eq([])
    end
  end

end

