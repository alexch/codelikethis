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

end
