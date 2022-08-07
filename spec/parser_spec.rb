# frozen_string_literal: true

require_relative "../app/parser"

RSpec.describe Parser do
  let(:expected_output) do
    <<~EOS
      All page views
      /help_page/1 6 visits
      /contact 3 visits
      /home 3 visits
      /about/2 3 visits
      /index 3 visits
      /about 2 visits

      Unique views
      /help_page/1 5 unique views
      /home 3 unique views
      /index 3 unique views
      /contact 2 unique views
      /about/2 2 unique views
      /about 2 unique views\n
    EOS
  end

  subject { Parser.new(path) }

  describe "parse" do
    context "with correct file path" do
      let(:path) { File.join(__dir__, "fixtures", "files", "fixture_logs.log") }

      it "returns to stdout list of webpages with most page views and most unique page views, ordered descending" do
        expect { subject.call }.to output(expected_output).to_stdout
      end
    end

    context "with empty file path" do
      let(:path) { '' }

      it "raises ArgumentError" do
        expect { subject.call }.to raise_error(ArgumentError)
      end
    end
  end
end
