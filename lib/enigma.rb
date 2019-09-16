require_relative './encryption'
require_relative './decryption'
require_relative './key'
require_relative './date'

class Enigma
  def initialize
    @date = date
  end

  def encrypt(message, key, date = @date)
    encryption = Encryption.new(message, key, date)
    encrypted_message = encryption.shift_message(
                        encryption.message_in, encryption.final_offset)
    { encryption: encrypted_message, key: key, date: date, }
  end

  def decrypt(message, key, date = @date)
    decryption = Decryption.new(message, key, date)
    decrypted_message = decryption.shift_message(
      decryption.message_in, decryption.final_offset)
    { encryption: decrypted_message, key: key, date: date, }
  end

  def date
    Date.new.date
  end
end
