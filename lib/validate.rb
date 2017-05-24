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
      row = 1
    else
      row = 0
    end
    first, last = [coordinate0[row], coordinate1[row]].sort
    (first..last).map do |index|
      nate = Array.new(2)
      nate[(row + 1) % 2] = coordinate0[(row + 1) % 2]
      nate[row] = index
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

  def self.valid_coordinates?(user_input)
    return false unless user_input.class == String
    user_input = user_input.upcase.strip
    ('A'..'Z').include?(user_input[0]) &&
    ('0'..'99').to_a.include?(user_input[1..-1])
  end

  def self.inbounds?(coordinates, difficulty = 4)
    size = (0..3).to_a
    size.include?(coordinates[0]) && size.include?(coordinates[1])
  end

  def self.valid_pair?(user_input)
    split = user_input.split(' ').map { |coord| coord.strip }
    if split.length != 2
      false
    elsif !valid_coordinates?(split[0]) || !valid_coordinates?(split[1])
      false
    else
      true
    end
  end

  def self.coordinate_translation(human_enter)
    human_enter = human_enter.upcase.strip
    cpu_enter = []
    cpu_enter[0] = human_enter[0].ord - "A".ord
    cpu_enter[1] = human_enter[1..-1].to_i - 1
    cpu_enter
  end

  def self.clean_coordinates(user_input)
    human_enter = user_input.split(' ').map { |coord| coord.strip }
    cpu_enter = human_enter.map do |coord|
      coordinate_translation(coord)
    end
  end


end
