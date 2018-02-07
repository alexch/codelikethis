require 'erector'
require 'awesome_print'
require 'views'

class AppPage < Erector::Widgets::Page

  needs :site, :widget, :title

  include Views

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
  # font_name: if nil, use href param
  # href: if nil or default, use local path /name.css
  def font name: nil, href: nil
    raise "name or href param required" unless (name or href)
    href ||= "/#{name}.css"
    link rel: "stylesheet", href: href, type: "text/css", charset: "utf-8"
  end

  # todo: promote into Page
  def stylesheet attributes = {}
    href = if attributes[:href]
             href
           elsif attributes[:name]
             "/css/#{attributes[:name]}.css"
           else
             raise "requires either a name or an href"
           end
    link_attributes = {rel: "stylesheet", href: href}.merge(attributes)
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

    font name: "Museo500"
    font href: "https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700|Raleway:600"

    stylesheet name: "coderay"
    stylesheet name: "github-markdown"

    # load this application's CSS from /css/app.css
    stylesheet name: "app"

    # todo: parameterize using CDN vs local file for jQuery
    script src: "https://code.jquery.com/jquery-3.2.1.slim.min.js",
           integrity: "sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN",
           crossorigin: "anonymous"

    # todo: use local file for jQuery if CDN failed
    # todo: parameterize location of local file
    # script raw("window.jQuery || document.write('<script src=\"../../../../assets/js/vendor/jquery.min.js\"><\/script>');")

    # todo: parameterize using CDN vs local file for Popper
    script src: "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js",
           integrity: "sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh",
           crossorigin: "anonymous"

    # todo: parameterize using CDN vs local file for Bootstrap
    script src: "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js",
           integrity: "sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ",
           crossorigin: "anonymous"

    # fontawesome is now SVGs
    script defer: 'defer',
           src: '/js/fontawesome-all.js'

    script raw(<<-JS)
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});
    JS

  end

  def body_scripts
    # load this application's JS from /js/app.js
    script src: "/js/app.js"
  end

  def navbar_content
    nav(class: 'navbar navbar-expand-md fixed-top navbar-light') {
      div(class: 'container') {
        # div(class: ['row',
        #             'align-items-center', # means vertical centering
        # ]) {

          div(class: 'col navbar-left') {
            logo
          }

          # # hamburger button for top navbar
          button(class: 'navbar-toggler navbar-right navbar-toggler-right border-0',
                 type: 'button',
                 'data-toggle' => 'collapse',
                 'data-target' => '#pageNavbar',
                 'aria-controls' => 'navbarsExampleDefault',
                 'aria-expanded' => 'false',
                 'aria-label' => 'Toggle navigation') {
            span class: 'navbar-toggler-icon'
          }

          div(class: 'col collapse navbar-collapse navbar-right', id: 'pageNavbar') {
            ul(class: 'navbar-nav ml-auto align-items-center') {
              navbar_items
            }
          }
        }
      # }
    }
  end

  # render a single nav item (an `li` with class `nav-item`)
  def nav_item name: 'Item', href: '#', active: false, disabled: false, bordered: false, button: false
    li_css_classes = ['nav-item',
                      ('active' if active),
                      ('disabled' if disabled),
                      ('bordered' if bordered),
    ]
    li class: li_css_classes do
      a class: ['nav-link', ('btn btn-primary btn-sm' if button)],
        href: href do
        text name
        if active
          # be nice to the visually impaired
          span class: 'sr-only' do
            text '(current)'
          end
        end
      end
    end
  end

  def footer_content
    text "Unless otherwise noted, all contents copyright ", raw('&copy;'), " 2013-2018 foo "
    a "Alex Chaffee.", href: "http://alexchaffee.com"
    br

    rawtext <<-HTML
    <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">"Code Like This"</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://codelikethis.com" property="cc:attributionName" rel="cc:attributionURL">Alex Chaffee</a> 
    <br/>
    is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
    <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br />
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


  def navbar_items
    # nav_item name: "Home", href: "http://www.burlingtoncodeacademy.com/"

    nav_item name: "Bootcamp", href: "http://www.burlingtoncodeacademy.com/bootcamp/"
    nav_item name: "Hire Our Grads", href: "http://www.burlingtoncodeacademy.com/hiring-partners/"
    nav_item name: "Events", href: "http://www.burlingtoncodeacademy.com/events/"
    nav_item name: "News", href: "http://www.burlingtoncodeacademy.com/news/"
    nav_item name: "Blog", href: "http://www.burlingtoncodeacademy.com/blog/"
    nav_item name: "Apply Now", href: "http://www.burlingtoncodeacademy.com/apply/", button: true

    nav_item name: "Curriculum", href: "/"

    # nav_item name: "Lessons", href: "/lessons"
    # nav_item name: "Labs", href: "http://testfirst.org/live"
    # nav_item name: "Test First", href: "http://testfirst.org/"
    # nav_item name: "Alex", href: "http://alexchaffee.com"
  end

  require 'util'
  require_all('tracks')

  def all_tracks
    @site.tracks
  end

  def rightbar_content
    if @widget and @widget.respond_to?(:outline)
      widget @widget, {}, content_method_name: :outline
    else
      twitter
    end
  end

  def body_content

    # top nav
    navbar_content

    #todo: add 'main' element type to Erector
    element('main', class: 'container-fluid') {
      div(class: "row") {

        # first the sidebar
        div(class: "col-md-3", id: 'sidebar') {
          widget TracksSidebar.new(tracks: all_tracks, current: (@widget.respond_to? :target and @widget.target))
        }

        # now the real body
        div(class: "col-md-6") {
          a name: 'content'
          div(class: "row") {
            preview
          }

          call_block
          widget @widget if @widget

          div.pre_footer {

          }
        }

        # next the right-side (contents) sidebar
        div(class: "col-md-3", id: 'right-sidebar') {
          rightbar_content
        }

      }
    }

    center.footer(class: ['footer', 'navbar-light']) {
      footer_content
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
  private
  def preview
    p.preview {
      text "This site is a "
      b "preview"
      text " of the curriculum for our "
      a "Summer 2018 bootcamp", href: "http://burlingtoncodeacademy.com/bootcamp"
      text " in Burlington, Vermont. "
      text "As we continue our preparation, courses and lessons will appear and disappear; we will rename, rearrange, clarify, and obfuscate as needed... "
      text "Please consider this a work in progress and keep checking in."
    }
  end

end
