require './test_helper'
require 'date'
require_relative '../lib/date'
require 'pry'

class DateTest < Minitest::Test
  def setup
    @date = Date.new
  end

  def test_it_exists
    assert_instance_of Date, @date
  end

  def test_today
    # How to mock/stub this?
    # time = mock("Time")
    # output = time.expects(:strftime).returns("091619")

    assert_equal "091619", @date.date
  end

end
