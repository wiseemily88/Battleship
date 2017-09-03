gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard'


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

    assert_instance_of Space, @new_gameboard.create_spaces(input)["A1"]
  end




end
