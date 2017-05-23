require_relative 'messanger'
require_relative 'game_board'
require_relative 'player'
require_relative 'validate'

class BattleShip
  attr_accessor :computer,
                :human,
                :cpu_board

  def initialize
    @messanger = Messanger.new
    @cpu_board = Player.new(GameBoard.new)
    @player_board = Player.new(GameBoard.new)

  end

  def start_menu
    @messanger.start
    input = gets.chomp

    if input == "i"
      @messanger.instructions
    elsif input == "p"
      play_game(@computer)
    elsif input == "q"
      puts "Thanks for playing."
      return 0
    end
  end

  def play_game(computer_player)
    @new_game = GameBoard.new
    @new_game.display_board
    cpu_ship_placement
    @messanger.ai_ship_placed
  end


  def cpu_ship_placement
    cpu_board.ships.each do |ship|
      valid_placement = false
      until valid_placement
        coordinates = Validate.random_coordinate_generator(ship, 4)
        valid_placement = cpu_board.place_ship(coordinates)
      end
    end
  end

end

final_test = BattleShip.new
final_test.start_menu
binding.pry
