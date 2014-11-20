#!/usr/bin/ruby

require_relative 'app/printer'
require_relative 'app/universe'

starting_grid = 30.times.map {
  100.times.map {
    Random.rand(100000) % 3 == 0 ? "#" : " "
  }.join
}.join("\n")

printer = Printer.new
universe = Universe.new(starting_grid)

loop do
  printer.print(universe.grid)
  universe.tick
  sleep 1.0/2
end

