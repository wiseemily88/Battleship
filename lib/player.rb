
class Player

  def initialize(ship_types)
    @shots_fired = 0
    @known_spaces = []
    @ships = ship_types
    @fleet = []
    assemble_the_fleet
  end

  def place_2_unit_ship
    start_space_2 = gets.chomp
    end_space_2 = gets.chomp
    confirm_ship_placement_for_2_unit(start_space_2, end_space_2)
  end

  def place_3_unit_ship
    start_space_3 = gets.chomp
    end_space_3 = gets.chomp
    confirm_ship_placement_for_3_unit(start_space_3, end_space_3)
  end

  def fire
    @shots_fired += 1
  end

  def uncover(coordinates)
    @known_spaces << coordinates
  end

  def ship_count
    @fleet.length
  end




  def attack(board, coordinate)
    fire
    board.set_space_attacked(coordinate)
  end

  def check_if_game_is_lost
    fleet.all? { |ship| ship.is_sunk? }
  end

end
