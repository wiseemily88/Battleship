gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require 'simplecov'

SimpleCov.start


class ComputerTest < Minitest::Test

  def test_select_start_space_returns_value_in_array
    computer = Computer.new
    input = ["A1", "A2", "A3", "A4",
             "B1", "B2", "B3", "B4",
             "C1", "C2", "C3", "C4",
             "D1", "D2", "D3", "D4"]

    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert_includes (expected), computer.select_start_space(input)
  end

  def test_select_start_space_returns_value_only_in_array

    computer = Computer.new
    input =     ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    expected =  ["E1", "A6", "A5", "A7",
                "F1", "Y1", "K3", "B9",
                "G1", "C8", "C8", "C9",
                "H1", "J2", "K3", "L4"]

    refute_includes (expected), computer.select_start_space(input)
  end

  def test_select_end_space_returns_value_not_start_space
    computer = Computer.new
    input =       ["A1", "A2", "A3", "A4",
                  "B1", "B2", "B3", "B4",
                  "C1", "C2", "C3", "C4",
                  "D1", "D2", "D3", "D4"]

    expected =     ["A1", "A2", "A3", "A4",
                    "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]

    assert_includes (expected), computer.select_end_space(input, "B1")
  end

  def test_select_end_space_returns_value_not_start_space
    computer = Computer.new
    input =       ["A1", "A2", "A3", "A4",
                  "B1", "B2", "B3", "B4",
                  "C1", "C2", "C3", "C4",
                  "D1", "D2", "D3", "D4"]

    expected =     ["A1", "A2", "A3", "A4",
                    "B2", "B3", "B4",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D3", "D4"]

    assert_includes (expected), computer.select_end_space(input, "D3")
  end

  def test_same_row_returns_true_if_in_the_same_row
    computer = Computer.new
    assert_equal true, computer.same_row?("A1", "A2")
  end

  def test_same_row_returns_true_if_in_the_same_row
    computer = Computer.new
    assert_equal true, computer.same_row?("B3", "B2")
  end

  def test_same_column_returns_true_if_in_the_same_column
    computer = Computer.new
    assert_equal true, computer.same_column?("B3", "C3")
  end

  def test_adjacent_row_returns_true
    computer = Computer.new
    assert_equal true, computer.adjacent_row?("B3", "B2")
  end

  def test_adjacent_column_returns_true
    computer = Computer.new
    assert_equal true, computer.adjacent_column?("B3", "C3")
  end

  def test_evaluates_ship_placement_returns_false_if_diagonal
    computer = Computer.new
    assert_equal false, computer.evaluates_ship_placement("A1", "B2")
  end

  def test_evaluates_ship_placement_returns_false_if_not_adjacent
    computer = Computer.new
    assert_equal false, computer.evaluates_ship_placement("A1", "A4")
  end

  def test_evaluates_ship_placement_returns_false_if_wrap
    computer = Computer.new
    assert_equal false, computer.evaluates_ship_placement("D4", "A1")
  end

  def test_evaluates_ship_placement_returns_true_if_valid
    computer = Computer.new
    assert_equal true, computer.evaluates_ship_placement("C4", "D4")
  end

  def test_select_2_unit_ship
    skip
    computer = Computer.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert computer.select_2_unit_ship
  end

  def test_removes_coordinates_for_ship_2
    computer = Computer.new
    expected =     ["A1", "A2", "A3", "A4",
                    "B2", "B3", "B4", "B1",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D4", "D3"]

  refute_includes (expected), computer.remove_coordinates_for_ship_2("B1", "D3")
  end

  def test_unit3_row
    computer = Computer.new
    assert computer.unit3_row?("B3", "B1")
  end

  def test_unit3_column
    computer = Computer.new
    assert computer.unit3_column?("B1", "D1")
  end

  def test_evaulates_ship_placement_unit_3
    computer = Computer.new
    assert computer.evaluates_ship_placement_unit_3("B1", "D1")
  end


  def test_select_end_space_returns_accurate_value_for_middle_edge
    skip
    computer = Computer.new
    input = "D2"
    expected = ["D1", "D3", "C2"]

    assert_includes (expected), computer.select_end_space_2_unit(input)
  end

  def test_select_end_space_returns_accurate_value_for_middle
    skip
    computer = Computer.new
    input = "B3"
    expected = ["B2", "B4", "C3", "A3"]

    assert_includes (expected), computer.select_end_space_2_unit(input)
  end

  def test_select_end_space_returns_false_if_not_a_possible_value
    skip
    computer = Computer.new
    input = "B3"
    expected = ["B1", "C2", "A1", "B3"]

    refute_includes (expected), computer.select_end_space_2_unit(input)
  end

  def test_select_end_space_returns_accurate_value_for_3_unit
    skip
    computer = Computer.new
    input = "B1"
    expected = ["B3", "D1"]

    assert_includes (expected), computer.select_end_space_3_unit(input)
  end

  def test_select_end_space_returns_accurate_value_for_3_unit_middle
    skip
    computer = Computer.new
    input = "C3"
    expected = ["A3", "C1"]

    assert_includes (expected), computer.select_end_space_3_unit(input)
  end

  def test_place_ship_returns
    skip
    computer = Computer.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert_includes (expected), computer.place_2_unit_ship
  end

  def validate_ships_dont_overlap_returns__space_not_start_space
    skip
    computer = Computer.new

    assert_equal "" , computer.place_2_unit_ship
  end

end
