require_relative './encryption'
require_relative './decryption'
require_relative './key'
require_relative './date'
require_relative './crack_it'

class Enigma
  def initialize
    @date = Date.date
    @key = Key.random_number
  end

  def encrypt(message, key = @key, date = @date)
    encryption = Encryption.new(message, key, date)
    encrypted_message = encryption.shift_message(
                        encryption.message_in, encryption.final_offset)
    { encryption: encrypted_message, key: key, date: date, }
  end

  def decrypt(message, key = @key, date = @date)
    decryption = Decryption.new(message, key, date)
    decrypted_message = decryption.shift_message(
                        decryption.message_in, decryption.final_offset)
    { decryption: decrypted_message, key: key, date: date, }
  end

  def crack(encrypted_text, date = @date)
    key = CrackIt.new(encrypted_text, date).key
    decrypt(encrypted_text, key, date)
  end

end
