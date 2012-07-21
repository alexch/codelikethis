require 'sinatra/base'
require 'erector'

here = File.expand_path(File.dirname(__FILE__))

$: << "#{here}/lib"
require "course"
require "ruby_for_programmers"

class App < Sinatra::Base
  include Erector::Mixin

  get '/lessons' do
    "<h1>Lessons:</h1>" + Course.new("/lessons/ruby.json").to_list

  end

  get '/' do
    erector {
      def font font_name
        link rel: "stylesheet", href: "#{font_name}.css", type: "text/css", charset: "utf-8"
      end

      html {
        head {
          font "Museo500"
          style <<-CSS
            body {
              font-family: 'Museo500Regular', 'Arial', 'Sans';
              margin: 0; padding: 0;
            }

            .header {
              padding: 0 6px;
              background: #C8D9E9;
            }
            .header a {
              text-decoration: none;
              color: black;
            }
            .header .logo {
              font-size: 32px;
              font-weight: bold;
            }
            .header .tagline {
              font-style: italic;
              padding-left: 1em;
            }
            .header {
              border-bottom: 1px solid black;
            }

            .nav ul {
              list-style-type: none;
              -webkit-margin-before: 0;
              -webkit-margin-after: 0;
              -webkit-margin-start: 0;
              -webkit-margin-end: 0;
              -webkit-padding-start: 0;
              padding: 1px 1em;
              border-bottom: 1px solid blue;
            }
            .nav ul li {
              display: inline;
              padding: 2px 20px;
              border-right: 1px solid blue;
            }
          CSS
        }
        body {
          div.header {
            span.logo { a "Code like this.", href: '/' }
            span.tagline "opinionated expertise, on demand"
          }
          div.nav {
            ul {
              li "Blog"
              li "Lessons"
              li "Labs"
            }
          }
          div.main {
            widget RubyForProgrammers.new
          }
        }
      }
    }
  end
end

