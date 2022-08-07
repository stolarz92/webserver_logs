# frozen_string_literal: true

module Renderers
  class Base
    def initialize(logs)
      @logs = logs
    end

    def render
      puts self.class::HEADER
      puts render_body
      puts "\n"
    end

    private

    def render_body
      @logs.map do |link, visits|
        line(link, visits)
      end
    end
  end
end
