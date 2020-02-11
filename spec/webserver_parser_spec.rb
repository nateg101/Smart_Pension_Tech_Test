require 'webserverparser'

describe WebserverParser do

  let(:single_visit_logfile) { 'spec/fixtures/webserver_single_visit_example.log' }
  subject(:single_visit_parser) { described_class.new(single_visit_logfile) }

  let(:multiple_visits_logfile) { 'spec/fixtures/webserver_multiple_visits_example.log' }
  subject(:multiple_visit_parser) { described_class.new(multiple_visits_logfile) }

  let(:single_unique_visit_logfile) { 'spec/fixtures/webserver_unique_visit_example.log' }
  subject(:single_unique_visit_parser) { described_class.new(single_unique_visit_logfile) }

  context "listing of pages by most views" do
    it "returns '/contact 1 visit'" do
      expect(single_visit_parser.most_views[0]).to eq('/contact 1 visits')
    end

    it "returns the correct count for multiple visits to pages" do
      expect(multiple_visit_parser.most_views).to include('/help_page/1 3 visits')
      expect(multiple_visit_parser.most_views).to include('/about/2 1 visits')
    end

    it "orders the visits from highest to lowest" do
      expect(multiple_visit_parser.most_views[0]).to eq('/help_page/1 3 visits')
      expect(multiple_visit_parser.most_views[1]).to eq('/home 2 visits')
    end
  end

  context "listing of pages by unique views" do
    it "returns '/contact 1 unique views'" do
      expect(single_unique_visit_parser.unique_views[1]).to eq('/contact 1 unique views')
    end

    it "returns the correct count for multiple unique views" do
      expect(single_unique_visit_parser.unique_views).to include('/home 2 unique views')
      expect(single_unique_visit_parser.unique_views).to include('/contact 1 unique views')
    end

    it "orders the unique visits from highest to lowest" do
      expect(single_unique_visit_parser.unique_views[0]).to eq('/home 2 unique views')
      expect(single_unique_visit_parser.unique_views[1]).to eq('/contact 1 unique views')
    end
  end

end
