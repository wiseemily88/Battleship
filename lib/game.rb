
require 'pry'
require './lib/gameboard'
require './lib/computer'
require './lib/messages'
require './lib/player'
# don't have methods - but create instance of the object and then create methods

class Game

  def game_set_up

  end

   select_2_unit_ship
   select_3_unit_ship

   puts message.game_set_up_message
  end
