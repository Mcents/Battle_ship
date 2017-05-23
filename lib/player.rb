require_relative 'validate'

class Player
  attr_reader :board,
              :ships

    def initialize(board, ships = [2, 3])
      @board = board
      @ships = ships
    end

    def place_ship(coordinates)
      coordinate_fill = Validate.coordinate_fill(coordinates[0], coordinates[1])
      coordinate_fill.each do |coordinate|
        binding.pry
        board.assign_square(coordinate, "S")
      end
    end


end