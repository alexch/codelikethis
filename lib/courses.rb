require 'erector'

class Courses < Erector::Widget

  external :style, <<-CSS
  table.courses {
    border: 2px solid gray;
    border-collapse:collapse;
    margin-left: 10em;
  }

  table.courses ul {
    list-style: none;
    -webkit-margin-before: 0;
    -webkit-margin-after: 0;
    -webkit-margin-start: 0;
    -webkit-margin-end: 0;
    -webkit-padding-start: 0;
  }
  table.courses td.lessons {
    font-size: 90%;
    padding-top: .5em;
  }
  table.courses, table.courses td, table.courses th {
    border: 1px solid green;
    padding: 4px 8px 8px;
  }
  table.courses tr:nth-child(1) {
    background-color: #A7C942;
  }
  table.courses tr:nth-child(even) {
    background-color: #EEEEF2;
  }
  table.courses a {
    text-decoration: none;
    display: block;
    padding: 2px;
  }
  table.courses a:hover {
    text-decoration: underline;
    background-color: #EAF2D3;
  }
  table.courses a:visited {
    color: black;
  }

  CSS

    module ::Enumerable
      def select_with_index
        index = -1
        select { |x| yield(x, index += 1) }
      end
      def odds
        select_with_index {|x,i| i.odd?}
      end
      def evens
        select_with_index {|x,i| i.even?}
      end
    end


  def content
    widget Breadcrumbs, display_name: display_name

    table {
      tr {
        td(valign: 'top') {
          courses_table @courses.evens # including 0
        }
        td(valign: 'top') {
          courses_table @courses.odds
        }
      }
    }
  end

  def courses_table courses
    table.courses {
      tr {
        th "Course"
        th "Lessons"
      }
      courses.each do |course|
        tr {
          th(valign: "top") {
            a course.display_name, href: course.href
          }
          td.lessons(valign: "top") {
            widget course, {}, :content_method_name => :list_lessons
          }
        }
      end
    }
  end

  def display_name
    "Lessons"
  end

  def href
    "/lessons"
  end

end
