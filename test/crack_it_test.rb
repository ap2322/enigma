require './test_helper'
require 'date'
require_relative '../lib/crack_it'
# require 'pry'

class CrackItTest < Minitest::Test

  def setup
    @crack_me = CrackIt.new("vjqtbeaweqihssi", "291018")
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
end
