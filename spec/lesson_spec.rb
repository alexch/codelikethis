require "files"
require "wrong"
require "spec_helper"
require "lesson"
require 'track'

describe Lesson do

  include Files

  let(:track) {
    track_dir = files.dir "how_to_cook" do
      file "scramble_eggs.md"
      file "boil_water.md", <<-MD
    goal name: "apply heat to liquid"     
    topic name: "boil"
    link href: "http://example.com"

# water
water is a molecule
# LAB: using faucets
fill a glass of water at the sink
      MD
    end

    track = Track.new do
      self.dir = track_dir
      lesson name: "scramble_eggs", description: "how to scramble"
      lab name: "egg_lab"
      lesson name: "boil_water"
      lab name: "turn_on_stove"
      lab name: "boiling"
      lesson name: "cooking_apis_with_nodejs"
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

  describe "when defining stuff inside markdown" do

    let(:lesson) { track.lesson_named("boil_water") }

    it "includes slide-defined labs" do
      lesson.labs.map(&:name).should include("using faucets")
    end

    it "has several next labs" do
      lesson.labs.map(&:name).should include("turn_on_stove", "boiling")
    end

    it "has topics" do
      expect(lesson.topics.map(&:name)).to include("boil")
    end

    it "has goals" do
      expect(lesson.goals.map(&:name)).to include("apply heat to liquid")
    end

    it "has links" do
      expect(lesson.links.map(&:href)).to include("http://example.com")
    end
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
      subject.view.to_html.should include("https://www.youtube.com/embed/abcdefg")
    end

    it "can add more than one video" do
      subject.video youtube_id: "abcdefg"
      subject.video youtube_id: "12345"
      subject.view.to_html.should include("https://www.youtube.com/embed/abcdefg")
      subject.view.to_html.should include("https://www.youtube.com/embed/12345")
    end
  end

  describe "projects" do
    subject { Lesson.new(track: track, name: "scramble_eggs") do
      project name: "cook_breakfast"
    end
    }
    it "shows up" do
      subject.view.to_html.should include("Cook Breakfast")
    end
  end

  describe "topics" do
    subject do
      Lesson.new do
        topic name: 'cooking'
      end
    end
    it "has a topic" do
      expect(subject.topics).to eq([Topic.new(name: 'cooking')])
    end
  end

  describe "when initialized with a language option" do

    subject { Lesson.new(name: 'stuff', lang: 'python') }

    it "knows" do
      expect(subject.lang).to eq('python')
    end

    describe "munge_content" do
      let(:content) {
        <<-TEXT
<!IF lang=python>
    topic name: 'python3'
<!ELSE>
    topic name: 'node'
<!/IF>
        
# here is a slide

<!IF lang=python>
python stuff
<!ELSE>
javascript stuff
<!/IF>

more stuff

        TEXT
      }

      it "respects <!IF directives" do
        munged = subject.munge_content(content)
        expect(munged).to include("python stuff")
        expect(munged).not_to include("javascript stuff")
        expect(munged).to include("more stuff")

        expect(subject.topics.map(&:name)).to include("python3")
        expect(subject.topics.map(&:name)).not_to include("node")

        expect(munged).not_to include("<!IF")
        expect(munged).not_to include("<!ELSE>")
        expect(munged).not_to include("<!/IF>")
      end

      it "respects <!ELSE directives when no language is set" do
        subject = Lesson.new(name: 'stuff')

        munged = subject.munge_content(content)
        expect(munged).not_to include("python stuff")
        expect(munged).to include("javascript stuff")
        expect(munged).to include("more stuff")

        expect(subject.topics.map(&:name)).not_to include("python3")
        expect(subject.topics.map(&:name)).to include("node")

        expect(munged).not_to include("<!IF")
        expect(munged).not_to include("<!ELSE>")
        expect(munged).not_to include("<!/IF>")
      end

      it "respects <!ELSE directives when a different language is set" do
        subject = Lesson.new(name: 'stuff', lang: "javascript")

        munged = subject.munge_content(content)
        expect(munged).not_to include("python stuff")
        expect(munged).to include("javascript stuff")
        expect(munged).to include("more stuff")

        expect(munged).not_to include("<!IF")
        expect(munged).not_to include("<!ELSE>")
        expect(munged).not_to include("<!/IF>")
      end
    end
  end

end
