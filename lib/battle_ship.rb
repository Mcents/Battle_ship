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
      start_menu
    end
  end

  def play_game(computer_player)
    @new_game = GameBoard.new
    @new_game.display_board
    cpu_ship_placement
    @messanger.ai_ship_placed
    player_ship_placement
    game_play
  end

  def game_play
    player_shoot
  end

  def player_shoot
    display_both_boards


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
      valid_placement = false
      until valid_placement
        @messanger.player_place_ships(ship)
        player_input = gets.strip
        valid_placement = Validate.valid_pair?(player_input) && Validate.valid_ship_placement?(player_board, ship, Validate.clean_coordinates(player_input))
        @messanger.incorrect_placement if valid_placement == false
      end
      player_input = Validate.clean_coordinates(player_input)
      player_board.place_ship(player_input)
    end
  end

  def display_both_boards
    print "Your Board\n #{player_board.board.display_board}"
    print "Opponents Board\n#{cpu_board.board.display_board.gsub("S", " ")}"
  end
end

final_test = BattleShip.new
final_test.start_menu
