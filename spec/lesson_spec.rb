require "files"
require "wrong"
require "spec_helper"
require "lesson"
require 'track'

describe Lesson do

  include Files

  let(:track) {
    track = Track.new do
      lesson name: "scramble_eggs", description: "how to scramble"
      lab name: "egg_lab"
      lesson name: "boil_water"
      lab name: "turn_on_stove"
      lab name: "boiling"
      lesson name: "cooking_apis_with_nodejs"
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
  let(:lesson) { track.lesson_named "scramble_eggs" }

  it "has a name" do
    lesson.name.should == "scramble_eggs"
  end

  it "has a title" do
    lesson.display_name.should == "Scramble Eggs"
  end

  it "has a description" do
    lesson.description.should == "how to scramble"
  end

  it "renders HTML" do
    lesson.view.to_html.should include("<p>contents of scramble_eggs.md</p>")
  end

  it "has a next lab" do
    lesson.labs.map(&:name).should == ["egg_lab"]
  end

  it "includes slide-defined labs" do
    track.lesson_named("boil_water").labs.map(&:name).should include("using faucets")
  end

  it "has several next labs" do
    track.lesson_named("boil_water").labs.map(&:name).should include("turn_on_stove", "boiling")
  end

  it "capitalizes lesson names correctly" do
    expect(track.lesson_named("cooking_apis_with_nodejs").display_name).to eq("Cooking APIs with NodeJS")
  end

  describe 'videos' do
    subject { Lesson.new(track: track, name: "scramble_eggs") }
    it "can add a video" do
      subject.video youtube_id: "abcdefg"
    end
    it "shows up in the rendered HTML" do
      subject.video youtube_id: "abcdefg"
      subject.view.to_html.should include("http://www.youtube.com/embed/abcdefg")
    end
    it "can add more than one video" do
      subject.video youtube_id: "abcdefg"
      subject.video youtube_id: "12345"
      subject.view.to_html.should include("http://www.youtube.com/embed/abcdefg")
      subject.view.to_html.should include("http://www.youtube.com/embed/12345")
    end
  end

end
