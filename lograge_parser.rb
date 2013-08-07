module LogRageParser
  class Collection
    attr_accessor :entries, :log_path

    def initialize(*paths)
      self.entries = []
      paths.each do |path|
        read_log(path)
      end
    end

    def inspect
      "#<LogRageParser::Collection @size=#{entries.size}>"
    end

    def read_log(log_path)
      log_lines(log_path).each do |line|
        self.entries << Entry.new(line, log_path)
      end
      entries.size
    end

    def log_lines(log_path)
      File.read(File.expand_path(log_path)).split("\n")
    end

    def slice_by(*key_methods)
      entries.group_by { |entry| key_methods.map { |key_method| entry.send key_method } }.map do |keys, segments|
        Slice.new segments, keys.join("/")
      end
    end

    def stats(*keys, &block)
      slice_by(*keys).each do |slice|
        yield slice
      end
      nil
    end
  end

  class Entry
    # request information
    attr_accessor :method, :path, :format, :controller, :action, :status, :location
    # timing information
    attr_accessor :duration, :db, :view
    # capture the raw line
    attr_accessor :raw_line, :log_name

    def initialize(log_line = "", log_name = "log")
      self.log_line = log_line
      self.log_name = log_name
    end

    def log_line=(log_line)
      @raw_line = log_line
      @raw_line.split.each do |segment|
        self.segment = segment
      end
    end

    def log_line
      @raw_line
    end

    def segment=(segment)
      return unless segment.index("=")
      key, value = segment.split("=")
      self.public_send("#{key.downcase}=", value)
    end

    def duration
      @duration.to_f
    end

    def db
      @db.to_f
    end

    def view
      @view.to_f
    end
  end

  class Slice
    attr_accessor :entries, :key

    def initialize(entries=[], key="everything")
      self.entries = entries
      self.key = key
    end

    def inspect
      "#<LogRageParser::Slice @name=#{name} @size=#{size}>"
    end

    def name
      key
    end

    def mean(attr)
      (fetch(attr).inject(0, :+) / size).round(2)
    end

    def median(attr)
      (fetch(attr)[(size - 1) / 2] + fetch(attr)[size / 2]) / 2.0
    end

    def percentile(attr, tile=95)
      index = (tile.to_f/100*size).ceil
      fetch(attr)[index]
    end

    def min(attr)
      fetch(attr).first
    end

    def max(attr)
      fetch(attr).last
    end

    def fetch(attr)
      @fetch ||= {}
      @fetch[attr] ||= entries.map(&attr).sort
    end

    def size
      @count ||= entries.size
    end
  end
end

__END__

collection = LogRageParser::Collection.new(*(1..8).map { |i| "app0#{i}.rss.log" })
actions = collection.slice_by(:controller, :action)
servers = collection.slice_by(:log_name)

[actions, servers].each do |slice_group|
  puts "---------------------"
  slice_group.sort_by { |s| s.mean(:duration) }.each do |slice|
    puts "#{slice.name} #{slice.size}: mean: #{slice.mean :duration}, 95th: #{slice.percentile(:duration, 95)}, min: #{slice.min(:duration)}, max: #{slice.max(:duration)}"
  end; nil
end; nil

actions.sort_by(&:size).reverse[0,5].each do |slice|
  puts "#{slice.name} #{slice.size}: mean: #{slice.mean :duration}, 95th: #{slice.percentile(:duration, 95)}, min: #{slice.min(:duration)}, max: #{slice.max(:duration)}"
end;nil

