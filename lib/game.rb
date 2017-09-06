
def computer_ship_placement
   select_2_unit_ship
   select_3_unit_ship

   puts message.game_set_up_message
 end

 def player_ship_placement
   start_space_2 = gets.chomp
