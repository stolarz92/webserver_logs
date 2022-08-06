require_relative 'base'

module Renderers
  class ClassicView < Base
    private

    def render_view
      @logs.map do |link, visits|
        line(link, visits)
      end
    end

    def line(key, value)
      "#{key} #{value} visits"
    end
  end
end
