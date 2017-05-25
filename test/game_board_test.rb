require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'
require './lib/player'
require "pry"

class TestGameBoard < Minitest::Test

  def test_it_exists
    gboard = GameBoard.new
    assert_instance_of GameBoard, gboard
  end

  def test_can_assign_squares
    board = GameBoard.new
    board.assign_square([1, 1], "H")

    assert_equal "H", board.board[1][1]
  end

  def test_it_can_display_board
    player = Player.new(GameBoard.new)
    result = ["===========\n. 1 2 3 4  \nA  \nB  \nC  \nD  \n===========\n"]

    assert_equal result, player.board.display_board
  end

  def test_if_attack_lands_hit
    gboard = GameBoard.new

    gboard.assign_square([2,2], "S")

    assert gboard.hit?([2,2])
    refute gboard.hit?([1,2])
  end
end
