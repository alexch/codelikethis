require "wrong"
require "files"
require "spec_helper"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/track"

describe Track do

  include Files

  describe "by default" do

    subject {Track.new}

    it "has a default name" do
      subject.name.should == "track"
    end

    it "has no description" do
      subject.description.should be_nil
    end
  end

  it "takes a list of lesson names" do
    lessons = Track.new do
      lesson name: "foo"
      lesson name: "bar"
    end
    lessons.lesson_names.should == ["foo", "bar"]
  end

  it "renders HTML" do
    track = Track.new do
      lesson name: "foo"
      lesson name: "bar"
    end

    track.dir = files.dir "foo" do
      file "foo.md"
      file "bar.md"
    end

    breadcrumbs = Breadcrumbs.new(display_name: "Track", parents: [TracksTable.new])
    html = track.view.to_html
    html.should include(breadcrumbs.to_html)
    html.should include("<a href=\"/lessons/track/foo#content\"")
    html.should include("Foo")
    html.should include("<a href=\"/lessons/track/bar#content\"")
    html.should include("Bar")
  end

  describe 'with markdown lesson files' do

    subject {

      track = Track.new(name: "how_to_cook",
                          description: "learn how to cook with these great tips",
                          ) do

        goal "boil water"
        goal "scramble eggs"
        link href: "http://cooking.com"

        lesson name: "scramble_eggs"
        lab name: "egg_lab"
        lesson name: "boil_water"
        lab name: "turn_on_stove"
        lab name: "boiling"
      end

      track.dir = files.dir "how_to_cook" do
        file "scramble_eggs.md"
        file "boil_water.md", <<-MD
# water
water is a molecule
# LAB: using faucets
fill a glass of water at the sink
        MD
      end

      track
    }

    it "can have a description" do
      subject.description.should == "learn how to cook with these great tips"
    end

    it "can have a list of goals" do
      subject.goals.should == [
          "boil water",
          "scramble eggs",
          ]
    end

    it "can have a list of links" do
      subject.links.should == [
          Link.new(href: "http://cooking.com")
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
      c = Track.new(name: "how_to_cook", display_name: title)
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
    it "can be set during track declaration" do
      track = Track.new(name: "track") do
        lesson name: "lesson" do
          video youtube_id: "video1"
          video youtube_id: "video2"
        end
      end
      lesson = track.lesson_named "lesson"
      lesson.videos.map(&:youtube_id).should == ["video1", "video2"]
    end
  end

  describe 'without markdown lesson files' do
    subject {
      Track.new(name: "gaming") do
        lesson name: "shooters"
      end
    }
    let(:lesson) { subject.lesson_named "shooters" }
    it "still works" do
      expect(lesson.slides).to eq([])
    end
  end

end
