require 'webserverparser'

describe WebserverParser do
  context "listing of pages by most views" do

    let(:single_visit_logfile) { 'spec/fixtures/webserver_single_visit_example.log' }
    subject(:single_visit_parser) { described_class.new(single_visit_logfile) }

    it "returns '/contact 1 visit'" do
      expect(single_visit_parser.most_views[0]).to eq('/contact 1 visit')
    end
  end

end
