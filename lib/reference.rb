require 'erector'
require 'thing'
require 'views'

class Reference < Thing
  def self.references_dir
    @@references_dir ||= begin
      app_dir = File.expand_path(File.dirname(File.dirname(__FILE__)))
      File.join(app_dir, "public", "references")
    end
  end

  def self.all
    # for now, just get all references ever
    pattern = '*.md'
    Dir[File.join(File.absolute_path(references_dir), pattern)].sort.map do |file|
      file.slice! /^#{references_dir}\//
      file.slice! /\.md$/
      Reference.new(name: file)
    end
  end

  #todo: unit test this hash-or-string-to-object magic
  def self.from_json reference_info
    reference_info = {name: reference_info} if reference_info.is_a? String
    reference_info.symbolize_keys!
    Reference.new(**reference_info)
  end

  contains :topics

  # is this reference optional? default: false
  attr_reader :optional

  # where the reference is located; nil means it's in here
  def from
    @from
  end

  def references_dir
    @references_dir || Reference.references_dir
  end

  def content_file
    path = [@name, @name.gsub('-', '_'), @name.gsub('_', '-')].map do |possible_name|
      File.join(references_dir, "#{possible_name}.md")
    end.find do |path|
      File.exist? path
    end
    if path.nil?
      raise Errno::ENOENT.new("#{@name}.md in #{references_dir}")
    end
    File.new(path)
  end

  # todo: use OO, not switch statement, for 'From' href and icon
  # todo: more unit tests around all these cases
  def href
    case from
    when nil
      @href || "/references/#{name}"
    when 'CodeCademy'
      @href
    when 'FreeCodeCamp'
      if @href
        if @href =~ /^\// #  allow partial paths e.g. /basic-javascript/introduction-to-javascript
          "https://beta.freecodecamp.org/en/challenges#{@href}"
        else
          @href
        end
      else
        "https://beta.freecodecamp.org/en/challenges/basic-javascript/introduction-to-javascript"
      end
    else
      @href
    end
  end


  # def link
  #   Link.new(name: name, href: href, description: description, from: from)
  # end

  def icon
    if from
      case from.downcase
      when 'freecodecamp'
        '/images/fcc-fire-white.png'
      when 'codecademy'
        '/images/codecademy-logo-400x400.jpg'
      end
    end
  end

  def content
    @content || File.read(content_file)
  end

  def sections
    pattern = /^(#+) (.*)$/
    headers = content.split(/\n/).grep(pattern)
    result = []
    children = nil
    headers.each do |line|
      matches = (pattern.match(line))
      hashes = matches[1]
      title = matches[2].strip
      if hashes == '##'
        children = []
        section = {title: title, children: children}
        result << section
      elsif hashes == '###'
        section = {title: title}
        children << section
      end
    end
    result
  end

  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    include Views

    needs :target
    attr_reader :target

    def content
      text raw(from_markdown(process_content))
    end

    def process_content
      pattern = /^(#+) (.*)$/

      target.content.split(/\n/).map do |line|
        if pattern.match(line)
          matches = (pattern.match(line))
          hashes = matches[1]
          title = matches[2].strip
          line = "<a name='#{anchor_name(title)}'></a>\n" + line
        end
        line
      end.join("\n")
    end

    def anchor_name(title)
      title.downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9\-_]/, '')
    end

    def outline
      div.outline {
        h3 "Outline"
        ul(class: 'list-group') {
          target.sections.each do |section|
            li(class: 'list-group-item') {
              a(href: '#' + anchor_name(section[:title])) {
                text section[:title]
              }
              if section[:children] && !section[:children].empty?
                ul(class: 'list-group') {
                  section[:children].each do |child_section|
                    li(class: 'list-group-item') {
                      a(href: '#' + anchor_name(child_section[:title])) {
                        text child_section[:title]
                      }
                    }
                  end
                }
              end
            }
          end
        }
      }
    end

  end

end