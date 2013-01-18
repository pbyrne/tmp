#!/usr/bin/env ruby

def main(*args)
  display("__FILE__") { __FILE__ }
  display("dirname __FILE__") { File.dirname(__FILE__) }
  display("expand_path __FILE__") { File.expand_path(__FILE__) }
  display("join __FILE__ + 'foo'") { File.join(__FILE__, 'foo.rb') }
  display("join dirname __FILE__ + 'foo'") { File.join(File.dirname(__FILE__), 'foo.rb')}
end

def display(name, &block)
  puts name
  puts yield
end

main *ARGV
