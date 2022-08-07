# frozen_string_literal: true

require "pry"
require_relative "./file_readers/csv_reader"
require_relative "./presenters/log_presenter"
require_relative "./renderers/all_logs"
require_relative "./renderers/unique_logs"

class Parser
  attr_reader :logs_file_path

  def initialize(
    logs_file_path,
    file_reader: FileReaders::CsvReader,
    presenter: Presenters::LogPresenter,
    renderer: Renderers
  )
    @logs_file_path = logs_file_path
    @file_reader = file_reader
    @presenter = presenter
    @renderer = renderer
  end

  def call
    most_page_views = parsed_logs.most_page_views
    most_unique_page_views = parsed_logs.most_unique_page_views

    @renderer::AllLogs.new(most_page_views).render
    @renderer::UniqueLogs.new(most_unique_page_views).render
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
