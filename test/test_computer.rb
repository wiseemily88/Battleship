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

  def test_select_end_space_returns_value_that_is_not_start_space
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


  def test_select_2_unit_ship
    computer = Computer.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert "I made it", computer.select_2_unit_ship
  end

  def test_select_3_unit_ship
    computer = Computer.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert "I made it", computer.select_3_unit_ship
  end

  def test_removes_coordinates_for_ship_2
    computer = Computer.new
    expected =     ["A1", "A2", "A3", "A4",
                    "B2", "B3", "B4", "B1",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D4", "D3"]

  refute_includes (expected), computer.remove_coordinates_for_ship_2("B1", "D3")
  end

  def test_select_end_space_returns_accurate_value_for_middle_edge

    computer = Computer.new
    input = "D2"
    expected = ["D1", "D3", "C2"]

    assert_includes (expected), computer.select_end_space_2_unit(input)
  end

  def remove_coordinates_for_ship_2(start_space, end_space)
    board = Gameboard.new
    create_space_names = board.create_space_names("Beginner")
    create_space_names.delete_if{|coordinate| coordinate == start_space ||
    coordinate == end_space}
  end
end
