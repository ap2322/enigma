require_relative '../lib/shiftable'

class CrackIt
  include Shiftable

  attr_reader :date, :message_in

  def initialize(message, date)
    @message_in = message
    @date = date
    @message_in_char_array = message_in.chars
    @offset = offset(date)
  end

  def last_4_match
    sign_off = " end".chars
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

  def full_message_shifts
    rev_m = @message_in_char_array.reverse
    rev_shifts = find_shift.reverse
    letter_shifts = []
    rev_m.each_with_index do |char, index|
      letter_shifts << [char, rev_shifts[index % 4]]
    end
    letter_shifts.reverse!
  end

  def match_ABCD_values
    first_4 = full_message_shifts[0..3]
    abcd = {A: nil, B: nil, C: nil, D:nil}
    abcd.each_with_index do |(k, v), i|
      abcd[k] = first_4[i][1]
    end
    abcd
  end

  def get_subkey
    shift = match_ABCD_values
    subkey = shift.merge(@offset) do |key, oldv, newv|
      (oldv * -1 - newv) # check here if decryption isn't working
    end
  end

  def key_possibilities
    subkey = get_subkey
    key_possibles = Hash.new([])
    subkey.each do |k, v|
      key_possibles[k] = [v] if key_possibles[k].empty?
      while (v + 27) < 100
        key_possibles[k] << v + 27
        v += 27
      end
    end
    key_possibles
  end

  # def final_offset
  #   @final_offset = keys_letters(key).merge(offset(date)) do |key, oldv, newv|
  #     oldv + newv
  #   end
  # end
end
