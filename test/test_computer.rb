gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Computer'
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

  def test_select_end_space_returns_accurate_value_for_end
    computer = Computer.new
    input = "B1"
    expected = ["B2", "A1", "C1"]

    assert_includes (expected), computer.select_end_space_2_unit(input)
  end

  def test_select_end_space_returns_accurate_value_for_middle_edge
    computer = Computer.new
    input = "D2"
    expected = ["D1", "D3", "C2"]

    assert_includes (expected), computer.select_end_space_2_unit(input)
  end

  def test_select_end_space_returns_accurate_value_for_middle
    computer = Computer.new
    input = "B3"
    expected = ["B2", "B4", "C3", "A3"]

    assert_includes (expected), computer.select_end_space_2_unit(input)
  end

  def test_select_end_space_returns_false_if_not_a_possible_value
    computer = Computer.new
    input = "B3"
    expected = ["B1", "C2", "A1", "B3"]

    refute_includes (expected), computer.select_end_space_2_unit(input)
  end

  def test_select_end_space_returns_accurate_value_for_3_unit

    computer = Computer.new
    input = "B1"
    expected = ["B3", "D1"]

    assert_includes (expected), computer.select_end_space_3_unit(input)
  end

  def test_select_end_space_returns_accurate_value_for_3_unit_middle
    computer = Computer.new
    input = "C3"
    expected = ["A3", "C1"]

    assert_includes (expected), computer.select_end_space_3_unit(input)
  end

  def test_place_ship_returns
    computer = Computer.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert_includes (expected), computer.place_2_unit_ship
  end

end
