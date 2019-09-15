require './test_helper'
require 'date'
require_relative '../lib/enigma'
require_relative '../lib/encryption'

class EncrypionTest < Minitest::Test
  def setup
    @encryption = Encryption.new("Hello World", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_attributes_at_init
  end
end
