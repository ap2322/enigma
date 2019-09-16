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
    today = Time.new.strftime("%m%d%y")

    assert_equal today, @enigma.date
    assert_equal 6, @enigma.date.length
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
    assert_instance_of String, @enigma.key
    assert_equal 5, @enigma.key.length

    @e2 = Enigma.new
    @e2.expects(:key).returns("23456")

    assert_equal "23456", @e2.key
  end

  def test_encrypt_today_generate_key
    @enigma.instance_variable_set(:@key, "23456")
    @enigma.instance_variable_set(:@date, "091619")

    expected = {encryption: "emiolhtrota!",
                key: "23456",
                date: "091619"}

    assert_equal expected, @enigma.encrypt("hello world!")
  end

  def test_decrypt_today_generate_key
    @enigma.instance_variable_set(:@key, "23456")
    @enigma.instance_variable_set(:@date, "091619")

    expected = {decryption: "hello world!",
                key: "23456",
                date: "091619"}

    assert_equal expected, @enigma.decrypt("emiolhtrota!")
  end
end
