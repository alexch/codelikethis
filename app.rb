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

require 'app_page'
require 'home'
require 'tracks'
require 'tracks_table'
require 'tracks_sidebar'

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
    Thread.current[:development] = (request.host =~ /^localhost/)
  end

  after do
    Thread.current[:development] = nil
  end

  def all_tracks
    Tracks::ALL
  end

  def tracks_widget
    TracksTable.new(:tracks => all_tracks)
  end

  get '/host' do
    content_type "text/plain"
    {
      SERVER_NAME: request.env["SERVER_NAME"],
      host: request.host,
    }.ai
  end

  get '/lessons' do
    AppPage.new(:widget => tracks_widget, :title => page_title("Lessons")).to_html
  end

  get '/' do
    AppPage.new(:widget => Home, :title => "Code Like This").to_html
  end

  get "/lessons/:track" do
    AppPage.new(:widget => track.view, :title => page_title(track)).to_html
  end

  get "/lessons/:track/:file.slides" do
    # slides are signified with a dot instead of a slash so that relative file references don't break
    file = File.join(track_dir, "#{params[:file]}.md")
    slides = Deck::Slide.from_file(file)

    # todo: Extract, move to Tracks object
    track = all_tracks.detect do |track|
      track.name == params[:track]
    end

    if track
      slides << begin
        slide = Deck::Slide.new(slide_id: '_next')

        lesson = track.lesson_named(params[:file])

        slide << lesson.view.to_html(content_method_name: :labs)
        slide << lesson.view.to_html(content_method_name: :next_lesson_button)
        slide << lesson.view.to_html(content_method_name: :previous_lesson_button)

        slide << "<p><a href='#{lesson.href}'>Outline</a></p>"
        slide
      end
    end

    deck_page = Deck::SlideDeck.new(:slides => slides,
                                    :title => page_title(lesson, "Slides"))
    deck_page.to_html
  end

  get "/lessons/:track/:file.:ext" do
    send_file(File.join(track_dir, "#{params[:file]}.#{params[:ext]}"))
  end

  get "/lessons/:track/:lesson" do
    AppPage.new(:widget => lesson.view,
                :title => lesson.display_name + " - Code Like This").to_html
  end

  get "/meta/:file" do

    text = File.read(::File.join(here, 'public', 'meta', "#{params[:file]}.md"))
    content_type('text/html')
    AppPage.new(:widget => MarkdownWidget.new(text: text),
                :title => params[:file] + " - Code Like This").to_html
  end

  def track_dir
    ::File.join(here, "public", "lessons", params[:track])
  end

  def track
    begin
      track_constant_name = params[:track].split('_').map(&:capitalize).join
      track = Track.const_get(track_constant_name)
    rescue NameError
      not_found
    end
  end

  def lesson
    track.lesson_named(params[:lesson] || params[:file])
  end

  private
  def here
    File.expand_path(File.dirname(__FILE__))
  end

end

