require 'curses'

class Printer
  def print(board)
    board.each_with_index do |row, index|
      row = row.reduce("") do | result, cell |
        result += cell.alive? ? "█" : " "
      end

      Curses.setpos index, 1
      Curses.addstr row
    end

    Curses.refresh
  end
end
