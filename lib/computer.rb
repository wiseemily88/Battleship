require 'pry'
require './lib/gameboard'

class Computer


  def place_2_unit_ship
    board = Gameboard.new
    create_space_names = board.create_space_names("Beginner")
    start_space_2 = select_start_space(create_space_names)
    end_space_2 = select_end_space_2_unit(start_space_2)
  end

  def place_3_unit_ship
    board = Gameboard.new
    create_space_names = board.create_space_names("Beginner")
    start_space_3 = validate_ships_dont_overlap(start_space, start_space_2, end_space_2)
    end_space_3 = select_end_space_2_unit(start_space_2)
  end

  def validate_ships_dont_overlap(start_space, start_space_2, end_space_2)
    loop do
      start_space = select_start_space(create_space_names)
      break start_space unless start_space == start_space_2 || start_space == end_space_2
    end
  end

  def select_start_space(create_space_names)
    start_space = create_space_names.sample
  end

  def select_end_space_2_unit(start_space)
    space_options = []
    number = start_space[1]
    letter = start_space[0]
    if number == "1" && letter == "A"
      space_options << "#{(letter.codepoints[0]+1).chr}#{number}"
      space_options << start_space.next
    elsif number == "1"
      space_options << "#{(letter.codepoints[0]+1).chr}#{number}"
      space_options << "#{(letter.codepoints[0]-1).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]+1).chr}"
    elsif letter == "A"
      space_options << "#{(letter.codepoints[0]+1).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]-1).chr}"
      space_options << "#{letter}#{(number.codepoints[0]+1).chr}"
    elsif letter == "D"
      space_options << "#{(letter.codepoints[0]-1).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]-1).chr}"
      space_options << "#{letter}#{(number.codepoints[0]+1).chr}"
    elsif number == "4"
      space_options << "#{(letter.codepoints[0]+1).chr}#{number}"
      space_options << "#{(letter.codepoints[0]-1).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]-1).chr}"
    else
      space_options << "#{(letter.codepoints[0]-1).chr}#{number}"
      space_options << "#{(letter.codepoints[0]+1).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]+1).chr}"
      space_options << "#{letter}#{(number.codepoints[0]-1).chr}"
    end
    space_options.sample
  end

  def select_end_space_3_unit(start_space)
    space_options = []
    number = start_space[1]
    letter = start_space[0]
    if number == "1" && letter == "A" || number == "1" && letter == "B"
      space_options << "#{(letter.codepoints[0]+2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]+2).chr}"
    elsif number == "1" && letter == "C" || number == "1" && letter == "D"
      space_options << "#{(letter.codepoints[0]-2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]+2).chr}"
    elsif letter == "A" && number == "2" || letter == "B" && number == "2"
      space_options << "#{(letter.codepoints[0]+2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]+2).chr}"
    elsif letter == "A" && number == "3" || letter == "B" && number == "3"
      space_options << "#{(letter.codepoints[0]+2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]-2).chr}"
    elsif letter == "C" && number == "3" || letter == "D" && number == "3"
      space_options << "#{(letter.codepoints[0]-2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]-2).chr}"
    elsif letter == "C" && number == "2" || letter == "D" && number == "2"
      space_options << "#{(letter.codepoints[0]-2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]+2).chr}"
    elsif number == "4" && letter == "A" || number == "4" && letter == "B"
      space_options << "#{(letter.codepoints[0]-2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]-2).chr}"
    elsif number == "4" && letter == "C" || number == "4" && letter == "D"
      space_options << "#{(letter.codepoints[0]+2).chr}#{number}"
      space_options << "#{letter}#{(number.codepoints[0]-2).chr}"
    end
    space_options.sample
  end


end
