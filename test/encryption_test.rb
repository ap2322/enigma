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

  def test_attributes_at_init
    assert_equal "Hello World", @encryption.message_in
    assert_equal "23456", @encryption.key
    assert_equal "091519", @encryption.date
  end

  def test_final_offset
    num_key = "23456"
    date = "091519"
    expected = {A:30, B:37, C:51, D: 57}

    assert_equal expected, @encryption.final_offset
  end
end
