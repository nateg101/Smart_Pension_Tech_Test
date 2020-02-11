class WebserverParser

  attr_accessor :logfile

  def initialize(log_file)
    @logfile = File.open(log_file).map(&:strip)
  end

  def most_views
    create_visits.map { |k, v| "#{k} #{v[:all]} #{"visit"}" }
  end

  private

  def create_visits
    empty_entries = Hash.new { |k, v| k[v] = Hash.new(0) }
    entries = populate_hash(empty_entries)
  end

  def populate_hash(entries)
    @logfile.each { |line| entries[line.split(' ')[0]][:all] += 1 }
    entries
  end

end
