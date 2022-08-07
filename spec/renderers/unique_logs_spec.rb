# frozen_string_literal: true

require_relative "../../app/renderers/unique_logs"

RSpec.describe Renderers::UniqueLogs do
  let(:logs) { { first: 10, second: 20, third: 30 } }
  subject { Renderers::UniqueLogs.new(logs) }

  describe "render" do
    it "prints header to stdout view" do
      expect { subject.render }.to output(/#{subject.class::HEADER}/).to_stdout
    end

    it "prints body to stdout view" do
      expected_output = <<~EOS
        Unique views
        first 10 unique views
        second 20 unique views
        third 30 unique views\n
      EOS
      expect { subject.render }.to output(expected_output).to_stdout
    end
  end
end
