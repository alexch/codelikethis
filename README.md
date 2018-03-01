codelikethis
============

source for [Code Like This](http://www.codelikethis.com) web site

see [todo.md](todo.md) for some todo items

## Setup

First, make your own fork, and [install Ruby](http://installfest.railsbridge.org/installfest/) and [git](https://git-scm.com/) on your computer. Then...

1. `git clone XXX` (where XXX is your personal github repo URL)
2. `cd codelikethis`
3. `gem install bundler`
4. `bundle install`
5. `rake spec` (to run all tests and verify setup)
6. `rake build` (to compile CSS)
7. `rake run` (or `rake rerun` to rebuild/restart on file changes) 
8. open <http://localhost:9292>

## Usage

SCSS is currently built using Sass. Run this all the time in development, or at least once before deploy after you change anything:

    rake build

|Command|Description|
|---|---|
|`rake spec` | run all tests and verify setup |
|`rake build` | compile CSS |
|`rake run` | run local server on <http://localhost:9292>  |
|` bundle exec rake rerun` |run with rebuild/restart on file changes, making sure to use the right version of rerun |

## Layout 

|Path|Description|
|---|---|
|`./app.rb` | main app |
|`./config.ru` | app config |
|`lib` | ruby source code |
|`lib/thing.rb::WEIRD_WORDS` | list of oddly-capitalized words (e.g. CSS, JavaScript) |
| `lib/bootcamp.rb` | ruby Site describing the Bootcamp course(s) |
| `lib/bootcamp-schedule.json` | JSON describing the Bootcamp course schedule |
|`spec` | ruby test source code |
|`public` | web-visible files |
|`public/images` | web site images |
|`public/js`     | web site scripts |
|`public/css`    | web site css files -- **do not edit** these directly! |
|`public/scss`    | web site sass source files, compiled into public/css |
|`public/lessons` | course files (markdown and images), organized by track |
|`public/lessons/trackname.rb`  | track description files; names match public/lessons subdirs |
|`public/lessons/trackname/` | course files (markdown and images), organized by track |
|`public/lessons/trackname/baking.md` | markdown slides for a single lesson named `baking` (served from `/lessons/trackname/bake_cookies` URL path) |
|`public/projects/bake_cookies.md` | markdown slides for a single project named `bake_cookies` (served from `/projects/bake_cookies` URL path) |

## Sites

a Site is

  * a hostname
  * an ordered collection of Tracks
  * a home page
  * a schedule
  
Currently there are two Sites:

1. CodeLikeThis <http://codelikethis.com> - the main site, containing all Tracks (listed in alphabetical order)
2. Bootcamp <http://bootcamp.burlingtoncodeacademy.com> - the site for *Burlington Code Academy's 2018 Web Development Bootcamp*, which runs from June through August in (where else?) Burlington, Vermont 

Both sites are served from the same web application instance, running on Heroku (<http://codelikethis.herokuapp.com>). The app looks at `request.host` and serves a different Site to each hostname.

To add a Site, follow the example of [Bootcamp](lib/bootcamp.rb).

To view a Site locally, use a `site` parameter, e.g. <http://localhost:9292/?site=bootcamp>. This parameter is *not* propagated to new pages so you'll have to keep adding it explicitly to test different pages.

## Adding a Track

1. Decide on its name. Its name is a `camelcase_word` that will automatically turn into titlecase when displayed. (e.g.  `cook_food` => `Cook Food`)
2. define a `Track` subclass in a new file inside `public/tracks` (e.g. `public/tracks/cook_food.rb`) and create a new subdir inside `public/lessons` (e.g. `public/lessons/cook_food/`)
3. declare your lessons inside the track file. Look at the existing `.rb` files inside `public/tracks` for examples.
4. for each Lesson, put its slides in a markdown file with its name in the lessons directory (e.g. `public/lessons/cook_food/stirfry.md`)
5. add the Track to your Site by following the example of [Bootcamp](lib/bootcamp.rb)

## Projects

Currently a project consists of a markdown file in the `public/projects/` directory e.g. `public/projects/foo.md`. It is viewable via the path `/projects/foo` (note the lack of file extension).

To declare a project is a bit scattershot. It can be referenced in several places:

1. in the schedule JSON attached to a given week
2. in a Lesson file (not the slides markdown)
3. in a Track file, directly under the Track
4. in a Track file, nested under a Lesson


