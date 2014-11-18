#!/usr/bin/ruby

require_relative 'app/printer'

board_1 = [[false,false,false,false,true,false,false],
             [true,false,true,false,true,false,false],
             [false,true,false,false,false,true,true]]

board_2 = [[false,false,false,false,false,true,false],
             [true,false,false,false,false,true,false],
             [false,true,true,true,true,true,true]]


printer = Printer.new

loop do
  printer.print(board_1)
  sleep 1.0/5.0
  printer.print(board_2)
  sleep 1.0/5.0
end

