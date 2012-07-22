require "wrong"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/lesson"
require "#{project}/lib/ruby"


describe Lesson do

  let(:course) { Ruby.new }
  let(:lesson) { Lesson.new(course, "bad_names") }

  it "has a name" do
    lesson.name.should == "bad_names"
  end

  it "has a title" do
    lesson.title.should == "Bad Names"
  end

  it "renders HTML" do
    lesson.to_html.should include(
        "<h2>" +
          "<span class=\"course\">" +
            "<a href=\"/lessons/ruby\">" +
              "Ruby" +
            "</a>" +
          "</span>" +
          " &gt; " +
          "<span class=\"lesson\">Bad Names</span>" +
        "</h2>")
  end

  Deck

end
