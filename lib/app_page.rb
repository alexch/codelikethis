require 'erector'
require 'awesome_print'
require 'views'
require 'util'
require 'nav_bar'

class AppPage < Erector::Widgets::Page

  needs :site, :widget, :title
  needs warning: nil
  needs sidebar: nil

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

    font name: "fonts/Museo500"
    font href: "https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700|Raleway:600"

    stylesheet name: "coderay"
    stylesheet name: "github-markdown" # from https://github.com/sindresorhus/github-markdown-css/blob/gh-pages/github-markdown.css

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

  def footer_content
    text "This curriculum was created by Alex Chaffee and Burlington Code Academy, with significant contributions from Joshua Burke, Robin Hrynyszyn, Robin Rainwalker, and Benjamin Boas."

    # text "Unless otherwise noted, all contents copyright ", raw('&copy;'), " 2013-2018 "
    # a "Alex Chaffee.", href: "http://alexchaffee.com"
    br

    p(rawtext <<-HTML)
    <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">"Code Like This"</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://codelikethis.com" property="cc:attributionName" rel="cc:attributionURL">Alex Chaffee</a> 
    is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
    <br />
    <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US">
    <img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" />
    </a>
    <br />
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


  def all_tracks
    @site.tracks
  end

  def rightbar_content
    if outline?
      widget @widget, {}, content_method_name: :outline
      # else
      #   twitter
    end
  end

  def outline?
    @widget and @widget.respond_to?(:outline)
  end

  def body_content

    # top nav
    widget @site.navbar

    #todo: add 'main' element type to Erector
    element('main', class: 'container-fluid') {
      div(class: "row") {

        center_cols = 12
        # first the sidebar
        if @sidebar
          div(class: "col-md-3", id: 'sidebar') {
            widget TracksSidebar.new(tracks: all_tracks, current: (@widget.respond_to? :target and @widget.target))
          }
          center_cols -= 3
        end
        center_cols -= 3 if outline?

        # now the real body
        div(class: "col-md-#{center_cols}") {
          a name: 'content'

          if @warning
            div(class: 'row') {
              div(@warning, class: "warning alert alert-warning")
            }
          end

          if @site.view.respond_to? :notice
            div(class: 'row') {
              div(class: "notice alert alert-primary") {
                widget @site.view, {}, content_method_name: :notice
              }
            }
          end

          call_block
          widget @widget if @widget

          div.pre_footer {

          }
        }

        # next the right-side (contents) sidebar
        if outline?
          div(class: "col-md-3", id: 'right-sidebar') {
            rightbar_content
          }
        end

      }
    }

    footer(class: ['footer', 'navbar-light']) {
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
end
