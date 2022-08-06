require_relative "../../app/presenters/log_presenter"
require_relative "../../app/file_readers/csv_reader"

require "pry"

RSpec.describe Presenters::LogPresenter do
  let(:fixture_file_path) { File.join(Dir.pwd, "spec", "fixtures", "files", "fixture_logs.log") }
  let(:parsed_file) { FileReaders::CsvReader.new(fixture_file_path).parse }

  subject { Presenters::LogPresenter.new(parsed_file) }

  describe "most_page_views" do
    it "returns list of webpages with most page views ordered desc by page views" do
      expected_most_page_views = { "/help_page/1" => 6, "/contact" => 3, "/home" => 3, "/about/2" => 3, "/index" => 3,
                                   "/about" => 2 }

      expect(subject.most_page_views).to eq(expected_most_page_views)
    end
  end

  describe "most_unique_page_views" do
    it "returns list of webpages with most unique page views ordered desc by page views" do
      expected_most_unique_page_views = { "/help_page/1" => 5, "/home" => 3, "/index" => 3, "/contact" => 2,
                                          "/about/2" => 2, "/about" => 2 }

      expect(subject.most_unique_page_views).to eq(expected_most_unique_page_views)
    end
  end
end
