em 'minitest', '~> 5.2'
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

  def test_that_if_a_space_starts_as_empty

    space = Space.new("A2")

    assert space.empty?
  end

  def test_that_if_a_ship_is_placed_the_space_is_not_empty
    skip
    space = Space.new("A2")

    refute space.empty?
  end

  def test_that_if_a_space_is_attacked_and_space_is_empty_status_is_miss
    skip
    space = Space.new("A2")
    space.attacked

    assert_equal "miss", space.status
  end

  def test_that_if_a_space_is_attacked_and_space_is_not_empty_status_is_hit
    skip
    space = Space.new("A2")
    #ship_placed
    space.attacked

    assert_equal "hit", space.status
  end

end
