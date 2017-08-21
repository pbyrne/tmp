#!ruby

require 'csv'
require 'set'
require 'time'

class GitCommit
  attr_accessor :sha, :author, :timestamp

  def initialize(sha:, author:, timestamp:)
    @sha = sha
    @author = author
    @timestamp = parse_timestamp(timestamp)
  end

  def date
    @date ||= timestamp.to_date
  end

  def <=>(other)
    self.timestamp <=> other.timestamp
  end

  private

  def parse_timestamp(timestamp)
    Time.parse(timestamp)
  end
end

class GitCommitCollection
  include Enumerable

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def each
    @commits ||= fetch_commits.sort
    @commits.each { |commit| yield commit }
  end

  def authors_by(date)
    Set.new.tap do |result|
      commits_by(date).each { |c| result << c.author }
    end
  end

  def commits_by(date)
    @commits_by ||= {}
    @commits_by[date] ||= @commits.select { |c| c.date <= date }
  end

  private

  def fetch_commits
    %x{cd #{path} && git log --pretty --format="%h,%an,%ai"}.split("\n").map do |line|
      sha, author, timestamp = line.split(",")
      GitCommit.new(sha: sha, author: author, timestamp: timestamp)
    end
  end
end

def main
  dir = File.expand_path(ARGV.first || ".")
  basename = File.basename(dir)
  commits = GitCommitCollection.new(dir)
  first_date = commits.first.date

  cumulative_stats = CSV.open(File.expand_path("~/Downloads/#{basename}-data.csv"), "w")

  cumulative_stats << ["Date", "Commits", "Authors"]

  (commits.first.date..commits.last.date).each do |date|
    cumulative_stats << [
      date,
      commits.commits_by(date).count,
      commits.authors_by(date).count,
    ]
  end
end

main
