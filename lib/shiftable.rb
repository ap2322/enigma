module Shiftable

  def keys_letters(key)
    num_array = key.chars
    keys_hash = {A: nil, B: nil, C: nil, D:nil}
    keys_hash.each_with_index do |(key, value), index|
      if index < keys_hash.length
        keys_hash[key] = (num_array[index] + num_array[index + 1]).to_i
      end
    end
    keys_hash
  end

  def offset(date)
    last_4_of_square = (date.to_i**2).digits.reverse[-4..-1]
    key_date = {A:nil, B:nil, C: nil, D: nil}
    key_date.each_with_index do |(key, value), index|
      key_date[key] = last_4_of_square[index]
    end
    key_date
  end

  def message_offset(text, final_offset)
    message_array = text.downcase.split(//)
    message_offset = []
    symbols_to_find = [:A, :B, :C, :D]
    message_array.each_with_index do |char, index|
      message_offset << final_offset[symbols_to_find[index % 4]]
    end
    message_array.zip(message_offset)
  end

  def shift_message(text, final_offset)
    alphabet = ("a".."z").to_a << " "
    message_offset(text, final_offset).map do |key, value|
      if alphabet.include?(key)
        full_shift = alphabet.index(key) + value
        alphabet[full_shift % alphabet.length]
      else
        key
      end
    end.join
  end

end
