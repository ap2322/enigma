require_relative './encryption'
require_relative './key_date'

class Enigma
  def initialize
    @date = date
  end

  def encrypt(message, key, date = self.date)
    encryption = Encryption.new(message, key, date)
    encrypted_message = encryption.shift_message(encryption.message_in, encryption.final_offset)

    encrypted_hash = {
      encryption: encrypted_message,
      key: key,
      date: date,
    }
    encrypted_hash
  end

  def date
    KeyDate.new.date
  end
end
