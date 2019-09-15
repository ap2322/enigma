require './test_helper'
require 'date'
require_relative '../lib/key_date'
require 'pry'

class KeyDateTest < Minitest::Test
  def setup
    @key_date = KeyDate.new
  end

  def test_it_exists
    assert_instance_of KeyDate, @key_date
  end

  def test_random_number
    # How to mock/stub this?
    assert_equal "00000", @key_date.random_number
  end

  def test_today
    # How to mock/stub this?
    binding.pry
    time = mock("Time")
    output = time.expects(:strftime).returns("091519")

    assert_equal output, @key_date.date
  end

end
