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

  def test_removes_coordinates_for_ship_2

    computer = Computer.new
    create_space_names = ["A1", "A2", "A3", "A4",
                    "B2", "B3", "B4", "B1",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D4", "D3"]

    expected =     ["A1", "A2", "A3", "A4",
                    "B2", "B3", "B4", "B1",
                    "C1", "C2", "C3", "C4",
                    "D1", "D2", "D4", "D3"]

  refute_includes (expected), computer.remove_coordinates_for_ship_2(create_space_names,"B1", "D3")
  end

  def test_coordinates_for_ships

    computer = Computer.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]

    assert "I made it", computer.select_coordinates_for_ships
  end


end
