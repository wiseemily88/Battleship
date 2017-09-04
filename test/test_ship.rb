gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'


class ShipTest < Minitest::Test

  def setup
    @new_ship = Ship.new

  end

  def test_ship_can_be_placed
    @new_ship.place("A2","A3")

    assert_equal "A2", @new_ship.start_space
    assert_equal "A3", @new_ship.end_space
  end

  def test_ship_has_a_middle_space_if_length_is_3_and_horizantal

    assert_equal "A2", @new_ship.middle_space(3, "A1", "A3")
  end

  def test_ship_has_a_middle_space_if_length_is_3_and_vertical

    assert_equal "B1", @new_ship.middle_space(3, "A1", "C1")
  end

  def test_if_ship_is_hit_hit_count_increases
    @new_ship.hit

    assert_equal 1, @new_ship.hit_count
  end

  def test_if_ship_is_hit_2_times_hit_count_increases
    @new_ship.hit
    @new_ship.hit

    assert_equal 2, @new_ship.hit_count
  end

  def test_if_ship_is_hit_2_same_as_length_it_sinks
    @new_ship.hit
    @new_ship.hit

    assert @new_ship.is_sunk?
  end

  def test_if_ship_is_hit_once_sink_is_false
    @new_ship.hit

    refute @new_ship.is_sunk?
  end

end
