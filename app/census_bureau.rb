class CensusBureau
  def initialize(grid)
    raise "invalid starting grid" unless valid?(grid)

    @grid = grid.flatten
    @width = grid.first.size
    @height = grid.size
  end

  def neighbors_for(organism)
    neighbors_dictionary[organism]
  end

  private
  def valid?(grid)
    grid.all? { |row| row.size == grid.first.size }
  end

  def neighbors_dictionary
    neighbors_array = @grid.each_with_index.map { |organism, index| [organism, grid_neighbors(index)] }
    @neighbors_dictionary ||= Hash[ neighbors_array ]
  end


  def grid_neighbors(index)
    neighbors = []

    #neighbors in same row
    neighbors << @grid[index-1] unless leftmost_column?(index)
    neighbors << @grid[index+1] unless rightmost_column?(index)

    #neighbors in row above
    unless top_row?(index)
      neighbors << @grid[index - @width - 1] unless leftmost_column?(index)
      neighbors << @grid[index - @width]
      neighbors << @grid[index - @width + 1] unless rightmost_column?(index)
    end

    #neighbors in row below
    unless bottom_row?(index)
      neighbors << @grid[index + @width - 1] unless leftmost_column?(index)
      neighbors << @grid[index + @width]
      neighbors << @grid[index + @width + 1] unless rightmost_column?(index)
    end

    neighbors
  end


  private
  def leftmost_column?(index)
    index % @width == 0
  end

  def rightmost_column?(index)
    index % @width == @width - 1
  end

  def top_row?(index)
    index < @width
  end

  def bottom_row?(index)
    index >= @width * (@height - 1)
  end
end
