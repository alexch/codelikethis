require "track"

require_relative '../../lib/link.rb'

class Track
  ResponsiveLayout = Track.new(
    name: "responsive_layout",
    display_name: "Responsive Layout with Bootstrap and Grid",
    description: "When Twitter released its Bootstrap framework, the Web got a makeover. Suddenly developers had the ability to make web sites with a clean, standard, modern look and feel, with rules for grid layout much clearer than 'divs and floats'. More recently, the CSS Grid standard has been released, and it provides even more power and clarity than Bootstrap."
    ) do

    lesson name: "responsive_layout"
    lab name: 'FreeCodeCamp "Responsive Web Design"'

    lesson name: "bootstrap_intro" do
      link href: "https://blog.webkid.io/css-frameworks-bootstrap-alternatives/"
    end

    lesson name: "bootstrap_layout",
           display_name: "Page Layout with Bootstrap"
    lab name: 'FreeCodeCamp "Front End Libraries - Bootstrap"'

    lesson name: "page_layout_with_css_grid",
           display_name: "Page Layout with CSS Grid" do
      video youtube_id: '7kVeCqQCxlk'
      link href: "https://cssgridgarden.com",
           name: "Grid Garden",
           description: "a step-by-step game that teaches you CSS Grid"
    end

    lesson name: "responsive_layouts",
           display_name: "Web Design and Responsive Development"
    lab name: 'FreeCodeCamp "Responsive Web Design - Applied Visual Design"'

    lesson name: "navigation", description: "Nav bars, site maps, anchors, Bootstrap's responsive nav bar... [move to UX track?]"

    lesson name: "bootstrap_components", description: "buttons and accordions and such [move to UX track?]"

    project name: "pretty_profile", description: "now that you know how to use styles and layouts, gussy up your profile page"

    lesson name: "embedding",
           description: 'how to use Web APIs and embedded widgets to serve maps, videos, surveys, and other content from around the Web inside your own sites' do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/embedding-images-and-video"
    end

  end
end
