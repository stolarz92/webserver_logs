# frozen_string_literal: true

require_relative "../../app/file_readers/csv_reader"

RSpec.describe FileReaders::CsvReader do
  let(:fixture_file_path) { File.join(Dir.pwd, "spec", "fixtures", "files", "fixture_logs.log") }

  subject { FileReaders::CsvReader.new(fixture_file_path) }

  describe "parse" do
    it "correctly parse csv style file and returns array of arrays" do
      result = subject.parse

      expect(result).to be_kind_of(Array)
      expect(result.first).to be_kind_of(Array)
    end
  end
end
