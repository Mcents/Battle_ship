require 'minitest/autorun'
require 'minitest/pride'
require './lib/battle_ship'
require "pry"

class TestBattleShip < Minitest::Test

  def test_for_start_sequence
    battleship = BattleShip.new

  end
end
