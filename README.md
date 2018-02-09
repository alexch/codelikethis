codelikethis
============

source for [Code Like This](http://www.codelikethis.com) web site

see [todo.md](todo.md) for some todo items

## Setup

1. `git clone`
2. `cd codelikethis`
3. `bundle install`
4. `rake spec` (to run all tests and verify setup)
5. `rake build` (to compile CSS)
6. `rake run` (or `rake rerun` to rebuild/restart on file changes) 
7. open <http://localhost:9292>

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
|`spec` | ruby test source code |
|`public` | web-visible files |
|`public/images` | web site images |
|`public/js`     | web site scripts |
|`public/css`    | web site css files -- **do not edit** these directly! |
|`public/scss`    | web site sass source files, compiled into public/css |
|`public/lessons` | course files (markdown and images), organized by track |
|`public/tracks`  | track description files; names match public/lessons subdirs |
|`public/meta`    | notes about specific classes, viz. our summer bootcamp |

## Sites

a Site is

  * a hostname
  * an ordered collection of Tracks
  * a home page
  
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

