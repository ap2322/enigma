require './test_helper'
require 'date'
require_relative '../lib/enigma'
require_relative '../lib/encryption'
require_relative '../lib/decryption'
require_relative '../lib/shiftable'
require 'pry'

class ShiftableTest < Minitest::Test
  def setup
    @encryption = Encryption.new("Hello World!", "23456", "091519")
    @encryption.final_offset
    @decryption = Decryption.new("keder ohulw", "02715", "040895")
    @decryption.final_offset
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

  def test_message_offset_decryption
    text = @decryption.message_in
    offset_hash = @decryption.final_offset #{:A=>3, :B=>27, :C=>73, :D=>20}

    expected = [
       ["k", -3],
       ["e", -27],
       ["d", -73],
       ["e", -20],
       ["r", -3],
       [" ", -27],
       ["o", -73],
       ["h", -20],
       ["u", -3],
       ["l", -27],
       ["w", -73]]

    assert_equal expected, @decryption.message_offset(text, offset_hash)
  end

  def test_shift_message_decryption
    text = @decryption.message_in
    offset_hash = @decryption.final_offset

    @decrypt2 = Decryption.new('syls', '23456', '091519')

    assert_equal "hello world", @decryption.shift_message(text, offset_hash)
    assert_equal "poop", @decrypt2.shift_message(@decrypt2.message_in, @decrypt2.final_offset)
  end


end
