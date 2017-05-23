 require 'pry'
class GameBoard

  attr_accessor :display_board,
                :board



    def initialize
      @board=[[" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "]]
    end

    def assign_square(coordinates, status)
        row, column = coordinates
        board[row][column] = status
      end

    def display_board
    puts display = ["===========\n. 1 2 3 4  ", "\nA ", " \nB ", " \nC ", " \nD ", " \n===========\n"]
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
      assign_square(coordinates, "H")
    else
      assign_square(coordinates, "M")
    end
  end
end
