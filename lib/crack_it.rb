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
      key_possibles[k] = [v.to_s.rjust(2, '00')] if key_possibles[k].empty?
      while (v + 27) < 100
        key_possibles[k] << (v + 27).to_s.rjust(2, '00')
        v += 27
      end
    end
    key_possibles
  end

  def match_keys
    ab = match_A_B; bc = match_B_C; c_d = match_C_D
    final_matches = ab.find { |pair| bc.flatten.include?(pair[1])}
    bc_sub = bc.find { |pair| c_d.flatten.include?(pair[1])}
    cd_sub = c_d.find { |pair| bc.flatten.include?(pair[0])}
    final_matches += [bc_sub[1], cd_sub[1]]
  end



  def match_A_B
    matches = []
    key_possibles = key_possibilities
    a_2nd_chars = key_possibles[:A].map {|num| num[1]}
    b_1st_chars = key_possibles[:B].map {|num| num[0]}

    a_2nd_chars.each do |num|
      if b_1st_chars.include?(num)
        b_index = b_1st_chars.index(num)
        a_index = a_2nd_chars.index(num)
        matches << [key_possibles[:A][a_index], key_possibles[:B][b_index]]
      end
    end
    matches
  end

  def match_B_C
    matches = []
    key_possibles = key_possibilities
    a_2nd_chars = key_possibles[:B].map {|num| num[1]}
    b_1st_chars = key_possibles[:C].map {|num| num[0]}

    a_2nd_chars.each do |num|
      if b_1st_chars.include?(num)
        b_index = b_1st_chars.index(num)
        a_index = a_2nd_chars.index(num)
        matches << [key_possibles[:B][a_index], key_possibles[:C][b_index]]
      end
    end
    matches
  end

  def match_C_D
    matches = []
    key_possibles = key_possibilities
    a_2nd_chars = key_possibles[:C].map {|num| num[1]}
    b_1st_chars = key_possibles[:D].map {|num| num[0]}

    a_2nd_chars.each do |num|
      if b_1st_chars.include?(num)
        b_index = b_1st_chars.index(num)
        a_index = a_2nd_chars.index(num)
        matches << [key_possibles[:C][a_index], key_possibles[:D][b_index]]
      end
    end
    matches
  end

  def match_characters?(elem1, elem2)
    return false if elem1[1] != elem2[0]
    true
  end

  def make_keys
    keys_array = match_keys
    key_string = ''
    keys_array.each do |key|
      key_string = key[0] if key_string.length == 0
      key_string += key[1]
    end
    key_string
  end

end
