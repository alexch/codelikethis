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
    lesson.display_name.should == "Bad Names"
  end

  it "renders HTML" do
    breadcrumbs = Breadcrumbs.new(:display_name => lesson.display_name, :parents => [Courses.new, course])
    lesson.to_html.should include(breadcrumbs.to_html)
  end

end
