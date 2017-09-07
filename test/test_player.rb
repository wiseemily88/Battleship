gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require 'simplecov'

SimpleCov.start


class PlayerTest < Minitest::Test

  def test_player_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_place_2_unit_ship_returns_start_and_end_space
    player = Player.new
    coordinates = "A2 A3"

    expected_start = "A2"
    expected_end = "A3"

    assert_equal expected_end, player.place_2_unit_ship(coordinates)
  end

  def test_that_run_validation_assigns_valid_values

    player = Player.new

    assert player.run_validation_test_for_ship_2("A2", "A3")
  end

  def test_that_run_sends_message_if_invalid

    player = Player.new

    refute player.run_validation_test_for_ship_2("A2", "D3")
  end

  def test_place_3_unit_ship_divides_to_end_and_start

    player = Player.new
    coordinates = "B2 B4"
    expected_end = "B4"

    assert_equal expected_end, player.place_3_unit_ship(coordinates)
  end

  def test_that_run_validation_returns_true_if_valid

    player = Player.new
    expected_end = "B4"

    assert player.run_validation_test_for_ship_3("B2", "B4")
  end

  def test_that_run_validation_returns_false_if_invlaid

    player = Player.new
    expected_end = "B4"

    assert player.run_validation_test_for_ship_3("B2", "B4")
  end



  end
