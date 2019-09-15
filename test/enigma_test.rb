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

  def test_encrypt
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_today
    today = "091519"
    assert_equal today, @enigma.today
  end
end
