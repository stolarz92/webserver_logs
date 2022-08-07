# frozen_string_literal: true

require_relative "../../app/renderers/unique_logs"

RSpec.describe Renderers::AllLogs do
  let(:logs) { { first: 10, second: 20, third: 30 } }

  subject { Renderers::AllLogs.new(logs) }

  describe "render" do
    it "prints header to stdout view" do
      expect { subject.render }.to output(/#{subject.class::HEADER}/).to_stdout
    end

    it "prints body to stdout view" do
      expected_output = <<~EOS
        All page views
        first 10 visits
        second 20 visits
        third 30 visits\n
      EOS
      expect { subject.render }.to output(expected_output).to_stdout
    end
  end
end
