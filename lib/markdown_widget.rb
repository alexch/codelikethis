require 'views'

class MarkdownWidget < Erector::Widget
  include Views
  needs :text

  def content
    div(class: 'markdown markdown-body') {
      markdown @text
    }
  end

  def outline
    # todo: scan for H2s and such
  end
end
