require './lib/messages'
require './lib/rules'
require 'pry'
class Player

include Rules

  def initialize
    @shots_fired = 0
  end

  def run_validation_test_for_ship_2(start_space, end_space)
    if evaluates_ship_placement(start_space, end_space)
    return true
      enter_3_unit_ship
    else
      return false
    end
  end

  def run_validation_test_for_ship_3(start_space, end_space)
    if evaluates_ship_placement_unit_3(start_space, end_space)
      return true
    else
      return false
    end
  end

  def place_2_unit_ship(coordinates)
    start_space = coordinates[0..1]
    end_space = coordinates[3..4]
  end

  def place_3_unit_ship(coordinates)
    start_space = coordinates[0..1]
    end_space = coordinates[3..4]
  end


  def fire
    @shots_fired += 1
  end

end
