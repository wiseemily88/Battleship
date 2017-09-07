require 'pry'
require './lib/gameboard'
require './lib/rules'


class Computer

include Rules

  def select_coordinates_for_ships
    board = Gameboard.new
    create_space_names = board.create_space_names("Beginner")
    start_space_2 = select_start_space(create_space_names)
    end_space_2 = select_end_space(create_space_names, start_space_2)
    confirm_ship_placement_for_2_unit(create_space_names, start_space_2, end_space_2)
    create_space_names = remove_coordinates_for_ship_2(create_space_names, start_space_2, end_space_2)
    start_space_3 = select_start_space(create_space_names)
    end_space_3 = select_end_space(create_space_names, start_space_3)
    middle_space = middle_space(start_space_3, end_space_3)
    confirm_ship_placement_for_3_unit(create_space_names, start_space_3, end_space_3, middle_space)
  end

  def select_start_space(create_space_names)
    create_space_names.sample
  end

  def select_end_space(create_space_names, start_space)
    create_space_names.delete_if{|coordinate| coordinate == start_space}.sample
  end

  def remove_coordinates_for_ship_2(create_space_names, start_space, end_space)
    create_space_names.delete_if{|coordinate| coordinate == start_space ||
    coordinate == end_space}
  end

end
