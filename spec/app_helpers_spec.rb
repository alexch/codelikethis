require 'date'
require "wrong"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require File.join(project, "app")
require File.join(project, "lib/lesson")

# weird to be loading the public courses here
require File.join(project, "public/courses/ruby")

describe AppHelpers do
  include AppHelpers

  describe 'page_title' do
    example { page_title("Foo").should == "Foo - Code Like This" }
    example { page_title("Foo", "bar").should == "Foo bar - Code Like This" }

    let(:course) { Course::Ruby }
    let(:lesson) { course.lesson_named "bad_names" }

    example { page_title(course).should == "Ruby Topics - Code Like This" }
    example { page_title(lesson).should == "Bad Names - Code Like This" }
  end
end
