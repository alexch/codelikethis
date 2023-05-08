require 'thing'

class References < Thing

  def view
    ReferencesView.new(references: @references)
  end

  class ReferencesView < Erector::Widget
    include Views

    # todo: show which track(s) each reference is in
    # todo: sort by schedule
    def content
      h1 "References"
      ul do
        @references.each do |reference|
          li do
            widget reference.link_view(show_description: true)
          end
        end
      end
    end
  end

end