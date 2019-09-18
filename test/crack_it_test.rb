require './test_helper'
require 'date'
require_relative '../lib/crack_it'
# require 'pry'

class CrackItTest < Minitest::Test

  def setup
    @crack_me = CrackIt.new("vjqtbeaweqihssi", "291018")
    @crack_me_known_key = CrackIt.new("yzetkcbe,zfxkssf d!symrsedex'rnelqssysnlednxkc",
      "170919")
  end

  def test_it_exists
    assert_instance_of CrackIt, @crack_me
  end

  def test_attributes_at_init
    assert_equal "vjqtbeaweqihssi", @crack_me.message_in
    assert_equal "291018", @crack_me.date
    actual_off = @crack_me.instance_variable_get(:@offset)
    expected_offset = {:A=>6, :B=>3, :C=>2, :D=>4}
    assert_equal expected_offset, actual_off
    expected_letter_array = ["v", "j", "q", "t", "b",
                             "e", "a", "w", "e", "q",
                             "i", "h", "s", "s", "i"]
    actual_char_arr = @crack_me.instance_variable_get(:@message_in_char_array)
    assert_equal expected_letter_array, actual_char_arr
  end

  def test_last_4_match
    last_4 = [["h", " "], ["s", "e"], ["s", "n"], ["i", "d"]]
    assert_equal last_4, @crack_me.last_4_match
  end

  def test_find_shift
    expected = [-8, -14, -5, -5]
    assert_equal expected, @crack_me.find_shift
  end

  def test_normalize
    assert_equal -8, @crack_me.normalize(19)
    assert_equal -7, @crack_me.normalize(20)
  end

  def test_match_shift_values_to_full_message
    expected = [
      ["v", -14],
      ["j", -5],
      ["q", -5],
      ["t", -8],
      ["b", -14],
      ["e", -5],
      ["a", -5],
      ["w", -8],
      ["e", -14],
      ["q", -5],
      ["i", -5],
      ["h", -8],
      ["s", -14],
      ["s", -5],
      ["i", -5]
    ]
    assert_equal expected, @crack_me.full_message_shifts
  end

  def test_match_ABCD_values
    expected = {A: -14, B: -5, C: -5, D: -8}

    assert_equal expected, @crack_me.match_ABCD_values
  end

  def test_get_subkey
    expected = {:A=>8, :B=>2, :C=>3, :D=>4}
    expected2 = {:A=>20, :B=>21, :C=>8, :D=>18}

    assert_equal expected, @crack_me.get_subkey
    assert_equal expected2, @crack_me_known_key.get_subkey
  end

  def test_multiples_of_27
    expected = {
        :A=>["08", "35", "62", "89"],
        :B=>["02", "29", "56", "83"],
        :C=>["03", "30", "57", "84"],
        :D=>["04", "31", "58", "85"]
      }
    expected2 = {
        :A=>["20", "47", "74"],
        :B=>["21", "48", "75"],
        :C=>["08", "35", "62", "89"],
        :D=>["18", "45", "72", "99"]
      }

    assert_equal expected, @crack_me.key_possibilities
    assert_equal expected2, @crack_me_known_key.key_possibilities
  end

  def test_match_keys
    possible_key2 = {
        :A=>["20", "47", "74"],
        :B=>["21", "48", "75"],
        :C=>["08", "35", "62", "89"],
        :D=>["18", "45", "72", "99"]
      }

    assert_equal ["74", "48", "89", "99"], @crack_me_known_key.match_keys
  end

  def test_match_characters
    assert_equal true, @crack_me_known_key.match_characters?("74", "48")
    assert_equal false, @crack_me_known_key.match_characters?("74", "58")
  end

  def test_match_A_B
    assert_equal [["47", "75"], ["74", "48"]], @crack_me_known_key.match_A_B
  end

  def test_match_B_C
    assert_equal [["48", "89"]], @crack_me_known_key.match_B_C
  end

  def test_match_C_D
    assert_equal [["89", "99"]], @crack_me_known_key.match_C_D
  end

  def test_make_keys
    assert_equal "74899", @crack_me_known_key.make_keys
    c = CrackIt.new("womnwomnjon'qjybycbwqjzab", "170919")

    assert_instance_of String, c.key
  end

  def test_key_attribute
    assert_equal "74899", @crack_me_known_key.key
  end

end
