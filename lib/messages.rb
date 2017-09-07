
module Messages

  def greeter
    puts "Welcome to BATTLESHIP"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "Prepare For Battle\n\nThe computer will place ships and then you will be prompted to place ships.
    \nSelect the start and end coordinates you wish the ship to occupy.\n\nRules for placing ships\nPlace each ship in any horizontal or vertical position, but not diagonally.\nDo not place a ship that any part of it overlaps letters, numbers, the edge of the grid, or another ship.\n\nHow to Play\nOn your turn pick a target space to attack and enter its location by letter and number.\nIf you pick a space occupied by a ship on your opponents ocean grid, your shot is a hit!\nIt is a Miss!\nIf you pick a space that is not occupied by a ship on your opponents ocean grid, it is a miss.\nAfter a hit or miss, your turn is over.\nPlay continues in this manner, with you and your opponent picking spaces one shot per turn.\nSinking a Ship\nOnce all the spaces any one ship occupies have been attacked, it has been sunk.\n\nWinning the Game\nIf you are the first player to sink all of your opponents ships, you win the game!\n"
  end

  def game_set_up_message
    puts "I have laid out my ships on the grid.\n\nYou now need to layout your two ships.\n\nThe first is two units long and the second is three units long.\n\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
  end

  def enter_3_unit_ship
    puts "Enter the squares for the three-unit ship:"
  end

  def ships_placement_invalid
    puts "Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”) \n\n Ships cannot overlap. \n\n Ships cannot wrap around the board "
  end


end
