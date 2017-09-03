require 'pry'




class Space

  def initialize (coordinates)
    @coordinates = coordinates
    @status= nil
    @empty = true
  end

  def empty?
    @empty
  end

  def ship_placed
    @empty = false
  end

  def attacked
    #if content.empty? ==false, then attacked = h, if space is empty = m
  end

end
