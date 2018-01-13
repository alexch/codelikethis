require "wrong"
require "files"

here = File.expand_path(File.dirname(__FILE__))
project = File.expand_path("#{here}/..")

require "#{project}/lib/link"

describe Link do

  it "uses the href for the name/display_name if missing" do
    link = Link.new(href: "http://benandjerrys.com")

    expect(link.name).to eq("http://benandjerrys.com")

    expect(link.display_name).to eq("http://benandjerrys.com")
  end

end
