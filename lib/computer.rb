require'pry'

class Computer

  def select_start_space(create_space_names)

    start_space = create_space_names.sample
    start_space
  end

  def select_end_space(start_space)
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
    space_options.sample
    binding.pry
    end
  end
end
