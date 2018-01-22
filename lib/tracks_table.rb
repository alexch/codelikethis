require 'erector'

class TracksTable < Erector::Widget

  external :style, <<-CSS
  table.tracks {
    border: 2px solid gray;
    border-collapse:collapse;
    margin-left: 10em;
    box-shadow: #c8c8f1 2px 2px 4px;

  }

  table.tracks ul {
    list-style: none;
    -webkit-margin-before: 0;
    -webkit-margin-after: 0;
    -webkit-margin-start: 0;
    -webkit-margin-end: 0;
    -webkit-padding-start: 0;
  }
  table.tracks td.lessons {
    font-size: 90%;
    padding-top: .5em;
  }
  table.tracks, table.tracks td, table.tracks th {
    border: 1px solid black;
    padding: 4px 8px 8px;
  }
  table.tracks th {
    text-shadow: 1px 1px #ededed;
  }
  table.tracks td {
  }
  table.tracks tr:nth-child(1) {
    background-color: #B3C8E8;
  }
  table.tracks tr:nth-child(even) {
    background-color: #EEEEF2;
  }
  table.tracks a {
    text-decoration: none;
    display: block;
    padding: 2px;
  }
  table.tracks a:hover {
    text-decoration: underline;
    background-color: #B3C8E8;
  }
  table.tracks a:visited {
    color: black;
  }

  span.video_link {
    float: right;
    border: 1px dotted black;
    padding: 1px 2px;
    margin-top: -2px;
  }

  CSS

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
        a track.display_name, href: track.href
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
