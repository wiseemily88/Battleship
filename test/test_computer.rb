gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Computer'
require 'simplecov'

SimpleCov.start


class ComputerTest < Minitest::Test

  def test_select_start_space_returns_value_in_array
    computer = Computer.new
    input = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    refute_equal "E1", computer.select_start_space(input)
  end

  def test_select_start_space_returns_value_in_array
    skip
    computer = Computer.new
    input = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    assert_equal "B2", computer.select_start_space(input)
  end

  def test_select_end_space_returns_accurate_value
    computer = Computer.new
    input = "B1"

    refute_equal "B1", computer.select_end_space(input)
  end

end
