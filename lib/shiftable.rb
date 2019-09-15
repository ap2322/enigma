module Shiftable

  def message_offset(text, final_offset)
    message_array = text.downcase.split(//)
    offset_values = final_offset.values
    message_offset = []
    message_array.each_with_index do |char, index|
      message_offset << offset_values[index % 4]
    end
    message_array.zip(message_offset).to_h
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
      binding.pry
    end
    new_message_array.join
  end

end
