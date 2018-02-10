require "track"

class Track
  UserExperience = Track.new(
    name: "ux",
    display_name: "User Experience"
  ) do

    lesson name: "The Design Of Everyday Things"
    lesson name: "Principles of Web Design" do
      link href: "https://shortiedesigns.com/2014/03/10-top-principles-effective-web-design/"
    end
    lesson name: "Information Architecture and Site Maps"
    lesson name: "Wireframes and Mockups"
    lesson name: "Agile Design"
    lesson name: "User Research" do
      link href: "http://info.carbonfive.com/user-research-guide"
    end
    lesson name: "Paper Prototypes"

  end
end

# https://twitter.com/joeerl/status/951357931559284736

