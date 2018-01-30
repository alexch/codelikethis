require 'date'
require "wrong"
require "spec_helper"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require File.join(project, "app")
require File.join(project, "lib/lesson")

# weird to be loading the public tracks here
require File.join(project, "public/tracks/ruby")

describe AppHelpers do
  include AppHelpers

  describe 'page_title' do
    example { expect(page_title("Foo")).to eq("Foo - Code Like This") }
    example { page_title("Foo", "bar").should == "Foo bar - Code Like This" }

    let(:track) { Track::Ruby }
    let(:lesson) { track.lesson_named "bad_names" }

    example { page_title(track).should == "Ruby Topics - Code Like This" }
    example { page_title(lesson).should == "Bad Names - Code Like This" }
  end
end
