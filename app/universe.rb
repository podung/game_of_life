require_relative 'organism'
require_relative 'census_bureau'

class Universe
  attr_reader :grid

  def initialize(starting_grid)
    @grid = starting_grid.split(/\n/).map { |row| row.each_char.map { |col| Organism.new(col == "#") } }
    @census_bureau = CensusBureau.new(grid)
  end

  def tick
    kill_list = []

    grid.each_with_index { |row,row_index|
      row.each_with_index { |organism, col_index|
        kill_list << organism if @census_bureau.neighbors_for(row_index, col_index).select {|org| org.alive?}.count < 2
      }
    }

    kill_list.map(&:kill!)
  end
end
