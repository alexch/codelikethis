require "wrong"
require "files"
require "spec_helper"
require "wrong/adapters/rspec"

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

    it "knows some hyphenated phrases" do
      expect(Thing.new(name: "object_oriented").display_name).to eq("Object-Oriented")
    end

    it "preserves hyphens" do
      expect(Thing.new(name: "meet-cute").display_name).to eq("Meet-Cute")
    end

    it "keeps some words lowercased" do
      expect(Thing.new(name: "bread and butter").display_name).to eq("Bread and Butter")
      expect(Thing.new(name: "bread_and_butter").display_name).to eq("Bread and Butter")
      expect(Thing.new(name: "of_mice_and_men").display_name).to eq("Of Mice and Men")
      expect(Thing.new(name: "tricks_of_the_trade").display_name).to eq("Tricks of the Trade")
    end

    it "capitalizes quoted words" do
      expect(Thing.new(name: "the \"good\" place").display_name).to eq("The \"Good\" Place")
      expect(Thing.new(name: "the 'good' place").display_name).to eq("The 'Good' Place")
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

  describe "comparison - " do
    include Wrong
    class Dog < Thing
    end

    let(:rover1) {Dog.new(name: "rover")}
    let(:rover2) {Dog.new(name: "rover")}
    let(:fido) {Dog.new(name: "fido")}

    describe "things of the same subclass with the same name" do
      let(:rover1) {Dog.new(name: "rover")}
      let(:rover2) {Dog.new(name: "rover")}
      let(:fido) {Dog.new(name: "fido")}

      specify "are equal" do
        assert {rover1 == rover2}
        assert {rover1 != fido}
      end

      specify "have the same hash" do
        assert {rover1.hash == rover2.hash}
        assert {rover1.hash != fido.hash}
      end

      specify "work with set operators - and uniq" do
        assert {[rover1, fido] - [rover2] == [fido]}
        assert {[rover1, rover2, fido].uniq == [rover1, fido]}
      end
    end

    describe "things of different subclasses with the same name" do
      class Cat < Thing
      end
      let(:fido_the_cat) {Cat.new(name: "fido")}

      specify "are unequal" do
        assert { fido != fido_the_cat }
      end
      specify "have different hashes" do
        assert { fido.hash != fido_the_cat.hash }
      end
    end

  end

end
