require "track"

require_relative '../../../lib/link.rb'

class Track
  ResponsiveLayout = Track.new(
    name: "responsive_layout",
    display_name: "Responsive Layout with CSS",
    # description: "When Twitter released its Bootstrap framework, the Web got a makeover. Suddenly developers had the ability to make web sites with a clean, standard, modern look and feel, with rules for grid layout much clearer than 'divs and floats'. More recently, the CSS Grid standard has been released, and it provides even more power and clarity than Bootstrap."
  ) do

    lesson name: "css_layout",
           display_name: "Page Layout With CSS" do

      link href: "https://www.w3schools.com/css/exercise.asp?filename=exercise_positioning1",
           name: "W3Schools Positioning Exercise"
    end

    lesson name: "flexbox_layout",
           display_name: "Page Layout With CSS Flexbox" do
      link href: "https://flexboxfroggy.com",
           name: "Flexbox Froggy",
           description: "a step-by-step test-driven game that teaches you flexbox"
      link href: "https://medium.freecodecamp.org/an-animated-guide-to-flexbox-d280cf6afc35",
           name: "How Flexbox Works With Animated Images"
      link href: "https://medium.freecodecamp.org/learn-css-flexbox-in-5-minutes-b941f0affc34",
           name: "Learn CSS Flexbox in 5 Minutes"
      link href: "https://css-tricks.com/snippets/css/a-guide-to-flexbox"
      link href: "https://yoksel.github.io/flex-cheatsheet/#align-items"
    end

    lesson name: "responsive_intro",
           display_name: "Introduction to Responsive Development" do
      link href: "https://www.w3schools.com/html/html_responsive.asp",
           name: "W3Schools Responsive HTML Development"
      project name: 'mint_login',
              href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/html-forms",
              description: "this is actually a fairly advanced lab that asks you to create and style a login form like Mint.com's. It should be moved to a project, and we should have a lesson on basic FORM element creation and use."
    end

    lab name: 'FreeCodeCamp "Responsive Web Design"'

    lesson name: "css_grid",
           display_name: "Page Layout with CSS Grid" do
      video youtube_id: '7kVeCqQCxlk'
      link href: "https://mozilladevelopers.github.io/playground/css-grid/",
           name: "Mozilla CSS Grid Tutorial",
           description: "A thourough walk-through of CSS Grid and related tools"
      link href: "https://cssgridgarden.com",
           name: "Grid Garden",
           description: "a step-by-step game that teaches you CSS Grid"
    end

    lesson name: "navigation",
           description: "Nav bars, drop-downs, breadcrumbs, site maps, anchors" # todo: link to Bootstrap's responsive nav bar

    lesson name: "css_frameworks", display_name: "Other CSS Frameworks" do
      link href: "https://blog.webkid.io/css-frameworks-bootstrap-alternatives/"
    end

  end
end
