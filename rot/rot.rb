#!/usr/bin/env ruby

def main
  increment = ARGV.first || 13
  rotator = Rotator.new(increment)
  puts rotator.rotate(STDIN.read)
end

class Rotator
  attr_reader :increment, :mapping

  ALPHA = ('a'..'z').to_a

  def initialize(increment)
    @increment = increment.to_i
    @mapping ||= Hash[ALPHA.zip(ALPHA.rotate(@increment))]
  end

  def rotate(text)
    text.downcase.each_char.map do |char|
      self[char]
    end.join
  end

  def [](char)
    mapping[char] || char
  end
end

main
