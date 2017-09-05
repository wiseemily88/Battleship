#Welcome to BATTLESHIP

class Greeter

puts "Welcome to BATTLESHIP"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

  def user_input
    user_selection = gets.chomp
  end

  def play_quit_instructions(user_selection)

    if user_selection == "p"
      puts "PlAY the GAME" #this will be updated later
    elsif user_selection == "i"
      puts "Prepare For Battle\n\nThe computer will place ships and then you will be prompted to place ships.
      \nSelect the start and end coordinates you wish the ship to occupy.\n\nRules for placing ships\nPlace each ship in any horizontal or vertical position, but not diagonally.\nDo not place a ship that any part of it overlaps letters, numbers, the edge of the grid, or another ship.\n\nHow to Play\nOn your turn pick a target space to attack and enter its location by letter and number.\nIf you pick a space occupied by a ship on your opponents ocean grid, your shot is a hit!\nIt is a Miss!\nIf you pick a space that is not occupied by a ship on your opponents ocean grid, it is a miss.\nAfter a hit or miss, your turn is over.\nPlay continues in this manner, with you and your opponent picking spaces one shot per turn.\nSinking a Ship\nOnce all the spaces any one ship occupies have been attacked, it has been sunk.\n\nWinning the Game\nIf you are the first player to sink all of your opponents ships, you win the game!\n"
    else
      exit
    end
  end

end

new_game = Greeter.new
user_selection = new_game.user_input
new_game.play_quit_instructions(user_selection)
