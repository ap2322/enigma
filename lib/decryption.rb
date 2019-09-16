require_relative '../lib/shiftable'

class Decryption
  include Shiftable

  attr_reader :key, :date, :message_in

  def initialize(coded_message, key, date)
    @message_in = coded_message
    @key = key
    @date = date
  end

  def final_offset
    @final_offset = keys_letters(key).merge(offset(date)) do |key, oldv, newv|
      (oldv + newv)*-1
    end
  end
end
