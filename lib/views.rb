# methods for rendering components that are shared across many pages or widgets
# class Something < Erector::Widget
#   include Views
#   ...

module Views

  def centered_codelikethis_logo
    center class: 'logo ml-auto mr-auto' do
      img.logo(src: '/images/codelikethis-logo.png',
               alt: "Code like this!")
      br
      text "by Burlington Code Academy"
    end
  end

  def twitter
    div.twitter do
      # https://twitter.com/settings/widgets
      # https://dev.twitter.com/docs/embedded-timelines
      rawtext <<-HTML
<a class="twitter-timeline" href="https://twitter.com/codelikethis">Tweets by codelikethis</a> 
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
      HTML
    end
  end

  def from_markdown text
    @@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                           :tables => true,
                                           :fenced_code_blocks => true,
                                           :no_intra_emphasis => true,
                                           :autolink => true,
                                           :strikethrough => true,
                                           :lax_html_blocks => false,
                                           :space_after_headers => true,
                                           :superscript => false,
                                           :with_toc_data => true
    )

    munge(@@markdown.render(text))
  end

  # todo: test
  def munge html
    lines = (["<div class='markdown-body'>"] +
        html.split("\n").map do |line|
          if line.strip == '<!--box-->'
            '<section class="box">'
          elsif line.strip == '<!--/box-->'
            '</section>'
          else
            line
          end
        end.compact +
        ["</div>"])
    lines.join("\n")
  end

  def markdown text
    text raw(from_markdown(text))
  end

  def with_tooltip(tooltip_text)
    # https://getbootstrap.com/docs/4.0/components/tooltips/
    tooltip_options = {
        title: tooltip_text,
        'data-html': true,
        'data-toggle': "tooltip",
        'data-placement': "right",
    }
  end

end
