require 'erector'

class TracksTable < Erector::Widget

  module ::Enumerable
    def select_with_index
      index = -1
      select {|x| yield(x, index += 1)}
    end

    def odds
      select_with_index {|x, i| i.odd?}
    end

    def evens
      select_with_index {|x, i| i.even?}
    end
  end


  def content
    widget Breadcrumbs, display_name: display_name

    table.tracks {
      tr {
        th "Track"
        th "Lessons"
        th "Labs"
      }
      @tracks.each do |track|
        track_row(track)
      end
    }
  end

  def track_row(track)
    tr {
      th(valign: "top") {
        widget track.link_view(show_description: false)
      }
      td.lessons(valign: "top") {
        ul {
          widget track.view, {}, :content_method_name => :list_lessons
        }
      }
      td.lessons(valign: "top") {
        ul {
          widget track.view, {}, :content_method_name => :list_labs
        }
      }
    }
  end

  def display_name
    "Tracks"
  end

  def href
    "/lessons" # todo: make a "/tracks" endpoint instead
  end

end
