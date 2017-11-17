# methods for rendering components that are shared across many pages or widgets
# class Something < Erector::Widget
#   include Views
#   ...

module Views
  def logo klass: nil, style: nil
    a(href: 'http://www.burlingtoncodeacademy.com') {
      img.logo(src: '/images/burlingtoncodeacademy-logo.png',
               alt: "Burlington Code Academy",
               class: ['logo', klass].compact,
               style: [style].compact)
    }
  end

  def centered_codelikethis_logo
    center class: 'logo ml-auto mr-auto' do
      img.logo(src: '/images/logo.png',
               alt: "Code like this!",
               style: 'height: 2rem'
      )
      br
      text "Powered by Burlington Code Academy"
    end
  end

  def twitter
    div.twitter do
      # https://twitter.com/settings/widgets
      # https://dev.twitter.com/docs/embedded-timelines
      rawtext <<-HTML
<a class="twitter-timeline" width="340" height="500" href="https://twitter.com/codelikethis" data-widget-id="294871116827197443">Tweets by @codelikethis</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
      HTML
    end
  end
end
