#!/usr/bin/env ruby

class ColsatzGenerator
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def run
    loop do
      puts number
      break if number <= 1
      succ!
    end
  end

  def succ!
    self.number = NextColsatzNumber.new(number).result
  end
end

class NextColsatzNumber
  def initialize(number)
    @number = number
    @cache = File.new("colsatz-ruby-cache", "r+")
    begin
    @results = Marshal.load(@cache)
    rescue
      @results = {}
    end
  end

  def result
    if r = @results[@number]
      return r
    else
      r =
        if @number.even?
          @number / 2
        else
          3 * @number + 1
        end

      @results[@number] = r
      @cache.write(Marshal.dump(@results))
    end
  end
end

ColsatzGenerator.new(10001).run
