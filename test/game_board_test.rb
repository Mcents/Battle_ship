require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'
require "pry"

class TestGameBoard < Minitest::Test

  def test_it_exists
    gboard = GameBoard.new
    assert_instance_of GameBoard, gboard
  end

  def test_for_display_board
    gboard = GameBoard.new

    assert_equal ["===========\n. 1 2 3 4  \nA  \nB   \nC  \nD  \n===========\n"], gboard.display_board
  end

end
