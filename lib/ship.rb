class Ship

  attr_reader :start_space, :end_space, :hit_count
  attr_accessor :length

  def initialize(length = 2)
    @hit_count = 0
    @start_space = nil
    @end_space = nil
    @mid_space = nil
    @length = length
  end


  def place(start_space, end_space)
    @start_space = start_space
    @end_space = end_space
  end

  def middle_space(length, start_space, end_space)
    if length != 2 && start_space[0] == end_space[0]
      middle_space = start_space.next
    else length != 2 && start_space[1] == end_space[1]
      middle_space = start_space[0].next + start_space[1]
    end
  end

  def hit
    @hit_count += 1
  end

  def is_sunk?
    true if @hit_count == @length
  end


end
