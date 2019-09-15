class Encryption
  def initialize(message, key, date)
    @message_in = message
    @key = key
    @date = date
  end

  def keys_letters(key)
    num_array = key.chars
    keys_hash = {A: nil, B: nil, C: nil, D:nil}
    keys_hash.each_with_index do |(key, value), index|
      if index < keys_hash.length
        value = num_array[index] + num_array[index + 1]
        keys_hash[key] = value.to_i
      end
    end
  end

  def offset(date)
    last_4_of_square = (date.to_i**2).digits.reverse[-4..-1]
    key_date = {A:nil, B:nil, C: nil, D: nil}
    key_date.each_with_index do |(key, value), index|
      key_date[key] = last_4_of_square[index]
    end
    key_date
  end
end
