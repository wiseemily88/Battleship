gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/space'


class SpaceTest < Minitest::Test

  def test_that_a_space_starts_empty
    space = Space.new("A1")

    assert space.empty?
  end

  def test_that_a_space_can_take_a_coordinate
    space = Space.new("A2")

    assert_equal "A2", space.coordinates
  end


  def test_that_if_a_ship_is_placed_the_space_is_not_empty
    space = Space.new("A2")
    space.ship_placed

    refute space.empty?
  end

  def test_that_if_a_space_is_attacked_and_space_is_empty_status_is_miss

    space = Space.new("A2")
    space.attacked

    assert_equal "M", space.status
  end

  def test_that_if_a_space_is_attacked_and_space_is_not_empty_status_is_hit

    space = Space.new("A2")
    space.ship_placed
    space.attacked

    assert_equal "H", space.status
  end

end
