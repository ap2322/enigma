require './test_helper'
require 'date'
require_relative '../lib/key'
require 'pry'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_random_number
    # How to mock/stub this?
    assert_equal "00000", @key.random_number
  end

end
