require_relative './encryption'

class Enigma
  def initialize
  end

  def encrypt(message, key, date)
    encryption = Encryption.new(message, key, date)

    encrypted_hash = {
      encryption: encryption.encrypted_text,
      key: key,
      date: date,
    }
    encrypted_hash
  end
end
