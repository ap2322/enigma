require './test_helper'
require 'date'
require_relative '../lib/date'
require 'pry'

class DateTest < Minitest::Test
  def setup
    @date = Date.new
  end

  def test_today
    today = Time.new.strftime("%d%m%y")

    assert_equal today, Date.date
  end

end
