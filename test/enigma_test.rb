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
    expected2 = {:decryption=>"a random, sentence! and here's more at the end",
                 :key=>"74899",
                 :date=>"170919"}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal expected2, @enigma.decrypt("yzetkcbe,zfxkssf d!symrsedex'rnelqssysnlednxkc", "74899", "170919")
  end

  def test_encrypt_today
    today = Time.new.strftime("%d%m%y")

    expected = {encryption: "hqiooltrrxa!",
                key: "23456",
                date: today }

    assert_equal expected, @enigma.encrypt("hello world!", "23456")
  end

  def test_decrypt_today
    today = Time.new.strftime("%d%m%y")

    expected = {decryption: "hello world!",
                key: "23456",
                date: today}
    assert_equal expected, @enigma.decrypt("hqiooltrrxa!", "23456")
  end

  def test_encrypt_today_generate_key
    @enigma.instance_variable_set(:@key, "23456")
    @enigma.instance_variable_set(:@date, "160919")

    expected = {encryption: "hqiooltrrxa!",
                key: "23456",
                date: "160919"}

    assert_equal expected, @enigma.encrypt("hello world!")
  end

  def test_decrypt_today_generate_key
    @enigma.instance_variable_set(:@key, "23456")
    @enigma.instance_variable_set(:@date, "160919")

    expected = {decryption: "hello world!",
                key: "23456",
                date: "160919"}

    assert_equal expected, @enigma.decrypt("hqiooltrrxa!")
  end

  def test_crack
    expected = {
                decryption: "hello world end",
                date: "291018",
                key: "08304"
                }

    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end
end
