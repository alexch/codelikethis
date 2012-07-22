require 'erector'

class AppPage < Erector::Widgets::Page
  def font font_name
    link rel: "stylesheet", href: "/#{font_name}.css", type: "text/css", charset: "utf-8"
  end

  def head_content
    font "Museo500"
    style raw(<<-CSS)
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
      .nav a {
        text-decoration: none;
      }
      .nav a:visited {
        color: black;
      }

      .main {
        margin-left: 2em;
        font-family: 'Helvetica Neue', Helvetica, Arial, Sans;
        max-width: 60em;
      }

      section.slide {
        border-top: 1px solid #ddd;
        padding-left: 1em;
        margin-bottom: 2em;
      }
      section.slide > h2:first-child {
        margin: 2px 0 2px -4px;
        font-size: 2em;
        text-shadow: #ddd 0.1em 0.1em 0.1em;
      }
      section.slide > h1 {
        font-size: 3em;
      }
      section.slide.subsection {
        border-top: 2px solid blue;
      }
      section.slide.subsection > h2:first-child {
        font-size: 3em;
      }
      section.slide blockquote {
        font-style: italic;
        border-left: 2px solid #ddd;
        padding-left: 1em;
      }
    CSS
  end

  def body_content
    div.header {
      span.logo { a "Code like this.", href: '/' }
      span.tagline "opinionated expertise"
    }
    div.nav {
      ul {
        li "Blog"
        li {
          a "Lessons", href: "/lessons"
        }
        li "Labs"
      }
    }
    div.main {
      call_block
      widget @widget if @widget
    }
  end
end
