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
    resurrect_list = []

    grid.flatten.each { |organism|
      kill_list << organism if underpopulated? organism
      kill_list << organism if overpopulated? organism
      resurrect_list << organism if love_child? organism
    }

    kill_list.map(&:kill!)
    resurrect_list.map(&:resurrect!)
  end

  private
  def underpopulated?(organism)
    @census_bureau.neighbors_for(organism).select {|org| org.alive?}.count < 2
  end

  def overpopulated?(organism)
    @census_bureau.neighbors_for(organism).select {|org| org.alive?}.count > 3
  end

  def love_child?(organism)
    @census_bureau.neighbors_for(organism).select {|org| org.alive?}.count == 3
  end
end
