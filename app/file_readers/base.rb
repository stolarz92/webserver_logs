module FileReaders
  class Base
    ALLOWED_EXTENSION = ".log".freeze
    private_constant :ALLOWED_EXTENSION
    
    attr_reader :log_path

    def initialize(log_path)
      @log_path = Pathname.new(log_path)
    end

    def parse
      raise "Not implemented"
    end

    def log_path_valid?
      @log_path.exist? && @log_path.extname == ALLOWED_EXTENSION ? true : false
    end
  end
end
