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
|`rake rerun` |run with rebuild/restart on file changes|

## Layout 

|Path|Description|
|---|---|
|./app.rb | main app |
|./config.ru | app config |
|lib | ruby source code |
|spec | ruby test source code |
|public | web-visible files |
|public/images | web site images |
|public/js     | web site scripts |
|public/css    | web site css files -- **do not edit** these directly! |
|public/scss    | web site sass source files, compiled into public/css |
|public/lessons | course files (markdown and images), organized by track |
|public/tracks  | track description files; names match public/lessons subdirs |
|public/meta    | notes about specific classes, viz. our summer bootcamp |

