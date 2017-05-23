require 'minitest/autorun'
require 'minitest/pride'
require './lib/validate'
require './lib/player'
require './lib/game_board'
require "pry"

class TestValidate < Minitest::Test

  def test_can_generate_random_coordinates
    player = Player.new(GameBoard.new)
    coordinates = Validate.random_coordinate_generator(1, 4)

    assert Validate.valid_ship_placement?(player, 1, coordinates)
  end

  def test_it_can_fill_in_coords
    result = [[0, 0], [0, 1], [0, 2], [0, 3]]

    assert_equal result, Validate.coordinate_fill([0, 0], [0, 3])
  end

  def test_can_tell_if_coordinates_are_same_column_or_row

    assert Validate.unique_row_and_column?([1, 3], [1, 0])
    refute Validate.unique_row_and_column?([1, 3], [3, 1])
  end

  def test_that_ships_not_placed_on_same_square
    player = Player.new(GameBoard.new)
    player.board.assign_square([0, 2], "S")
    player.board.assign_square([1, 3], "S")

    assert Validate.ships_not_placed_on_same_square?(player, [1,2], [2,4])

  end





end
