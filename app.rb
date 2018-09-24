require 'sinatra/base'
require 'erector'
require 'deck/slide'
require 'deck/slide_deck'
require 'deck/rack_app'

# add "lib" dir to Ruby load path
here = ::File.expand_path(File.dirname(__FILE__))
lib = "#{here}/lib"
$: << lib

require 'util'
require "hash_extensions"
# require_all(lib)

require 'site'
require 'app_page'
require 'tracks_table'
require 'tracks_sidebar'
require 'markdown_widget'

module AppHelpers
  def page_title object, extra = nil
    [
      (object.display_name rescue object.to_s),
      extra,
      "- Code Like This"
    ].compact.join(' ')
  end
end

class App < Sinatra::Base
  include Erector::Mixin
  include AppHelpers

  before do
    Thread.current[:development_mode] = (request.host =~ /^localhost$/)
  end

  after do
    Thread.current[:development_mode] = nil
  end

  def site
    @site ||= create_site
  end

  def tracks_widget
    # TracksTable.new(:tracks => site.tracks)
    TracksSidebar.new(tracks: site.tracks, current: nil)
  end

  def page(widget:, title:, sidebar: false)
    AppPage.new(site: site, warning: @warning, widget: widget, title: title, sidebar: sidebar)
  end

  get '/host' do
    content_type "text/plain"
    {
      SERVER_NAME: request.env["SERVER_NAME"],
      host: request.host,
    }.ai
  end

  get '/lessons' do
    page(
      widget: tracks_widget,
      title: page_title("Lessons")).to_html
  end

  get '/' do
    page(
      widget: site.view,
      sidebar: true,
      title: "Code Like This").to_html
  end

  get "/lessons/:track" do
    page(widget: track.view,
         title: page_title(track)).to_html
  end

  get "/lessons/:track/:lesson.slides" do
    # slides are signified with a dot instead of a slash so that relative file references don't break

    track = site.track_named(params[:track])

    if track
      file = File.join(lesson.dir, "#{params[:lesson]}.md")

      if not File.exist?(file)
        not_found
        return
      end

      slides = Deck::Slide.from_file(file)
      slides << begin
        slide = Deck::Slide.new(slide_id: '_next')

        lesson = track.lesson_named(params[:lesson])

        slide << lesson.view.to_html(content_method_name: :labs)
        slide << lesson.view.to_html(content_method_name: :next_lesson_button)
        slide << lesson.view.to_html(content_method_name: :previous_lesson_button)

        slide << "<p><a href='#{lesson.href}'>Outline</a></p>"
        slide
      end
    end

    deck_page = Deck::SlideDeck.new(:slides => slides,
                                    :title => page_title(lesson, "Slides"),
                                    # :stylesheets => ["/css/github-markdown.css"],
    )
    deck_page.to_html
  end

  get "/lessons/:track/:file.:ext" do
    send_file(File.join(track_dir, "#{params[:file]}.#{params[:ext]}"))
  end

  get "/lessons/:track/:lesson" do
    page(
      widget: lesson.view,
      title: lesson.display_name + " - Code Like This").to_html
  end

  get "/projects" do
    page(widget: site.projects_view, title: 'Projects - Code Like This').to_html
  end

  get "/projects/:file.:ext" do
    path = File.join(here, "public", "projects", "#{params[:file]}.#{params[:ext]}")
    send_file(path)
  end

  get "/projects/:project_name" do
    project = Project.new(name: params[:project_name])
    page(
      widget: project.view,
      title: page_title("Project")).to_html

  end

  get "/schedule" do
    widget = site.schedule_view if (site && site.schedule)
    page(widget: widget,
         title: site.name).to_html
  end

  get "/topics/:topic_name" do
    # todo: make this actually work
    topic = Topic.new(name: params[:topic_name])
    page(
      title: "Topic: #{topic.display_name}",
      widget: Topic::View.new(site: site, target: topic)
    ).to_html
  end

  def track_dir
    track.dir
  end

  def track
    begin
      Track.named(params[:track])
    rescue NameError => e
      $stderr.puts(e)
      $stderr.puts "\t" + e.backtrace.join("\n\t")
      not_found
    end
  end

  def lesson
    track.lesson_named(params[:lesson] || params[:file])
  end

  private

  def create_site
    sitename = params['site'] || request.host
    site = [CodeLikeThis, Bootcamp, JavascriptNights].map(&:new).detect do |site|
      site.host? sitename
    end
    if site.nil?
      @warning = "No site found for #{sitename}; using CodeLikeThis content."
      site = CodeLikeThis.new
    end
    site
  end

  def here
    File.expand_path(File.dirname(__FILE__))
  end

end

