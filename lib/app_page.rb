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
    link({:rel => "stylesheet", :href => "/stylesheets/#{src}.css"}.merge(attributes))
  end

  def body_scripts
    script src: "/bower_components/jquery/dist/jquery.min.js"
    script src: "/bower_components/foundation/js/foundation.min.js"
    script src: "/js/app.js"
  end

  def head_content
    super

    meta charset: "utf-8"
    meta name: "viewport", content: "width=device-width, initial-scale=1.0"
    stylesheet "app"
    script src: "/bower_components/modernizr/modernizr.js"

    font "Museo500"
    stylesheet "coderay"
    stylesheet "codelikethis"
  end

  def body_content
    div.header {
      widget DonateButton
      span.logo { a "Code like this.", href: '/' }
      span.tagline "You can learn to code. Here's how!"
    }
    div.nav {
      ul {
        li {
          a "Blog", href: "http://codelikethis.tumblr.com"
        }
        li {
          a "Lessons", href: "/lessons"
        }
        li {
          a "Test First", href: "http://testfirst.org/"
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
      div.pre_footer {

      }
    }
    div.footer {
      text "Unless otherwise noted, all contents copyright ", raw('&copy;'), " 2013 by "
      a "Alex Chaffee.", href: "http://alexchaffee.com"
      br
      rawtext <<-HTML
      <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US"><img style="float: right" alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">"Code Like This"</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://codelikethis.com" property="cc:attributionName" rel="cc:attributionURL">Alex Chaffee</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
      HTML
      br style: "clear:both"
      p do
        text "This site built on "
        a "Sinatra", href: "http://sinatrarb.com"
        text ", "
        a "Erector", href: "http://erector.rubyforge.org"
        text ", "
        a "Deck", href: "https://github.com/alexch/deck.rb"
        text ", and so on."
      end
    }

    body_scripts
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
