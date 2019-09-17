require './test_helper'
require 'date'
require_relative '../lib/enigma'
require_relative '../lib/encryption'
require_relative '../lib/decryption'
require_relative '../lib/shiftable'
require 'pry'

class ShiftableTest < Minitest::Test
  def setup
    @encryption = Encryption.new("Hello World!", "23456", "150919")
    @encryption.final_offset
    @decryption = Decryption.new("keder ohulw", "02715", "040895")
    @decryption.final_offset
  end

  def test_keys_letters_encryption
    num_key = "23456"
    expected = {A: 23, B: 34, C:45, D: 56}
    assert_equal expected, @encryption.keys_letters(num_key)
  end

  def test_offset_encryption
    date = "150919"
    expected = {:A=>4, :B=>5, :C=>6, :D=>1}

    assert_equal expected, @encryption.offset(date)
  end

  def test_keys_letters_decryption
    expected = {A: 02 , B: 27 , C: 71 , D: 15 }
    assert_equal expected, @decryption.keys_letters("02715")
  end

  def test_offset_decryption
    expected = {A: 1, B: 0, C: 2, D: 5}
    assert_equal expected, @decryption.offset("040895")
  end

  def test_message_offset
    text = @encryption.message_in
    offset_hash = @encryption.final_offset #{A:30, B:37, C:51, D: 57}
    expected = [
       ["h", 27],
       ["e", 39],
       ["l", 51],
       ["l", 57],
       ["o", 27],
       [" ", 39],
       ["w", 51],
       ["o", 57],
       ["r", 27],
       ["l", 39],
       ["d", 51],
       ["!", 57]]

    assert_equal expected, @encryption.message_offset(text, offset_hash)
  end

  def test_shift_message
    text = @encryption.message_in
    offset_hash = @encryption.final_offset

    @encrypt2 = Encryption.new('poop', '23456', '150919')

    assert_equal "hqiooltrrxa!", @encryption.shift_message(text, offset_hash)
    assert_equal "p ls", @encrypt2.shift_message(@encrypt2.message_in, @encrypt2.final_offset)
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

    @decrypt2 = Decryption.new('p ls', '23456', '150919')

    assert_equal "hello world", @decryption.shift_message(text, offset_hash)
    assert_equal "poop", @decrypt2.shift_message(@decrypt2.message_in, @decrypt2.final_offset)
  end
end
