gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard'
require 'simplecov'

SimpleCov.start


class GameboardTest < Minitest::Test
  def setup
    @new_gameboard = Gameboard.new
  end

  def test_that_gameboard_exits
    assert_instance_of  Gameboard, @new_gameboard
  end

  def test_that_create_space_is_4_by_4_if_beginner

    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert_equal expected, @new_gameboard.create_space_names("Beginner")
  end

  def test_that_create_space_is_8_by_8_if_intermediate
    expected = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8",
                "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8",
                "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8",
                "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8",
                "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8",
                "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8",
                "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8",
                "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8"]
    assert_equal expected, @new_gameboard.create_space_names("Intermediate")
  end

  def test_that_create_spaces_creates_game_hash
    input =["A1", "A2", "A3", "A4",
            "B1", "B2", "B3", "B4",
            "C1", "C2", "C3", "C4",
            "D1", "D2", "D3", "D4"]

    @new_gameboard.create_spaces(input)


    assert_equal "A1", @new_gameboard.spaces["A1"].coordinates

  end


  def test_that_spaces_is_filled_when_a_2_unit_ship_is_assigned
    @new_gameboard.place_ship(2, "A1","A2")

    assert_equal false, @new_gameboard.spaces["A1"].empty
  end

  def test_that_middle_space_returns_the_middle_value
    assert_equal "A2", @new_gameboard.middle_space(3, "A1","A3")
  end

  def test_that_middle_space_returns_the_middle_value
    assert_equal "B1", @new_gameboard.middle_space(3, "A1","C1")
  end

  def test_that_spaces_is_filled_when_a_3_unit_ship_is_assigned

    @new_gameboard.place_ship(3, "A1","A3")

    assert_equal false, @new_gameboard.spaces["A1"].empty
    assert_equal false, @new_gameboard.spaces["A2"].empty
    assert_equal false, @new_gameboard.spaces["A3"].empty  
  end

  def test_that_evaluates_ship_placement_returns_true_if_horizantal

    assert @new_gameboard.evaluates_ship_placement(2, "A1","A2")
  end

  def test_that_evaluates_ship_placement_returns_true_if_vertical

    assert @new_gameboard.evaluates_ship_placement(2, "A1","B1")
  end

  def test_that_evaluates_ship_placement_returns_false_if_not_adjacent

    refute @new_gameboard.evaluates_ship_placement(2, "A1","C1")
  end

  def test_that_evaluates_ship_placement_returns_false_if_it_wraps

    refute @new_gameboard.evaluates_ship_placement(2, "D4","D1")
  end

  def test_that_evaluates_ship_placement_returns_true_if_horizantal

    assert @new_gameboard.evaluates_ship_placement(3, "A1","A3")
  end

  def test_that_evaluates_ship_placement_returns_true_if_vertical

    assert @new_gameboard.evaluates_ship_placement(3, "A1","C1")
  end

  def test_that_evaluates_ship_placement_returns_false_if_not_adjacent

    refute @new_gameboard.evaluates_ship_placement(3, "A1","D1")
  end

  def test_that_evaluates_ship_placement_returns_false_if_it_wraps

    refute @new_gameboard.evaluates_ship_placement(3, "D4","D2")
  end



end
