gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'


class ShipTest < Minitest::Test

  def setup
    @new_ship = Ship.new
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
