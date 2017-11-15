require 'erector'
require 'bootstrap_page'

class AppPage < BootstrapPage

  def logo klass: nil, style: nil
    a(href: '/') {
      img.logo(src: '/images/logo.png',
               alt: "Code like this.",
               href: '/',
               class: ['logo', klass].compact,
               style: [style].compact)
    }
  end

  def navbar_brand_content
    logo style: 'height: 3rem'
  end

  def navbar_items
    nav_item name: "Blog", href: "http://codelikethis.tumblr.com"
    nav_item name: "Lessons", href: "/lessons"
    nav_item name: "Test First", href: "http://testfirst.org/"
    nav_item name: "Labs", href: "http://testfirst.org/live"
    nav_item name: "Alex", href: "http://alexchaffee.com"

    # widget DonateButton
  end

  def body_content

    navbar_content

    #todo: add 'main' element type to Erector
    element('main', class: [:container]) {
      call_block
      widget @widget if @widget
      div.pre_footer {
      }
    }

    div.footer {
      text "Unless otherwise noted, all contents copyright ", raw('&copy;'), " 2013-2017 by "
      a "Alex Chaffee.", href: "http://alexchaffee.com"
      br
      rawtext <<-HTML
      <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">"Code Like This"</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://codelikethis.com" property="cc:attributionName" rel="cc:attributionURL">Alex Chaffee</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
      HTML
      br style: "clear:both"
      br
      p do
        text "This site built on "
        a "Sinatra", href: "http://sinatrarb.com"
        text ", "
        a "Erector", href: "http://erector.rubyforge.org"
        text ", "
        a "Deck", href: "https://github.com/alexch/deck.rb"
        text ", "
        a "Bootstrap", href: "https://getbootstrap.com"
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
