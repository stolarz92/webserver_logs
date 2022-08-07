# frozen_string_literal: true

require_relative "../../app/presenters/log_presenter"
require_relative "../../app/file_readers/csv_reader"

RSpec.describe Presenters::LogPresenter do
  let(:data_to_present) do
    [
      %w[web_page_1 ip_first],
      %w[web_page_2 ip_second],
      %w[web_page_3 ip_first],
      %w[web_page_3 ip_second]
    ]
  end

  subject { Presenters::LogPresenter.new(data_to_present) }

  describe "most_page_views" do
    it "returns list of webpages with most page views ordered desc by page views" do
      expected_most_page_views = { "web_page_1" => 1, "web_page_2" => 1, "web_page_3" => 2 }

      expect(subject.most_page_views).to eq(expected_most_page_views)
    end
  end

  describe "most_unique_page_views" do
    it "returns list of webpages with most unique page views ordered desc by page views" do
      expected_most_unique_page_views = { "web_page_1" => 1, "web_page_2" => 1, "web_page_3" => 1 }

      expect(subject.most_unique_page_views).to eq(expected_most_unique_page_views)
    end
  end
end
