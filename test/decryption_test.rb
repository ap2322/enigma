require './test_helper'
require 'date'
require_relative '../lib/enigma'
require_relative '../lib/decryption'
require 'pry'

class DecryptionTest < Minitest::Test
  def setup
    @decryption = Decryption.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_attributes_at_init
    assert_equal "keder ohulw", @decryption.message_in
    assert_equal "02715", @decryption.key
    assert_equal "040895", @decryption.date
  end

  def test_final_offset
    expected = {A: -3, B: -27, C: -73, D: -20}

    assert_equal expected, @decryption.final_offset
  end

end
