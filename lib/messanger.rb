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


end
