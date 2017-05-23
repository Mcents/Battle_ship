require 'pry'
module Validate

  def self.random_coordinate_generator(ship, board_size)
    row = rand(board_size)
    column = rand(board_size - (ship - 1))
    coordinates = [[row, column], [row, (column + ship - 1)]]
    if rand(2) == 1
      coordinates = coordinates.map { |coord| coord.reverse }
    end
    coordinates
  end


  def self.coordinate_fill(coordinate0, coordinate1)
    if coordinate0[0] == coordinate1[0]
      axis = 1
    else
      axis = 0
    end
    first, last = [coordinate0[axis], coordinate1[axis]].sort
    (first..last).map do |index|
      nate = Array.new(2)
      nate[(axis + 1) % 2] = coordinate0[(axis + 1) % 2]
      nate[axis] = index
      nate
    end
  end

  def self.unique_row_and_column?(coordinate0, coordinate1)
    coordinate0[0] == coordinate1[0] || coordinate0[1] == coordinate1[1]
  end

  def self.ships_not_placed_on_same_square?(player, coordinate0, coordinate1)
    coordinate_fill = coordinate_fill(coordinate0, coordinate1)
    coordinate_fill.all? do |coord|
      player.board.board[coord[0]][coord[1]] != "S"
    end
  end

  def self.distance(coordinate0, coordinate1)
    (coordinate0[0] - coordinate1[0]).abs +
    (coordinate0[1] - coordinate1[1]).abs
  end


  def self.valid_ship_placement?(player, ship, coordinates)
    coordinate0, coordinate1 = coordinates
    unique_row_and_column?(coordinate0, coordinate1) &&
    distance(coordinate0, coordinate1) + 1 == ship &&
    inbounds?(coordinate0, player) &&
    inbounds?(coordinate1, player) &&
    ships_not_placed_on_same_square?(player, coordinate0, coordinate1)
  end

  def self.inbounds?(coordinates, difficulty = 4)
    if difficulty = 4
      size = (0..3).to_a
    end
    size.include?(coordinates[0]) && size.include?(coordinates[1])
  end



end
