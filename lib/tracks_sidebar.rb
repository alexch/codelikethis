require 'erector'

class TracksSidebar < Erector::Widget

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
        # hamburger button for tracks
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
    active = (current_track == track)
    classes = ['list-group-item',
               'track-name',
               ('active' if active),
    ]

    div(class: classes) {
      lessons_id = "sidebar-#{track.name}-lessons"


      div(class: 'lesson-name') {

        unless @current == track or track == Track::Separator
          a(title: "Track Info for <br>#{track.display_name}",
            # https://getbootstrap.com/docs/4.0/components/tooltips/
            'data-html': true,
            'data-toggle': "tooltip",
            'data-placement': "right",
            href: track.href,
            class: 'track-info-link pull-right') {
            i(class: 'fas fa-info')
          }
        end


        a track.display_name,
          href: "##{lessons_id}",
          'data-toggle': 'collapse',
          'data-target': "##{lessons_id}",
          'data-parent': "##{html_id}-tracks"
        # 'aria-expanded': false
        # 'aria-controls': '???'

      }

      # labs_id = "sidebar-#{track.name}-labs"
      # button "labs",
      #        class: 'btn btn-primary',
      #        type: 'button',
      #        'data-toggle': 'collapse',
      #        'data-target': labs_id,
      #        'aria-expanded': false
      #        # 'aria-controls': '???'

      div(class: ['collapse', ('show' if track.lessons.include?(@current))],
          id: lessons_id) {
        div(class: ['list-group', 'lesson-names']) {
          track.current = @current
          widget track.view, {}, :content_method_name => :list_lessons
        }
      }

      # ul(class: 'list-group', id: labs_id) {
      #   widget track.view, {}, :content_method_name => :list_labs
      # }
    }

    # // when a collapsible is shown
    # $('#sidebar .collapse').on('show.bs.collapse', function() {
    #   console.log("hello!");
    #   // then hide all currently shown
    #   $('#sidebar .collapse.show').collapse('hide');
    # });
    # JS
  end

end
