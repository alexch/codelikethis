require "wrong"
require "files"
require "spec_helper"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/site"

describe Site do

  include Files

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
      Puppy = Track.new(name: 'puppy')
    end

    class DogSite < Site
      def tracks
        [
            ::Track::Puppy,
            ::Track::Www # todo: make a test track, don't reuse a real track
        ]
      end
    end

    subject { DogSite.new }

    it "can find a track" do
      expect(subject.track_named('puppy')).to eq(::Track::Puppy)
    end

    it "can find a lesson by path" do
      expect(subject.lesson_named('/www/html')).to eq(::Track::Www.lesson_named('html'))
    end

    describe 'projects' do
      it 'should include projects inside nested lessons'
    end
  end

end
