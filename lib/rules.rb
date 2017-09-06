module Rules


  def confirm_ship_placement_for_2_unit(start_space, end_space)
    loop do
      end_space_2 = select_end_space_2_unit(start_space)
      break end_space_2 unless evaluates_ship_placement( start_space, end_space)
     end
  end

  def same_row?(start_space, end_space)
    true if start_space[0] == end_space[0]
  end

  def same_column?(start_space, end_space)
    true if start_space[1] == end_space[1]
  end

  def adjacent_row?(start_space, end_space)
    true if start_space[1].next == end_space[1] ||
    (start_space[1].ord - 1).chr == end_space[1]
  end

  def adjacent_column?(start_space, end_space)
    true if start_space[0].next == end_space[0] ||
    (start_space[0].ord - 1).chr == end_space[0]
  end

  def evaluates_ship_placement(start_space, end_space)
    if
      (same_row?(start_space, end_space) && adjacent_row?(start_space, end_space)) ||
      (same_column?(start_space, end_space) && adjacent_column?(start_space, end_space))
      return true
    else
      return false
    end
  end

  def unit3_row?(start_space, end_space)
    true if start_space[1].next.next == end_space[1] ||
    (start_space[1].ord - 2).chr == end_space[1]
  end

  def unit3_column?(start_space, end_space)
    true if start_space[0].next.next == end_space[0] ||
    (start_space[0].ord - 2).chr == end_space[0]
  end

  def evaluates_ship_placement_unit_3(start_space, end_space)
    if
      (unit3_row?(start_space, end_space) && same_row?(start_space, end_space)) ||
      (unit3_column?(start_space, end_space) && same_column?(start_space, end_space))
      return true
    else
      return false
    end
  end

  def confirm_ship_placement_for_3_unit(start_space, end_space)
    loop do
      end_space_3 = select_end_space(start_space)
      break end_space_3 unless evaluates_ship_placement_unit_3(start_space, end_space)
     end
  end

  def middle_space(start_space, end_space)
    if start_space[0] == end_space[0]
      middle_space = start_space.next
    else
      middle_space = start_space[0].next + start_space[1]
    end
  end

  def validate_ships_dont_overlap(start_space, end_space, middle_space)
    loop do
      end_space_3 = select_end_space(start_space)
      break end_space_3 unless end_space_3 == start_space|| end_space_3 == end_space || end_space_3 == middle_space
    end
  end

  def remove_coordinates_for_ship_2(start_space, end_space)
    board = Gameboard.new
    create_space_names = board.create_space_names("Beginner")
    create_space_names.delete_if{|coordinate| coordinate == start_space ||
    coordinate == end_space}
  end