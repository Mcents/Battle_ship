class Messanger

  def start
    puts "Welcome to BATTLESHIP."
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "You have a grid from A1 to D4. Place a 2-unit ship and a 3-unit ship on the board.\n You and your opponent will alternate taking shots at eachother's boards.\n If there is a miss a M will be marked on the corresponding cordinate. An H will be placed for a hit.\n Whoever sinks all of their opponents ships first will win."

  end

  def ai_ship_placed
    puts "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.\n
    Enter the squares for the two-unit ship:\n"
  end

  def player_place_ships(ship)
    puts "Choose the coordinates for your #{ship}-unit ship."
  end

  def incorrect_placement
    puts "You've placed your coordinates incorrectly. Here are some rules to guide you:\n
    *Ships cannot wrap around the board
    *Ships cannot overlap
    *Ships can be laid either horizontally or vertically
    *Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)"
  end

  def enter_attack_coords
    puts "Please enter your coordinates to fire!"
  end

  def invalid_attack
    puts "The coordinates you entered are invalid"
  end

  def end_turn
    puts "The turn is over. Please hit enter to pass"
  end

  def cpu_attacked(coords)
    puts "The cpu has attacked #{coords}"
  end

  def win
    puts "YOU WIN!"
  end

  def lose
    puts "YOU LOSE, SORRY"
  end

  def hit
    puts "HIT!"
  end

  def miss
    puts "MISS!"
  end

end
