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
    end

    pending "knows some hyphenated phrases" do
      expect(Thing.new(name: "object_oriented").display_name).to eq("Object-Oriented")

    end

  end

  it "has a default name" do
    subject.name.should == "thing"
  end

  it "instance_evals a block in its constructor" do
    whoami = nil
    lessons = Course.new(name: "lessons") do
      whoami = self
    end
    expect(whoami).to eq(lessons)
  end

end

