module Shiftable

  def message_offset(text, final_offset)
    message_array = text.downcase.split(//)
    message_offset = []
    symbols_to_find = [:A, :B, :C, :D]
    message_array.each_with_index do |char, index|
      key = symbols_to_find[index % 4]
      message_offset << final_offset[key]
    end
    message_array.zip(message_offset)
  end

  def shift_message(text, final_offset)
    alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
      "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    offset = message_offset(text, final_offset)
    new_message_array = []
    offset.each do |key, value|
      if alphabet.include?(key)
        full_shift = alphabet.index(key) + value
        new_letter = alphabet[full_shift % alphabet.length]
        new_message_array << new_letter
      else
        new_message_array << key
      end
    end
    new_message_array.join
  end

end
