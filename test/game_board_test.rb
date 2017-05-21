require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'
require "pry"

class TestGameBoard < Minitest::Test

  def test_for_header_and_footer
    gboard = GameBoard.new

    assert_equal ["============"], gboard.header_and_footer
  end

  def test_for_column_labels
    gboard = GameBoard.new

    assert_equal [".", "1", "2", "3", "4"], gboard.column_labels
  end

  def test_for_letter_rows
    gboard = GameBoard.new

    assert_equal ["A", " ", " ", " ", " "], gboard.row("A")
  end

  def test_rows_and_columns_together
    gboard = GameBoard.new

    assert_equal [["============"], [".", "1", "2", "3", "4"], ["A", " ", " ", " ", " "], ["B", " ", " ", " ", " "], ["C", " ", " ", " ", " "], ["D", " ", " ", " ", " "], ["============"]], gboard.full_board
  end

end
