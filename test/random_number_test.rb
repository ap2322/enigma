require './test_helper'
require 'date'
require_relative '../lib/random_number'
require 'pry'

class RandomNumberTest < Minitest::Test
  def setup
    @rand_num = RandomNumber.new
  end

  def test_it_exists
    assert_instance_of RandomNumber, @rand_num
  end

  def test_attributes_at_init
      binding.pry
  end
end
