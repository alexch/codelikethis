require 'track'

require_relative '../../../lib/link.rb'

Track::Prerequisites = Track.new(
  name: 'prerequisites',
  display_name: 'Prerequisites',
  description: 'Lessons and exercises to complete before the first day of class.'
) do

  lesson name: 'prerequisites'

  project name: 'installfest'

  link href: 'https://learn.freecodecamp.org/responsive-web-design/basic-html-and-html5'
  link href: 'https://learn.freecodecamp.org/responsive-web-design/basic-css'
  link href: 'https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript'
  link href: 'https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/es6'
  link href: 'https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-data-structures'
  link href: 'https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-algorithm-scripting'
  link href: 'https://learn.freecodecamp.org/responsive-web-design/applied-visual-design'
end
