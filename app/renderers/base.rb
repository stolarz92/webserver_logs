module Renderers
  class Base
    def initialize(header, logs)
      @header = header
      @logs = logs
    end

    def render
      puts @header
      puts render_view
      puts "\n"
    end
  end
end
