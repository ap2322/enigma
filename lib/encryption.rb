require_relative '../lib/shiftable'

class Encryption
  include Shiftable

  attr_reader :key, :date, :message_in

  def initialize(message, key, date)
    @message_in = message
    @key = key
    @date = date
  end

  def final_offset
    @final_offset = keys_letters(key).merge(offset(date)) do |key, oldv, newv|
      oldv + newv
    end
  end
end
