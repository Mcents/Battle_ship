require 'minitest/autorun'
require 'minitest/pride'
require './lib/battle_ship'
require "pry"

class TestBattleShip < Minitest::Test

  def test_for_start_sequence
    battleship = BattleShip.new

    assert_equal "Welcome to BATTLESHIP. Would you like to (p)lay, read the (i)nstructions, or (q)uit?", battleship.start_menu
  end






end
