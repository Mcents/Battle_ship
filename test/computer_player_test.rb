require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_player'
require 'pry'

class ComputerPlayerTest < Minitest::Test

  def test_it_can_return_all_adjacent_locations
   a = ComputerPlayer.new
   result = a.all_adjacent_locations('A1')
   possibilities = ['B1', 'A2', '@1', 'A0']
   assert_equal possibilities, result
  end

  def test


end
