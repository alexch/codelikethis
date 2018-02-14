require 'json'
require 'chronic'
require 'views'

class Schedule

  def self.from_file site:, path:
    new site: site, data: JSON.parse(File.read(path)) if File.exist?(path)
  end

  def initialize(site: site, data:)
    @site = site
    @data = data
  end

  def view
    # todo: pass in this object, not a pointer to naked json
    ScheduleView.new(site: @site, schedule: @data)
  end

  class ScheduleView < Erector::Widget
    include Views
    needs :site, :schedule

    def outline
      text "outline"
    end

    def content
      div.row {
        h1 "Schedule"
      }

      div.row {
        h2 "A Typical Day"
      }
      div.row {
        table {
          tr {
            th "time"
            th "activity"
          }
          @schedule['day'].each do |event|
            tr {
              td event[0]
              td event[1]
            }
          end
        }
      }

      week_start = nil
      @schedule['weeks'].each_with_index do |week, week_number|
        if week['start']
          week_start = Chronic.parse(week['start'])
        else
          week_start += 1.week
        end

        ap week

        track = @site.track_named(week['track'])

        div.row {
          br
          br
        }
        div.row {

          div(class: 'col col-sm-12 card') {
            div(class: 'card-body') {
              h2(class: 'card-title') {
                text "Week #{week_number} (#{week_start.strftime("%Y-%m-%d")})"
              }
              div(class: 'card-text col') {
                if track
                  h4 "Track: "
                  a track.display_name,
                    href: "/lessons/#{week['track']}"
                  #todo: rename /lessons to /tracks in URL here?
                end
              }
              div(class: 'card-text col') {
                h5 "Projects"
                ul {
                  week['projects'].each do |name|
                    li name
                  end if week['projects']
                }
              }
              div(class: 'card-text col') {
                h5(
                  'data-toggle': 'collapse',
                  'data-target': "#days-#{week_number}") {
                  text "Days:"
                  a(class: "btn border-0 collapsed toggler",
                    'data-toggle' => 'collapse',
                    'data-target' => "#days-#{week_number}") {
                    span :class => 'svg-icon'
                  }
                }
              }
            }

            div.row {
              div(id: "days-#{week_number}",
                  class: 'container-fluid collapse'
              ) {
                div.row {
                  week['days'].each_with_index do |day, day_number|
                    day_content(day, day_number, track, week, week_start)
                  end if week['days']
                }
              }
            }
          }
        }
      end
    end

    private
    def day_content(day, day_number, track, week, week_start)
      div(class: 'col col-sm-12 card') {
        div(class: 'card-body') {
          day_date = week_start + day_number.days
          h4(class: 'card-title') {
            text day_date.strftime("%A")
          }
          div.row {
            if day['theme']
              div.col {
                b "Theme: "
                i day['theme']
              }
            end
            if day['lessons']
              div.col {
                b "Lessons: "
                first = true
                day['lessons'].each do |lesson_name|
                  if first
                    first = false
                  else
                    text ", "
                  end
                  lesson = track.lesson_named(lesson_name) rescue nil
                  if lesson
                    a lesson.display_name, href: lesson.href
                  else
                    text lesson_name
                  end
                end
              }
            end
            if day['events']
              div.col {
                table {
                  tr {
                    th "time"
                    th "event"
                  }
                  day['events'].each do |event|
                    tr {
                      td event['start']
                      td event['name']
                    }
                  end
                }
              }
            end
          }
        }
      }
    end

  end

end

