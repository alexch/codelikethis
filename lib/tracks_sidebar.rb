require 'erector'

class TracksSidebar < Erector::Widget
  include Views

  needs :tracks, :current

  external :script, (<<-JS)
  $(document).ready(function() {
    $('#sidebar a').click(function(eventObject) {
      console.log($(this));
      console.log($(this).find('.loading_image'));
      $(this).find('.loading_image').css('display', 'inline-block');
      return true; // propagate event
    });
  });
  JS

  def current_track
    if @current.is_a?(Track)
      @current
    elsif @current.is_a?(Lesson)
      @current.track
    end
  end

  def current_lesson
    @current if @current.is_a?(Lesson)
  end

  def content
    div(class: 'row justify-content-between') {
      div(class: 'col-8') {
        h3 "Tracks"
      }
      div(class: 'col-4') {
        # expando button for tracks
        button(:class => 'tracks-toggler btn border-0 collapsed',
               :type => 'button',

               'data-toggle' => 'collapse',
               'data-target' => "##{html_id}",

               'aria-expanded' => 'false',
               'aria-label' => 'Toggle navigation'
        ) {
          span :class => 'svg-icon'
        }
      }
    }

    div(id: html_id, class: 'collapse') {
      div(id: "#{html_id}-tracks") {
        @tracks.each do |track|
          track_row(track)
        end
      }
    }
  end

  def html_id
    "sidebar-tracks"
  end

  def track_row(track)
    if track == Track::Separator
      hr
      return
    end

    active = (current_track == track)
    classes = ['list-group-item',
               'track-name',
               ('active' if active),
    ]
    div(class: classes) {
      lessons_id = "sidebar-#{track.name}-lessons"

      div(class: 'lesson-name') {

        unless @current == track
          tooltip_text = "Track: <u>#{track.display_name}</u><br>"
          if track.description?
            tooltip_text += "<p><small>#{track.description}</small><p>"
          end
          tooltip_text += "Click for More Info"
          a(**({href: track.href,
            class: 'track-info-link'} +
            with_tooltip(tooltip_text))) {
            i(class: 'fas fa-info-circle')
          }
        end

        a(href: "##{lessons_id}",
          'data-toggle': 'collapse',
          'data-target': "##{lessons_id}",
          'data-parent': "##{html_id}-tracks") {
          i(class: "fas fa-paw")
          text nbsp
          text nbsp
          text track.display_name
        }
        # 'aria-expanded': false
        # 'aria-controls': '???'

      }

      div(class: ['collapse', ('show' if track == current_track)],
          id: lessons_id) {
        div(class: ['list-group', 'lesson-names']) {
          track.current = @current
          widget track.view, {}, :content_method_name => :list_lessons
        }
      }

    }

  end

end
