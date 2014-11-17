class CensusBureau
  def initialize(grid)
    @grid = grid
  end

  def neighbors_for(row, col)
    neighbors = []

    #neighbors in same row
    neighbors << @grid[row][col-1]
    neighbors << @grid[row][col+1]

    #neighbors in row above
    neighbors << @grid[row-1][col-1]
    neighbors << @grid[row-1][col]
    neighbors << @grid[row-1][col+1]

    #neighbors in row above
    neighbors << @grid[row+1][col-1]
    neighbors << @grid[row+1][col]
    neighbors << @grid[row+1][col+1]
  end
end
