# frozen_string_literal: true

require_relative 'base'

module Renderers
  class AllLogs < Base
    HEADER = "All page views".freeze

    private

    def line(key, value)
      "#{key} #{value} visits"
    end
  end
end
