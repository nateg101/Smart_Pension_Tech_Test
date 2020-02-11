require 'webserverparser'

describe WebserverParser do

  context "listing of pages by most views" do

    let(:single_visit_logfile) { 'spec/fixtures/webserver_single_visit_example.log' }
    subject(:single_visit_parser) { described_class.new(single_visit_logfile) }

    let(:multiple_visits_logfile) { 'spec/fixtures/webserver_multiple_visits_example.log' }
    subject(:multiple_visit_parser) { described_class.new(multiple_visits_logfile) }

    it "returns '/contact 1 visit'" do
      expect(single_visit_parser.most_views[0]).to eq('/contact 1 visits')
    end

    it "returns the correct count for multiple visits to pages" do
      expect(multiple_visit_parser.most_views).to include('/help_page/1 3 visits')
      expect(multiple_visit_parser.most_views).to include('/about/2 1 visits')
    end

    it "orders the visits from highest number of visits to lowest" do
      expect(multiple_visit_parser.most_views[0]).to eq('/help_page/1 3 visits')
      expect(multiple_visit_parser.most_views[1]).to eq('/home 2 visits')
    end
  end

end
