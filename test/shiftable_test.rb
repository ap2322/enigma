require './test_helper'
require 'date'
require_relative '../lib/enigma'
require_relative '../lib/encryption'
require_relative '../lib/shiftable'
require 'pry'

class ShiftableTest < Minitest::Test
  def setup
    @encryption = Encryption.new("Hello World!", "23456", "091519")
    @encryption.final_offset
  end

  def test_message_offset
    text = @encryption.message_in
    offset_hash = @encryption.final_offset #{A:30, B:37, C:51, D: 57}
    expected = [
       ["h", 30],
       ["e", 37],
       ["l", 51],
       ["l", 57],
       ["o", 30],
       [" ", 37],
       ["w", 51],
       ["o", 57],
       ["r", 30],
       ["l", 37],
       ["d", 51],
       ["!", 57]]

    assert_equal expected, @encryption.message_offset(text, offset_hash)
  end

  def test_shift_message
    text = @encryption.message_in
    offset_hash = @encryption.final_offset

    @encrypt2 = Encryption.new('poop', '23456', '091519')

    assert_equal "koiorjtruva!", @encryption.shift_message(text, offset_hash)
    assert_equal "syls", @encrypt2.shift_message(@encrypt2.message_in, @encrypt2.final_offset)
  end

end
