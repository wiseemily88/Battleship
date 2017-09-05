
#require './lib/space'
require 'pry'
require './lib/space'

class Gameboard
  attr_accessor :level

  def initialize
    @spaces = {}
    @whose_board = "player1"
    @level = level #update you later!
  end

  def create_space_names(level)
    create_space_names = []
    if level == "Beginner"
      ("A".."D").each do |letter|
        (1..4).each do |number|
          create_space_names << "#{letter}#{number}"
        end
      end
    elsif level == "Intermediate"
      ("A".."H").each do |letter|
        (1..8).each do |number|
          create_space_names << "#{letter}#{number}"
        end
      end
    else
      ("A".."L").each do |letter|
        (1..12).each do |number|
        create_space_names << "#{letter}#{number}"
        end
      end
    end
    create_space_names
  end

  def create_spaces(create_space_names)
    create_space_names.map do |name|
      [name, Space.new(name)]
    end.to_h
  end

  def middle_space(length, start_space, end_space)
    if length != 2 && start_space[0] == end_space[0]
      middle_space = start_space.next
    else length != 2 && start_space[1] == end_space[1]
      middle_space = start_space[0].next + start_space[1]
    end
  end

  def place_ship(evaluates_ship_placement = true, length, start_space, end_space)
    gamespaces = create_spaces(["A1", "A2", "A3", "A4","B1", "B2", "B3", "B4","C1", "C2", "C3", "C4","D1", "D2", "D3", "D4"])
      if length == 2
        gamespaces[start_space].empty = false
        gamespaces[end_space].empty = false
      elsif length == 3
        mid_space(length, start_space, end_space) #will take this out later
        gamespaces[mid_space].empty = false
        gamespaces[start_space].empty = false
        gamespaces[end_space].empty = false
      end  
  end

  def evaluates_ship_placement(length, start_space, end_space)
    if length == 2
      if start_space.next == end_space || start_space[0].next == end_space[0] && start_space[1] == end_space[1]
        return true
      else
        return false
      end
    elsif length == 3
      if start_space.next.next == end_space || start_space[0].next.next == end_space[0] && start_space[1] == end_space[1]
        return true
      else
        return false
      end
    end
  end





  #   #Ships cannot overlap

  #   #Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)
  # end
  #
  # def renders_board
  #   #this method will create the board based on the Gameboard
  # end
end
