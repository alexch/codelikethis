require 'json'
require 'chronic'
require 'views'

class Schedule

  def self.from_file site:, path:
    new site: site, data: JSON.parse(File.read(path)) if File.exist?(path)
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
      text "outline"
    end

    def content
      div.row {
        h1 "Schedule"
      }

      div.row {
        h2 "Description"
        p {
          markdown(@schedule['description'])
        }
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
          @schedule['typical_day'].each do |event|
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

        track_name = week['track']
        track = @site.track_named(track_name)
        track = Track.new(name: track_name) if track.nil?

        side_tracks = week['side_tracks']

        div.row {
          br
          br
        }
        div.row {
          div(class: 'col col-sm-12 card') {
            div(class: 'card-body') {
              h2(class: 'card-title') {
                text "Week #{week_number + 1} (#{week_start.strftime("%Y-%m-%d")})"
                # todo: link to or embed gcal for that week
              }
              div(class: 'card-text col') {
                render_track(track, week)
              }
              div(class: 'card-text col') {
                if side_tracks.present?
                  side_tracks.each do |track_info|
                    track_name = track_info['track']
                    track = @site.track_named(track_name)
                    render_track(track, track_info)
                  end
                end
              }
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
            things_with_commas(lesson_names.map do |name|
              (track.lesson_named(name) rescue nil) || name
            end)
          }
        end

        projects = json['projects']
        events = json['events']

        if projects || events
          div(class: 'row') {
            div(class: 'col card-text col-md-8') {
              if projects
                b "Projects: "
                ul {
                  projects.each do |project_info|
                    project = Project.from_json(project_info)
                    li {
                      widget project.link_view
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
      end
    end

  end

end

