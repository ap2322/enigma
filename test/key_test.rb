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
    assert_instance_of String, @key.random_number
    assert_equal 5, @key.random_number.length
    numbers = ("0".."9").to_a
    all_ints = @key.random_number.chars.all? {|char| numbers.include?(char)}
    assert_equal true, all_ints
  end

end
