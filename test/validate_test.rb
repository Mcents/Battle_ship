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

  def test_if_can_find_distance

  assert_equal 3, Validate.distance([0, 0], [0, 3])
  end

  def test_that_diagonal_placement_is_not_possible
    player = Player.new(GameBoard.new)

    assert Validate.valid_ship_placement?(player, 3, [[1, 1], [1, 3]])
    refute Validate.valid_ship_placement?(player, 3, [[2, 2], [3, 3]])
  end

  def test_for_valid_human_attack
    player = Player.new(GameBoard.new)
    player.board.assign_square([1, 4], "H")

    refute Validate.valid_human_attack?('e1', player.board)
  end

  def test_if_coords_are_inbounds

    assert Validate.inbounds?([2,1])
    refute Validate.inbounds?([8,4])
  end

  def test_if_can_generate_valid_random_ship_placement
    player = Player.new(GameBoard.new)
    coords = Validate.random_coordinate_generator(1,3)

    assert Validate.valid_ship_placement?(player, 2, coords)
  end

  def test_if_valid_human_attack
    player = Player.new(GameBoard.new)
    player.board.assign_square([1,2], "H")

    assert Validate.valid_human_attack?("B1", player.board)
  end


end
