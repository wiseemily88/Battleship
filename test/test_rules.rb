gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rules'
require 'simplecov'
require './lib/computer'

SimpleCov.start


class RulesTest < Minitest::Test

  def test_same_row_returns_true_if_in_the_same_row
    computer = Computer.new

    assert_equal true, computer.same_row?("A1", "A2")
  end

  def test_another_row_returns_true
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

  def test_evaluates_ship_placement_returns_false_if_wrapped
    computer = Computer.new

    assert_equal false, computer.evaluates_ship_placement("D4", "A1")
  end

  def test_evaluates_ship_placement_returns_true_if_valid_combination
    computer = Computer.new

    assert_equal true, computer.evaluates_ship_placement("C4", "D4")
  end

  def test_unit3_row_returns_true_if_on_the_same_row
    computer = Computer.new

    assert computer.unit3_row?("B3", "B1")
  end

  def test_unit3_column_returns_true_if_on_the_same_column
    computer = Computer.new

    assert computer.unit3_column?("B1", "D1")
  end

  def test_evaulates_ship_placement_unit_3_returns_true_if_valid
    computer = Computer.new

    assert computer.evaluates_ship_placement_unit_3("B1", "D1")
  end

  def test_evaulates_ship_placement_and_overlap_is_valie
    computer = Computer.new

    assert computer.evaluate_ship_placement_and_overlap("B1", "D1", "C1")
  end

  def test_that_middle_space_returns_the_middle_value
    computer = Computer.new

    assert_equal "A2", computer.middle_space("A1","A3")
  end

  def test_again_that_middle_space_returns_the_middle_value
    computer = Computer.new

    assert_equal "B1", computer.middle_space("A1","C1")
  end


  def test_validate_ships_dont_overlap_returns_assigns_end_space_if_valid
    computer = Computer.new

    start_space = "D2"
    middle_space = "D3"
    end_space = "D2"

    refute computer.validate_ships_dont_overlap(start_space, end_space, middle_space)
  end

  def test_validate_ships_dont_overlap_refutes_if_space_is_invalid
    computer = Computer.new

    start_space = "A1"
    middle_space = "B1"
    end_space = "C4"

    assert computer.validate_ships_dont_overlap(start_space, end_space, middle_space)
  end

  def test_confirm_ship_placement_for_2_unit_returns_valid_end_space
    skip
    computer = Computer.new
    start_space = "A1"
    end_space = "B1"
    create_space_names =
    ["A1", "A2", "A3", "A4",
    "B2", "B3", "B4", "B1",
    "C1", "C2", "C3", "C4",
    "D1", "D2", "D4", "D3"]

    assert_equal "B1", computer.confirm_ship_placement_for_2_unit(create_space_names, start_space, end_space)
  end

end
