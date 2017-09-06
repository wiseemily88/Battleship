
require 'pry'
require './lib/space'

class Gameboard
  attr_accessor :level, :spaces

  def initialize
    @spaces = {}
    @whose_board = "player1"
    @level = level #update you later!

    create_space_names = create_space_names(level)
    create_spaces(create_space_names)
  end

 def create_space_name_array(letters, numbers)
   letters.map do |letter|
     numbers.map do |number|
      "#{letter}#{number}"
     end
   end.flatten
  end

  def create_space_names(level)
    if level == "Beginner"
      letters = ("A".."D")
      numbers = (1..4)
    elsif level == "Intermediate"
      letters = ("A".."H")
      numbers = (1..8)
    else
      letters = ("A".."L")
      numbers = (1..12)
    end
    create_space_name_array(letters, numbers)
  end

  def create_spaces(create_space_names)
    create_space_names.map do |name|
      @spaces.merge!({name => Space.new(name)})
    end
  end

  def middle_space(start_space, end_space)
    if start_space[0] == end_space[0]
      middle_space = start_space.next
    else
      middle_space = start_space[0].next + start_space[1]
    end
  end

  def place_2_unit_ship(start_space, end_space)
    @spaces[start_space].empty = false
    @spaces[end_space].empty = false
  end

  def place_3_unit_ship(start_space, end_space)
    mid_space = middle_space(start_space, end_space)
    @spaces[mid_space].empty = false
    @spaces[start_space].empty = false
    @spaces[end_space].empty = false
  end


end
