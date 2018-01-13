require 'thing'

class Link < Thing
  attr_reader :name, :href, :description

  def ==(other)
    other.is_a?(Link) and
        other.name == name and
        other.href == href and
        other.description == description
  end

  def name
    @name || href
  end

  def display_name
    @display_name || name
  end

  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    needs :target

    # proxy readers to the target (model) object
    [
        :display_name, :href, :description
    ].each do |method|
      define_method method do
        @target.send method
      end
    end

    def content
      span(class: 'link') {
        a display_name, href: href
        if description
          text " - "
          span description, class: "description"
        end
      }
    end
  end
end
