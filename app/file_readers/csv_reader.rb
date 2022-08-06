require "csv"
require "pathname"
require_relative "base"

module FileReaders
  class CsvReader < Base
    def parse
      CSV.read(@log_path)
    end
  end
end
