require './test_helper'
require 'date'
require_relative '../lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_attributes_at_init
    encryption = mock("hello world")
    encryption.expects(:encrypted_text).returns("keder ohulw")
    # binding.pry
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}

    assert_equal expected, @enigma.encrypt(message, "02715", "040895")
  end
end
