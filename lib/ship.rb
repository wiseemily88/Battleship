class Ship

  attr_reader :length
  attr_accessor :hit_count

  def initialize(length = 2)
    @hit_count = 0
    @length = length
  end

  def hit
    @hit_count += 1
  end

  def is_sunk?
    true if @hit_count == @length
  end


end
