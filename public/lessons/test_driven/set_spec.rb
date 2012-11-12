require "rspec"
here = File.dirname(__FILE__)
require "#{here}/my_set"

describe MySet do

  subject { MySet.new }

  it "should be empty" do
    subject.should be_empty
  end

  it "that contains anything is not empty" do
    subject.add("dog")
    subject.should_not be_empty
  end

  it "contains something after it's been added" do
    subject.add("dog")
    subject.contains?("dog").should be_true
  end

  it "does not contain something after it hasn't been added" do
    subject.contains?("dog").should be_false
  end

end
