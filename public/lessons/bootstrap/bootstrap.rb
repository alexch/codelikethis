require "track"

require_relative '../../../lib/link.rb'

class Track
  Bootstrap = Track.new(
    name: "bootstrap",
    display_name: "Responsive Layout with Twitter Bootstrap",
    description: "When Twitter released its Bootstrap framework, the Web got a makeover. Suddenly developers had the ability to make web sites with a clean, standard, modern look and feel, with rules for grid layout much clearer than 'divs and floats'."
  ) do

    link href: '/lessons/responsive_layout',
         description: "Responsive Layout with HTML5+: Divs, Floats, Flexbox, Grid"

    lesson name: '/responsive_layout/responsive_intro'

    lesson name: "bootstrap_development",
           display_name: "Introduction to Bootstrap" do
      link href: "https://getbootstrap.com/docs/4.0/getting-started/introduction/",
           name: "Bootstrap Introduction"
      link href: 'https://learn.freecodecamp.org/front-end-libraries/bootstrap',
           name: 'Bootstrap - FreeCodeCamp Introduction'
    end

    lesson name: "bootstrap_webpage",
           display_name: "Going Further With Bootstrap" do
      link href: "https://medium.freecodecamp.org/learn-bootstrap-4-in-30-minute-by-building-a-landing-page-website-guide-for-beginners-f64e03833f33",
           name: "Building a Portfolio Page with Bootstrap"
    end

    lesson name: '/responsive_layout/navigation'

    lesson name: "bootstrap_components",
      description: "buttons, nav bars, drop-downs, breadcrumbs, site maps, anchors, accordions, etc."

    lesson name: "/responsive_layout/css_frameworks"
  end
end
