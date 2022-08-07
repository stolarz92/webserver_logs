# frozen_string_literal: true

require_relative "../../app/file_readers/base"

require "pry"

RSpec.describe FileReaders::Base do
  let(:base_path) { File.join(Dir.pwd, "spec", "fixtures", "files", file) }

  subject { FileReaders::Base.new(base_path) }

  describe "log_path_valid?" do
    context "when path exists and extension is .log" do
      let(:file) { "fixture_logs.log" }

      it "correctly initialize object" do
        expect { subject }.to_not raise_error
      end
    end

    context "when path does not exist" do
      let(:file) { "file.log" }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "when extension is not .log" do
      let(:file) { "file.wrong" }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "when file is empty" do
      let(:file) { "empty_file.log" }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
