# frozen_string_literal: true

require_relative "base"

module Renderers
  class UniqueLogs < Base
    HEADER = "Unique views"

    private

    def line(key, value)
      "#{key} #{value} unique views"
    end
  end
end
