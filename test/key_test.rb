require './test_helper'
require 'date'
require_relative '../lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def test_random_number
    assert_instance_of String, Key.random_number
    assert_equal 5, Key.random_number.length
    numbers = ("0".."9").to_a
    all_ints = Key.random_number.chars.all? {|char| numbers.include?(char)}
    assert_equal true, all_ints
  end

end
