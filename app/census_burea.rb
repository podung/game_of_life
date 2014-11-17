class CensusBureau
  def initialize(grid)
    @grid = grid
    raise "invalid starting grid" unless valid?
  end

  def neighbors_for(row, col)
    neighbors = []

    #neighbors in same row
    neighbors << @grid[row][col-1] if col > 0
    neighbors << @grid[row][col+1] if col < @grid[0].size - 1

    #neighbors in row above
    if (row > 0)
      neighbors << @grid[row-1][col-1] if col > 0
      neighbors << @grid[row-1][col]
      neighbors << @grid[row-1][col+1] if col < @grid[0].size - 1
    end

    #neighbors in row below
    if (row < @grid.size - 1)
      neighbors << @grid[row+1][col-1] if col > 0
      neighbors << @grid[row+1][col]
      neighbors << @grid[row+1][col+1] if col < @grid[0].size - 1
    end

    neighbors
  end

  private
  def valid?
    @grid.all? { |row| row.size == @grid.first.size }
  end
end
