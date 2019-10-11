require "spec_helper"
require "site"

describe Site do

  describe "by default" do

    subject { Site.new }

    it "has a default name" do
      subject.name.should == "site"
    end

    it "has no description" do
      subject.description.should be_nil
    end

    it "has an href (although it will need to have the right domain name to form a distinct URL)" do
      subject.href.should == '/lessons'
    end
  end

  describe "as a specific site subclass" do

    class Track
      PuppyLove = Track.new(name: 'puppy_love')
    end

    class DogSite < Site
      def tracks
        [
            ::Track::PuppyLove,
            ::Track::Www # todo: make a test track, don't reuse a real track
        ]
      end
    end

    subject { DogSite.new }

    it "can find a track" do
      expect(subject.track_named('puppy_love')).to eq(::Track::PuppyLove)
    end

    it "can find a track with dashes" do
      expect(subject.track_named('puppy-love')).to eq(::Track::PuppyLove)
    end

    it "can find a lesson by path" do
      expect(subject.lesson_named('/www/html')).to eq(::Track::Www.lesson_named('html'))
    end

    describe 'projects' do
      it 'should include projects inside nested lessons'
    end
  end

end
