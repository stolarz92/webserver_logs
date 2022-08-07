# frozen_string_literal: true

module FileReaders
  class Base
    ALLOWED_EXTENSION = ".log"
    private_constant :ALLOWED_EXTENSION

    attr_reader :log_path

    def initialize(log_path)
      @log_path = Pathname.new(log_path)

      raise ArgumentError, "File does not exist or does not have .log extension" unless log_path_valid?
    end

    def parse
      raise "Not implemented"
    end

    def log_path_valid?
      @log_path && @log_path.exist? && @log_path.extname == ALLOWED_EXTENSION
    end
  end
end
