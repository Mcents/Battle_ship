require_relative 'messanger'
require_relative 'game_board'
require_relative 'ship_placement'

class BattleShip

  def initialize
    @messanger = Messanger.new
  end

  def start_menu
    @messanger.start
    input = gets.chomp

    if input == "i"
      @messanger.instructions
    elsif input == "p"
      play_game
    elsif input == "q"
      puts "Thanks for playing."
      return 0
    end
  end

  def play_game
    @new_game = GameBoard.new
    @new_game.board

    @messanger.ai_ship_placed

  end

  # def menu_options
  #   gets.downcase.chomp
  # end


end

final_test = BattleShip.new
final_test.start_menu
