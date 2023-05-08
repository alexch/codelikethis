require 'date'
require "wrong"
require "spec_helper"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require File.join(project, "app")
require File.join(project, "lib/lesson")

# weird to be loading the public tracks here
require File.join(project, "public/lessons/ruby/ruby")

describe AppHelpers do
  include AppHelpers

  describe 'page_title' do
    example { expect(page_title("Foo")).to eq("Foo") }
    example { page_title("Foo", "bar").should == "Foo bar" }

    let(:track) { Track::Ruby }
    let(:lesson) { track.lesson_named "bad_names" }

    example { page_title(track).should == "Ruby Topics" }
    example { page_title(lesson).should == "Bad Names" }
  end
end
