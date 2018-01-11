class Link < Erector::Widget
  attr_reader :name, :href, :description

  def initialize name: nil, href: nil, description: nil
    @name, @href, @description = name, href, description
  end

  def ==(other)
    other.is_a?(Link) and
        other.name == name and
        other.href == href and
        other.description == description
  end

  def name
    @name || href
  end

  def content
    span(class: 'link') {
      a name, href: href
      if description
        text " - "
        span description, class: "description"
      end
    }
  end
end