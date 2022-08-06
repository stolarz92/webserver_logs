require_relative "../../app/file_readers/base"

require "pry"

RSpec.describe FileReaders::Base do
  let(:base_path) { File.join(Dir.pwd, "spec", "fixtures", "files", file) }
  
  subject { FileReaders::Base.new(base_path) }

  describe "log_path_valid?" do
    context "when path exists and log extension is .log" do
      let(:file) { "fixture_logs.log" }

      it "returns true " do
        expect(subject.log_path_valid?).to be_truthy
      end
    end

    context "when path does not exist" do
      let(:file) { "file.log" }

      it "returns false" do
        expect(subject.log_path_valid?).to be_falsey
      end
    end

    context "when extension is not .log" do
      let(:file) { "file.wrong" }

      it "returns false" do
        expect(subject.log_path_valid?).to be_falsey
      end
    end
  end
end
