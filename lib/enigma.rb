require_relative './encryption'

class Enigma
  def initialize
  end

  def encrypt(message, key, date)
    encryption = Encryption.new(message, key, date)
    encrypted_message = encryption.shift_message(encryption.message_in, encryption.final_offset)

    encrypted_hash = {
      encryption: encrypted_message,
      key: key,
      date: date,
    }
    encrypted_hash
  end
end
