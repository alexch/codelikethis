require 'erector'

class AppPage < Erector::Widgets::Page
  def page_title
    @title or super
  end

  # todo: promote into Page
  def font font_name
    link rel: "stylesheet", href: "/#{font_name}.css", type: "text/css", charset: "utf-8"
  end

  # todo: promote into Page
  def stylesheet src, attributes = {}
    link({:rel => "stylesheet", :href => src}.merge(attributes))
  end

  def head_content
    super
    font "Museo500"
    stylesheet "/coderay.css"
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
        font-size: 64px;
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
      .nav a:visited, .nav a {
        color: black;
      }

      .main {
        margin-left: 2em;
        font-family: 'Helvetica Neue', Helvetica, Arial, Sans;
        max-width: 56em;
        min-height: 30em;
      }

      .footer {
        text-align: center;
        border-top: 1px solid blue;
        background: #C8D9E9;
        font-size: 10pt;
        min-height: 2em;

      }

      section.slide {
        border-top: 1px solid #ddd;
        padding-left: 1em;
        margin-bottom: 2em;
      }
      section.slide h1, section.slide > h2:first-child {
        font-family: 'Helvetica Neue', Helvetica, Arial, Sans;
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

      .slide li {
        margin-bottom: .5em;
      }
      .slide li:first-child {
        margin-top: .5em;
      }

      .slide pre, code, kbd, samp {
        font-family:monospace, sans-serif;
        background: #f4f4f1;
      }
      .slide pre {
        white-space:pre;
        white-space:pre-wrap;
        word-wrap:break-word;
        padding: 1em;
        border:1px solid #ccc;
        display: inline-block; /* so it's only as wide as its contents */
      }
      .slide code {
        color:#444;
        padding: 0 3px;
      }

      .video {
        margin: 1em;
        padding: .5em;
        border: 6px solid gray;
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
        li {
          a "Blog", href: "#", onclick: "alert('no blog yet!')"
        }
        li {
          a "Lessons", href: "/lessons"
        }
        li {
          a "Labs", href: "http://testfirst.org/live"
        }
        li {
          a "Alex", href: "http://alexchaffee.com"
        }
      }
    }
    div.main {
      call_block
      widget @widget if @widget
    }
    div.footer {
      text "Unless otherwise noted, all contents copyright ", raw('&copy;'), " 2012 by "
      a "Alex Chaffee.", href: "http://alexchaffee.com"
    }
  end

  def self.google_analytics_code account_id
    <<-JAVASCRIPT
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', '#{account_id}']);
    _gaq.push(['_setDomainName', 'none']);
    _gaq.push(['_setAllowLinker', true]);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    JAVASCRIPT
  end

  external :script, google_analytics_code('UA-23417120-3')

end
