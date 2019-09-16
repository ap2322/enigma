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

end
