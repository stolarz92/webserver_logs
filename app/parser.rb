require "csv"
require "pry"
require_relative "./file_readers/csv_reader"
require_relative "./presenters/log_presenter"
require_relative "./renderers/classic_view"

class Parser
  HEADER = "All page views".freeze
  UNIQUE_HEADER = "Unique views".freeze

  attr_reader :logs_file_path

  def initialize(
    logs_file_path,
    file_reader: FileReaders::CsvReader,
    presenter: Presenters::LogPresenter,
    renderer: Renderers::ClassicView
  )
    @logs_file_path = logs_file_path
    @file_reader = file_reader
    @presenter = presenter
    @renderer = renderer
  end

  def call
    return ArgumentError, "File does not exist or does not have .log extension" unless file.log_path_valid?

    most_page_views = parsed_logs.most_page_views
    most_unique_page_views = parsed_logs.most_unique_page_views

    @renderer.new(HEADER, most_page_views).render
    @renderer.new(UNIQUE_HEADER, most_unique_page_views).render
  end

  private

  def file
    @file ||= @file_reader.new(@logs_file_path)
  end

  def parsed_file
    @parsed_file ||= file.parse
  end

  def parsed_logs
    @parsed_logs ||= @presenter.new(parsed_file)
  end
end
