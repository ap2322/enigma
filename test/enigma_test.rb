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

  def test_decrypt
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_date
    today = "091619"
    assert_equal today, @enigma.date
  end

  def test_encrypt_today
    # date = mock
    # date.expects(:date).returns("091519")
    #
    expected = {encryption: "emiolhtrota!",
                key: "23456",
                date: "091619"}

    assert_equal expected, @enigma.encrypt("hello world!", "23456")
  end

  def test_decrypt_today
    # stub date
    expected = {decryption: "hello world!",
                key: "23456",
                date: "091619"}
    assert_equal expected, @enigma.decrypt("emiolhtrota!", "23456")
  end

  def test_key
    key = "00000"
    assert_equal key, @enigma.key
  end

  def test_encrypt_today_generate_key

    expected = {encryption: "emiolhtrota!",
                key: "23456",
                date: "091619"}

    assert_equal expected, @enigma.encrypt("hello world!")
  end

  def test_decrypt_today_generate_key

    expected = {decryption: "hello world!",
                key: "23456",
                date: "091619"}

    assert_equal expected, @enigma.decrypt("emiolhtrota!")
  end
end
