require "wrong"
require "files"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/thing"

describe Thing do

  describe "when titlecasing" do
    it "capitalizes" do
      expect(Thing.new(name: "agile development").display_name).to eq("Agile Development")
    end

    it "capitalizes words" do
      expect(Thing.new(name: "ice_cream").display_name).to eq("Ice Cream")
    end


    it "knows some funky-cap words" do
      expect(Thing.new(name: "jquery").display_name).to eq("jQuery")
      expect(Thing.new(name: "javascript").display_name).to eq("JavaScript")
      expect(Thing.new(name: "api").display_name).to eq("API")
      expect(Thing.new(name: "apis").display_name).to eq("APIs")
      expect(Thing.new(name: "calling_apis").display_name).to eq("Calling APIs")
    end

    pending "knows some hyphenated phrases" do
      expect(Thing.new(name: "object_oriented").display_name).to eq("Object-Oriented")

    end
  end

  it "has a default name" do
    subject.name.should == "Thing"

    expect(Thing.new(name: "ice_cream").name).to eq("ice_cream")
  end

  it "has a display_name based on its name" do
    subject.display_name.should == "Thing"
    expect(Thing.new(name: "ice_cream").display_name).to eq("Ice Cream")
  end

  it "instance_evals a block in its constructor" do
    whoami = nil
    ice_cream = Thing.new(name: "ice_cream") do
      whoami = self
    end
    expect(whoami).to eq(ice_cream)
  end

  require "link"

  it "can initialize things as instance variables in its ctor block" do
    ice_cream = Thing.new(name: "ice_cream") do
      link href: "http://benandjerrys.com"
    end
    comparand = Link.new(href: "http://benandjerrys.com")
    expect(ice_cream.links).to eq([comparand])
  end

end
