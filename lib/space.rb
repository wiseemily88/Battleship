

class Space
attr_accessor :empty
attr_reader :coordinates,:status

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
    if @empty == false
      @status = "H"
    else
      @status = "M"
    end
  end

end
