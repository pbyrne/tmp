#!/usr/bin/env ruby

def main(*args)
  foo = "some value foo"

  make_game("asdf", 2) do |game|
    puts game
    puts foo
  end
end

Game = Struct.new(:name, :players) do
  def to_s
    "Game '#{name}' with #{players} player(s)"
  end
end

def make_game(name, players)
  game = Game.new name, players
  yield game
end


main *ARGV
