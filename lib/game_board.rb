 require 'pry'
 require_relative 'messanger'
class GameBoard

  attr_reader :board

    def initialize
      @board=[[" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "]]
      @messanger = Messanger.new
    end

    def assign_square(coordinates, status)
        row, column = coordinates
        board[row][column] = status
      end

    def display_board
    display = ["===========\n. 1 2 3 4  ", "\nA ", " \nB ", " \nC ", " \nD ", " \n===========\n"]
    board.each_with_index do |row, row_index|
      row.each do |column|
        display[row_index + 1] << "#{column} "
      end
    end
    display.join
  end

    def hit?(coordinates)
      row, column = coordinates
      board[row][column] == "S"
    end

  def attack(coordinates)
    row, column = coordinates
    if board[row][column] == "S"
      @messanger.hit
      assign_square(coordinates, "H")

    else
      @messanger.miss
      assign_square(coordinates, "M")
    end
  end
end
