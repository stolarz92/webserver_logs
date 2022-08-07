# frozen_string_literal: true

module Presenters
  class LogPresenter
    attr_reader :logs

    def initialize(logs)
      @logs = logs
      @grouped_logs = group_logs
    end

    def most_page_views
      most_page_views = Hash.new { |hash, key| hash[key] = 0 }

      @grouped_logs.each do |key, val|
        most_page_views[key] += val.values.sum
      end

      sort_by_value(most_page_views)
    end

    def most_unique_page_views
      most_unique_page_views = Hash.new { |hash, key| hash[key] = 0 }

      @grouped_logs.each do |key, val|
        most_unique_page_views[key] += val.size
      end

      sort_by_value(most_unique_page_views)
    end

    private

    def group_logs
      grouped_logs = Hash.new { |hash, key| hash[key] = Hash.new(0) }

      @logs.each do |log|
        path, ip = log.first.split
        grouped_logs[path][ip] += 1
      end

      grouped_logs
    end

    def sort_by_value(hash)
      hash.sort_by { |_k, v| -v }.to_h
    end
  end
end
