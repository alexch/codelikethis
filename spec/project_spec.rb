require "files"
require "wrong"
require "spec_helper"

require "project"
require 'track'

describe Project do

  include Files

  let(:projects_dir) {
    files.dir "test_projects" do
      file "bake_cookies.md"
    end
  }

  let(:project) {
    Project.new(projects_dir: projects_dir,
                name: "bake_cookies")
  }

  it "has a name" do
    project.name.should == "bake_cookies"
  end

  it "has a title" do
    project.display_name.should == "Bake Cookies"
  end

  it "renders HTML" do
    project.view.to_html.should include("<p>contents of bake_cookies.md</p>")
  end

  describe "topics" do
    subject do
      Project.new do
        topic name: 'cooking'
      end
    end
    it "has a topic" do
      expect(subject.topics).to eq([Topic.new(name: 'cooking')])
    end
  end

  context 'from FreeCodeCamp' do
    let(:project) {
      Project.new(name: "bake_cookies",
                  from: 'FreeCodeCamp')
    }
    it "knows where it's from" do
      expect(project.from).to eq('FreeCodeCamp')
    end
    it "uses a foreign URL" do
      # TODO: fix FreeCodeCamp itself to allow links to challenges/lessons
      expect(project.href).to eq('https://beta.freecodecamp.org/en/challenges/basic-javascript/introduction-to-javascript')
    end
    xit "renders an icon" do
      expect(project.link_view.to_html).to include("fcc-fire-white.png")
    end
  end

  let(:dragon) {
    <<-MARKDOWN
# Stories

<!--box-->

## Slay the Dragon 

**Given** a dragon

**Then** it should be dead

<!--/box-->
                                  zork

## Tech

* blah
    MARKDOWN

  }

  context 'extra styling' do
    it 'puts boxes around stories' do
      project = Project.new(content: dragon)

      project.view.to_html.should include(<<-HTML)
<section class="box">

<p><a name='slay-the-dragon'></a></p>

<h2>Slay the Dragon</h2>

<p><strong>Given</strong> a dragon</p>

<p><strong>Then</strong> it should be dead</p>

</section>
      HTML

    end
  end

  context 'table of contents' do
    it 'is built from H2 lines' do
      project = Project.new(content: dragon)
      expect(project.sections).to eq ([
           {title: "Slay the Dragon", children: []},
           {title: "Tech", children: []},
      ])
    end

  end

  let(:solar_system) {
    <<-MARKDOWN
# Inner Solar System

## Mercury

## Venus

## Earth

### Luna

## Mars

### Phobos

### Deimos

#### Death Star

"That's no moon!"

    MARKDOWN
  }

  it 'nests one level (H2 - H3 but not H1 or H4)' do
    project = Project.new(content: solar_system)
    expect(project.sections).to eq ([
      {title: "Mercury", children: []},
      {title: "Venus", children: []},
      {title: "Earth",
       children: [
         {title: "Luna"}
       ]
      },
      {title: "Mars",
       children: [
         {title: "Phobos"},
         {title: "Deimos"}
       ]
      }
    ])
  end

end
