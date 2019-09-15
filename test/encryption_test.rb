require './test_helper'
require 'date'
require_relative '../lib/enigma'
require_relative '../lib/encryption'
require 'pry'

class EncrypionTest < Minitest::Test
  def setup
    @encryption = Encryption.new("Hello World", "23456", "091519")
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_keys_letters
    num_key = "23456"
    expected = {A: 23, B: 34, C:45, D: 56}
    assert_equal expected, @encryption.keys_letters(num_key)
  end

  def test_offset
    date = "091519"
    expected = {A:7, B:3, C:6, D:1}

    assert_equal expected, @encryption.offset(date)
  end

  def test_final_offset
    num_key = "23456"
    date = "091519"
    expected = {A:30, B:37, C:51, D: 57}

    assert_equal expected, @encryption.final_offset
  end
end
