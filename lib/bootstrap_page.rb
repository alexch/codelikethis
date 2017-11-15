require 'erector'

# a Bootstrap 4 Page
class BootstrapPage < Erector::Widgets::Page

  def doctype
    '<!doctype html>'
  end

  def html_attributes
    {lang: 'en'}
  end

  def page_title
    @title or super
  end

  # todo: promote into Page
  def font font_name
    link rel: "stylesheet", href: "/#{font_name}.css", type: "text/css", charset: "utf-8"
  end

  # todo: promote into Page
  def stylesheet attributes = {}
    href = if attributes[:href]
             href
           elsif attributes[:name]
             "/stylesheets/#{attributes[:name]}.css"
           else
             raise "requires either a name or an href"
           end
    link_attributes = {:rel => "stylesheet", :href => href}.merge(attributes)
    link(link_attributes)
  end

  def head_content
    super

    meta charset: "utf-8"
    meta name: "viewport", content: "width=device-width, initial-scale=1, shrink-to-fit=no"

    # todo: parameterize bootstrap version
    # todo: parameterize using CDN vs local file
    stylesheet href: "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css",
               integrity: "sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb",
               crossorigin: "anonymous"

    # load this application's CSS from /stylesheets/app.css
    stylesheet name: "app"

    font "Museo500"
    stylesheet name: "coderay"
    stylesheet name: "codelikethis"
  end

  def body_scripts
    # todo: parameterize using CDN vs local file for jQuery
    script src: "https://code.jquery.com/jquery-3.2.1.slim.min.js",
           integrity: "sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN",
           crossorigin: "anonymous"

    # todo: use local file for jQuery if CDN failed
    # todo: parameterize location of local file
    # script raw("window.jQuery || document.write('<script src=\"../../../../assets/js/vendor/jquery.min.js\"><\/script>');")
    # emit "\n"

    # todo: parameterize using CDN vs local file for Popper
    script src: "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js",
           integrity: "sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh",
           crossorigin: "anonymous"

    # todo: parameterize using CDN vs local file for Bootstrap
    script src: "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js",
           integrity: "sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ",
           crossorigin: "anonymous"

    # load this application's JS from /js/app.js
    script src: "/js/app.js"
  end

  def logo klass: nil, style: nil
    a(href: '/') {
      img.logo(src: '/images/logo.png', alt: "Code like this.", href: '/',
               class: ['logo', klass].compact,
               style: [style].compact)
    }
  end

  # @override
  def navbar_brand_content
    text 'Navbar'
  end

  def navbar_content
    nav class: 'navbar navbar-expand-md fixed-top navbar-light bg-light' do
      a class: 'navbar-brand', href: '#' do
        navbar_brand_content
      end

      # hamburger button
      button :class => 'navbar-toggler',
             :type => 'button',
             'data-toggle' => 'collapse',
             'data-target' => '#pageNavbar',
             'aria-controls' => 'navbarsExampleDefault',
             'aria-expanded' => 'false',
             'aria-label' => 'Toggle navigation' do
        span :class => 'navbar-toggler-icon'
      end

      div :class => 'collapse navbar-collapse', :id => 'pageNavbar' do
        ul :class => 'navbar-nav ml-auto' do
          navbar_items
        end
        # navbar_search
      end
    end
  end

  # @override
  def navbar_items
    nav_item name: 'Home', active: true
    nav_item name: 'Disabled', disabled: true
    nav_dropdown
  end

  # todo: parameterize (this is lifted from the sample template)
  def nav_dropdown
    li :class => 'nav-item dropdown' do
      a :class => 'nav-link dropdown-toggle',
        :href => 'http://example.com',
        :id => 'dropdown01',
        'data-toggle' => 'dropdown',
        'aria-haspopup' => 'true',
        'aria-expanded' => 'false' do
        text 'Dropdown'
      end
      div :class => 'dropdown-menu', 'aria-labelledby' => 'dropdown01' do
        a :class => 'dropdown-item', :href => '#' do
          text 'Action'
        end
        a :class => 'dropdown-item', :href => '#' do
          text 'Another action'
        end
        a :class => 'dropdown-item', :href => '#' do
          text 'Something else here'
        end
      end
    end
  end

  def navbar_search
    form :class => 'form-inline my-2 my-lg-0' do
      input :class => 'form-control mr-sm-2', :type => 'text', :placeholder => 'Search', 'aria-label' => 'Search'
      button :class => 'btn btn-outline-success my-2 my-sm-0', :type => 'submit' do
        text 'Search'
      end
    end
  end

  # render a single nav item (an `li` with class `nav-item`)
  def nav_item name: 'Item', href: '#', active: false, disabled: false
    li_css_classes = ['nav-item']
    li_css_classes << 'active' if active
    li_css_classes << 'disabled' if disabled
    li class: li_css_classes do
      a class: 'nav-link', href: href do
        text name
        if active
          # be nice to the visually impaired
          span :class => 'sr-only' do
            text '(current)'
          end
        end
      end
    end
  end

  def body_content

    navbar_content

    main.main {
      call_block
      widget @widget if @widget
      div.pre_footer {

      }
    }

    div.footer {
      text "Unless otherwise noted, all contents copyright ", raw('&copy;'), " 2013-2015 by "
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
