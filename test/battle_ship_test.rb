require 'minitest/autorun'
require 'minitest/pride'
require './lib/battle_ship'
require "pry"

class TestBattleShip < Minitest::Test

  def test_for_player_board
    battleship = BattleShip.new

    assert_instance_of Player, battleship.cpu_board
  end

  def test_player_can_place_ships
    battleship = BattleShip.new
    battleship.cpu_board.place_ship([[0, 0], [0, 1]])

    assert_equal "S", battleship.cpu_board.board.board[0][0]
  end

end
