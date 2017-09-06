
class Player

  def initialize(ship_types)
    @shots_fired = 0
    @known_spaces = []
    @ships = ship_types
    @fleet = []
    assemble_the_fleet
  end

  def fire
    @shots_fired += 1
  end

  def uncover(coordinates)
    @known_spaces << coordinates
  end

  def ship_count
    @fleet.length
  end

  def assemble_the_fleet
    @fleet = @ships.map { |length| Ship.new(length) }
  end

  def get_ship(type)
    @fleet.find { |ship| ship.length == type }
  end

  def place_ship(board, ship, start_space, end_space)
    ship.place(start_space, end_space)
    board.set_spaces_occupied(start_space, end_space)
  end

  def attack(board, coordinate)
    fire
    board.set_space_attacked(coordinate)
  end

  def check_if_game_is_lost
    fleet.all? { |ship| ship.is_sunk? }
  end

end
