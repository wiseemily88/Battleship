
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
    create_spaces
  end

  def same_row?
    #if the "first letter of the coordinates are the same row = create_spaces.key

  end

  # def place_ship(ship, start_space, end_space)
  #   #places the ship in the spaces if valid
  # end
  #
  # def evaluates_ship_placement(ship, start_space, end_space)
  #   #Ships cannot wrap around the board
  #   #Ships cannot overlap
  #   #Ships can be laid either horizontally or vertically
  #   #Coordinates must correspond to the first and last units of the ship. (IE: You can’t place a two unit ship at “A1 A3”)
  # end
  #
  # def renders_board
  #   #this method will create the board based on the Gameboard
  # end
end
