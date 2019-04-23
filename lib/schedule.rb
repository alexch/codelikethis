require 'json'
require 'chronic'
require 'erector'
require 'views'
require 'thing'

class Schedule < Thing

  def self.from_file site:, path:
    new site: site,
        data: JSON.parse(File.read(path)) if File.exist?(path)
  end

  def initialize(site:, data:)
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
      div.outline do
        h3 "Outline"
        ul(class: 'list-group') do
          weeks.each do |week|
            li(class: 'list-group-item') do
              a week[:week_title], href: "#card-#{week[:week_start_ymd]}"
            end
          end
        end
      end
    end

    def weeks
      week_start = nil
      week_number = 0
      @schedule['weeks'].map do |week|
        if week['start']
          week_start = Chronic.parse(week['start'])
        else
          week_start += 1.week
        end

        week_start_ymd = week_start.strftime("%Y-%m-%d")
        week_title = if week_number == 0
                       "Prerequisites"
                     else
                       "Week #{week_number}: #{week_start_ymd}"
                     end

        result = week + {week_number: week_number,
                         week_start: week_start,
                         week_title: week_title,
                         week_start_ymd: week_start_ymd,
                         week_end: week_start + 6.days
        }

        week_number += 1

        result
      end
    end

    def content
      div {
        h1 "Schedule"
      }

      div {
        h2 "Description"
        p {
          markdown(@schedule['description'])
        }
      }

      if @schedule['mottos']
        div {
          h2 "Class Mottos"
          p {
            ul {
              @schedule['mottos'].each do |motto|
                li motto
              end
              li {
                text "See also "
                a("Alexisms", href: "http://alexchaffee.com/alexisms")
              }
            }
          }
        }
      end

      div.card {
        div(class: 'card-header') {
          h2(class: 'mb-0') {
            text "A Typical Day"
          }
        }
        div(class: 'card-body') {
          table {
            tr {
              th "time"
              th "activity"
            }
            @schedule['typical_day'].each do |event|
              tr {
                td event[0]
                td event[1]
              }
            end
          }
        }
      }

      weeks.each do |week|
        week_start = week[:week_start]
        week_start_ymd = week[:week_start_ymd]
        week_number = week[:week_number]

        track_name = week['track']
        track = @site.track_named(track_name) ||
            Track.new(name: track_name)

        side_tracks = week['side_tracks']

        # this empty div is to bump an inner-anchor-link past the fixed top nav bar
        div(id: "card-#{week_start_ymd}", style: 'height: 60px')

        div(class: 'card') {
          h2(class: 'card-header mb-0') {
            if week_number == 0
              text "Prerequisites"
            else
              gcal_link = "https://calendar.google.com/calendar/b/1/r/week/#{week_start.strftime("%Y/%m/%d")}?cid=#{@site.google_calendar_id}"
              text "Week #{week_number} "
              div({class: 'date float-right', style: 'font-size: 80%'} + with_tooltip("Click here to view calendar for this week")) {
                a(href: gcal_link,) {
                  span week_start_ymd
                  text raw(nbsp)
                  i(class: 'fas fa-calendar-alt')
                }
              }
            end
          }

          div(class: 'card-body', id: "card-body-#{week_start_ymd}") {

            unless week_number == 0
              div(class: 'card-body') {
                gcal_id = @site.google_calendar_id
                  + '%40group.calendar.google.com' # %40 means @
                week_start_gcal = week_start.strftime("%Y%m%d")
                week_end_gcal = week[:week_end].strftime("%Y%m%d")
                text raw('<iframe src="https://calendar.google.com/calendar/b/1/embed?showTitle=0&amp;showNav=0&amp;showTabs=0&amp;showCalendars=0&amp;mode=WEEK&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=' + gcal_id + '&amp;color=%23B1440E&amp;ctz=America%2FNew_York&amp;dates=' + week_start_gcal + '%2f' + week_end_gcal + '" style="border-width:0" width="800" height="400" frameborder="0" scrolling="no"></iframe>')
              }
            end

            if week['description']
              div(class: 'card-text col') {
                text week['description']
              }
            end

            div(class: 'card-text col') {
              render_track(track, week)
            }

            div(class: 'card-text col') {
              if side_tracks.present?
                side_tracks.each do |side_track_info|
                  side_track_name = side_track_info['track']
                  side_track = @site.track_named(side_track_name) ||
                      Track.new(name: track_name)
                  render_track(side_track, side_track_info)
                end
              end
            }
          }
        }
      end
    end

    private

    def render_events events
      if events
        div(class: 'col card-text col-md-4') {
          b "Events:"
          table {
            tr {
              th "time"
              th "event"
            }
            events.each do |event|
              tr {
                td event['start']
                td event['name']
              }
            end
          }
        }
      end
    end

    def render_track(track, json)
      div(class: 'box') {

        p {
          i(class: "fas fa-paw")
          text nbsp
          b " Track: "
          widget track.link_view
        }

        lesson_names = json['lessons']
        if lesson_names
          p {
            b "Lessons: "
            lessons = lesson_names.map do |name|
              begin
                if (name =~ %r{^/})
                  @site.lesson_named(name)
                else
                  track.lesson_named(name)
                end
              rescue
                name
              end
            end
            things_with_commas(lessons) do |lesson|
              # todo: unify with track.rb
              if lesson.respond_to?(:slides) && (lesson.slides.length == 0)
                span("*", class: 'no-slides')
              end
            end
          }
        end

        projects = json['projects']
        events = json['events']

        if projects || events
          div(class: 'row') {
            div(class: 'col card-text col-md-8') {
              if projects
                b "Projects:"
                ul {
                  projects.each do |project_info|
                    project = Project.from_json(project_info)
                    li {
                      widget project.link_view(show_description: true)
                    }
                  end
                }
              end
            }
            render_events(events) if events
          }
        end
      }
    end

    def things_with_commas(things)
      first = true

      things.each do |thing|
        if first
          first = false
        else
          text ", "
        end
        if thing.respond_to? :link_view
          widget thing.link_view(show_description: false)
        else
          text thing.to_s
        end
        yield thing
      end
    end
  end
end
