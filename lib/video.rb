require 'erector'

require 'thing'

class Video < Thing

  attr_reader :name
  attr_reader :youtube_id

  def href
    @href || "http://testfirst.org/live/learn_ruby/#{name}"
  end

  def view
    View.new(youtube_id: @youtube_id)
  end

  class View < Erector::Widget
    needs :youtube_id

    def content
      # see https://developers.google.com/youtube/player_parameters
      # see https://css-tricks.com/NetMag/FluidWidthVideo/Article-FluidWidthVideo.php
      #
      div(class: "video-container") {
        s = %Q(<iframe class="youtube" type="text/html" width="560" height="349" src="https://www.youtube.com/embed/#{@youtube_id}" frameborder="0" allowfullscreen></iframe>\n)
        rawtext s
      }
    end
  end

end
