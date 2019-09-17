require_relative '../lib/shiftable'

class CrackIt
  include Shiftable

  attr_reader :date, :message_in

  def initialize(message, date)
    @message_in = message
    @date = date
  end

  def last_4_match
    sign_off = " end".chars
    @message_in_char_array = message_in.chars
    last_4 = @message_in_char_array[-4..-1]
    last_4.zip(sign_off)
  end

  def find_shift
    last_4 = last_4_match
    alphabet = ("a".."z").to_a << " "
    last_4.map do |c1, c2|
      normalize(alphabet.index(c2) - alphabet.index(c1))
    end
  end

  def normalize(difference)
    return difference unless difference > 0
    difference - 27
  end

  # def final_offset
  #   @final_offset = keys_letters(key).merge(offset(date)) do |key, oldv, newv|
  #     oldv + newv
  #   end
  # end
end