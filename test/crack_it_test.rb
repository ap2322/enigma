require './test_helper'
require 'date'
require_relative '../lib/crack_it'
require 'pry'

class CrackItTest < Minitest::Test

  def setup
    @crack_me = CrackIt.new("vjqtbeaweqihssi", "291018")
  end

  def test_it_exists
    assert_instance_of CrackIt, @crack_me
  end

  def test_attributes_at_init
    assert_equal "vjqtbeaweqihssi", @crack_me.message_in
    assert_equal "291018", @crack_me.date
  end


  def test_last_4_match
    last_4 = [["h", " "], ["s", "e"], ["s", "n"], ["i", "d"]]
    assert_equal last_4, @crack_me.last_4_match
  end

  def test_find_shift
    expected = [0, 0, 0, 0]
    assert_equal expected, @crack_me.find_shift
  end
end
