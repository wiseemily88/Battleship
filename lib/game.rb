
require './lib/gameboard'
require './lib/computer'
require './lib/messages'
require './lib/player'
require './lib/rules'

class Game
  include Messages
  include Rules

  def initialize(prompt_user_selection)
    @prompt_user_selection = prompt_user_selection
    @gameboard = Gameboard.new
    @computer = Computer.new
    @player = Player.new
  end

  def start_game_sequence(user_selection)
    if user_selection == "p"

      computer.select_coordinates_for_ships
      @gameboard.place_2_unit_ship(start_space_2, end_space_2)
      @gameboard.place_3_unit_ship(start_space_3, end_space_3)
      game_set_up_message

      coordinates = gets.chomp
      @player.place_2_unit_ship(coordinates)
      ships_placement_invalid unless player.run_validation_test_for_ship_2(start_space, end_space)
      coordinates = gets.chomp
      @gameboard.place_2_unit_ship(start_space_2, end_space_2)

      coordinates = gets.chomp
      @player.place_3_unit_ship(coordinates)
      ships_placement_invalid unless player.run_validation_test_for_ship_3(start_space, end_space)
      coordinates = gets.chomp
      @gameboard.place_3_unit_ship(start_space_3, end_space_3)

    elsif user_selection == "i"
      instructions
    else
      exit
    end
  end

  #def main_game_phase- this would be the REPL that loops through the shot sequence




  end

   select_2_unit_ship
   select_3_unit_ship

   puts message.game_set_up_message
  end
