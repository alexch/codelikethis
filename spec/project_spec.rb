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

  context 'extra styling' do
    it 'puts boxes around stories' do
      project = Project.new(content: <<-MARKDOWN)
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
      project.view.to_html.should include(<<-HTML)
<section class="box">

<h2>Slay the Dragon</h2>

<p><strong>Given</strong> a dragon</p>

<p><strong>Then</strong> it should be dead</p>

</section>
      HTML

    end
  end

end
