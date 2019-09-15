# require_relative './encrypt'

class Enigma
  def initialize
  end

  def encrypt(message, key, date)
    encrypted_hash = {
      # encryption: Encrypt.new(message),
      key: key,
      date: date,
    }
    encrypted_hash
  end
end
