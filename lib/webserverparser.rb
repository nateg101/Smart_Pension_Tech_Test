class WebserverParser

  attr_accessor :logfile

  def initialize(log_file)
    @logfile = File.open(log_file).map(&:strip)
  end

  def most_views
    create_visits.map { |k, v| "#{k} #{v[:all]} #{"visits"}" }
  end

  def unique_views
    create_unique_visits.map { |k, v| "#{k} #{v[:unique]} #{"unique visits"}" }
  end

  private

  def create_visits
    empty_entries = Hash.new { |k, v| k[v] = Hash.new(0) }
    entries = populate_hash(@logfile, empty_entries, :all)
  end

  def create_unique_visits
    empty_entries = Hash.new { |k, v| k[v] = Hash.new(0) }
    entries = populate_hash(@logfile.uniq, empty_entries, :unique)
  end

  def populate_hash(file, entries, count_type)
    file.each { |line| entries[line.split(' ')[0]][count_type] += 1 }
    entries.sort_by { |k, v| v[count_type] }.reverse
  end

end
