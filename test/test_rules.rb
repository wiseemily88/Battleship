gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rules'
require 'simplecov'

SimpleCov.start


class RulesTest < Minitest::Test

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

    computer = Computer.new
    input = "D2"
    expected = ["D1", "D3", "C2"]

    assert_includes (expected), computer.select_end_space_2_unit(input)
  end

  def validate_ships_dont_overlap_returns__space_not_start_space
    computer = Computer.new

    assert_equal "" , computer.place_2_unit_ship
  end
end
