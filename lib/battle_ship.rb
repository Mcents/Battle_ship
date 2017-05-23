require_relative 'messanger'
require_relative 'game_board'
require_relative 'player'
require_relative 'validate'

class BattleShip
  attr_accessor :computer,
                :human,
                :cpu_board,
                :player_board

  def initialize
    @messanger = Messanger.new
    @cpu_board = Player.new(GameBoard.new)
    @player_board = Player.new(GameBoard.new)

  end

  def start_menu
    @messanger.start
    input1 = gets.chomp
      if input1 == "i"
        @messanger.instructions
        start_menu
      elsif input1 == "p"
        play_game(@computer)
      elsif input1 == "q"
        puts "Thanks for playing."
        abort
      else
      puts "Learn your letters! Try again!"
      input1 = gets.chomp
    end
  end

  def play_game(computer_player)
    @new_game = GameBoard.new
    @new_game.display_board
    cpu_ship_placement
    @messanger.ai_ship_placed
    player_ship_placement
  end


  def cpu_ship_placement
    cpu_board.ships.each do |ship|
      valid_placement = false
      until valid_placement
        coordinates = Validate.random_coordinate_generator(ship, 4)
        valid_placement = Validate.valid_ship_placement?(cpu_board, ship, coordinates)
      end
      cpu_board.place_ship(coordinates)
    end
  end

  def player_ship_placement
    player_board.ships.each do |ship|
        @messanger.player_place_ships(ship)
        player_input = gets.to_i
        player_board.place_ship(player_input)

    end
  end
end

final_test = BattleShip.new
final_test.start_menu
