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

  def test_date
    today = "091619"
    assert_equal today, @enigma.date
  end

  def test_encrypt_today
    date = mock
    date.expects(:date).returns("091519")
    
    expected = {encryption: "koiorjtruva!",
                key: "23456",
                date: "091519"}

    assert_equal expected, @enigma.encrypt("hello world!", "23456")
  end
end
