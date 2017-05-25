require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/game_board'

class TestPlayer < Minitest::Test

  def test_if_it_can_place_ships
    player = Player.new(GameBoard.new)
    player.place_ship([[1,1], [1,2]])

    assert_equal "S", player.board.board[1][1]
  end

  def test_that_there_are_two_ships
    player = Player.new(GameBoard.new)

    assert_equal [2,3], player.ships
  end
end
