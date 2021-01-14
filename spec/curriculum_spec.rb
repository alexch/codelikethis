require 'spec_helper'
require 'curriculum'

describe Curriculum do
  describe 'by default' do
    subject { Curriculum.new }

    it 'has a default name' do
      expect(subject.name)
        .to eq 'curriculum'
    end

    it 'has no description' do
      expect(subject.description)
        .to be_nil
    end

    it 'has an href' do
      expect(subject.href)
        .to eq '/lessons'
    end
  end

  describe 'tracks' do
    it 'all are present' do
      track_names = %w[
        javascript
        www
        responsive_layout
        client_side_coding
        server_side_javascript
        oo
        db
        react
        ___
        agile
        git
        tricks_of_the_trade
        career
      ]
      expect(subject.tracks.map(&:name)).to eq(track_names)
    end

    it 'can find a track with dashes' do
      expect(subject.track_named('responsive-layout'))
        .to eq(::Track::ResponsiveLayout)
    end

    it 'can find a lesson by path' do
      expect(subject.lesson_named('/javascript/intro'))
        .to(eq(::Track::Javascript.lesson_named('intro')))
    end
  end
end
