require 'erector'
require 'awesome_print'
require 'views'
require 'util'
require 'nav_bar'

class AppPage < Erector::Widgets::Page

end

class ThingPage < AppPage

  needs :site
  needs :thing
  needs warning: nil
  needs sidebar: nil
  needs breadcrumbs: nil

  include Views

  def doctype
    '<!DOCTYPE html>'
  end

  def html_attributes
    {lang: 'en'}
  end

  def page_title
    @page_title ||
    [
        (@thing and @thing.display_name),
        (@site and @site.display_name)
    ].compact.uniq.join(' - ')
  end

  # todo: promote into Page
  # font_name: if nil, use href param
  # href: if nil or default, use local path /name.css
  def font name: nil, href: nil
    raise "name or href param required" unless (name or href)
    href ||= "/#{name}.css"
    link rel: "stylesheet", href: href, type: "text/css", charset: "utf-8"
  end

  def head_content
    super

    meta charset: "utf-8"
    meta name: "viewport", content: "width=device-width, initial-scale=1, shrink-to-fit=no"
    if (@thing and @thing.description)
      meta name: 'description', content: @thing.description
    end
    if (@thing and @thing.topics and @thing.topics?)
      meta name: 'keywords', content: @thing.topics.map(&:name).join(',')
    end

    stylesheet href: "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css",
               integrity: "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T",
               crossorigin: "anonymous"
    stylesheet name: 'app'

  end

  def body_scripts
    script defer: "defer",
           src: "https://code.jquery.com/jquery-3.4.1.slim.min.js",
           integrity: "sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=",
           crossorigin: "anonymous"

    script defer: "defer",
           src: "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js",
           integrity: "sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM",
           crossorigin: "anonymous"

    script defer: "defer",
           src: "https://cdn.jsdelivr.net/combine/npm/@fortawesome/fontawesome-free@5.8.2,npm/@fortawesome/fontawesome-free@5.8.2/js/solid.min.js",
           crossorigin: "anonymous"

    script defer: "defer",
           src: "/js/app.js"
  end

  def footer_content
    p(rawtext <<-HTML)
    <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">"Burlington Code Academy Curriculum"</span> by <a xmlns:cc="https://creativecommons.org/ns#" href="https://burlingtoncodeacademy.com" property="cc:attributionName" rel="cc:attributionURL">Burlington Code Academy</a>
    is licensed under:
    <br /><a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
    <br />
    <a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US">
    <img alt="Creative Commons License" style="border-width:0" src="/images/by-cs-sa-license.png" />
    </a>
    <br />
    HTML
    br style: "clear:both"
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

  def outline?
    @thing and @thing.view.respond_to?(:outline)
  end

  def rightbar_content
    if outline?
      widget @thing.view, {}, content_method_name: :outline
    end
  end


  def breadcrumbs
    if @thing.view.respond_to? :breadcrumbs
      section(class: 'breadcrumbs container') do
        widget @thing.view, {}, content_method_name: :breadcrumbs
      end
    end
  end

  def body_content

    # top nav
    widget @site.navbar

    element('main', class: 'container') {
      div(class: "bc-back-forthl") do
        breadcrumbs
      end
      div(class: "row first") {
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
        div(class: "col-md-#{center_cols}", id: "welcome") {
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

          widget @thing.view if @thing

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

  external :script, google_analytics_code('UA-23417120-3')
end
