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
    # TODO: scan for H2s and such
  end
end
