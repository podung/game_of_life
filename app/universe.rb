require_relative 'organism'

class Universe
  attr_reader :grid

  def initialize(starting_grid)
    @grid = starting_grid.split(/\n/).map { |row| row.each_char.map { |col| Organism.new(col == "#") } }
  end
end
