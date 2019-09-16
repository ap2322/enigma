require_relative './enigma'

handle = File.open(ARGV[0], "r")
message_to_encrypt = handle.read
handle.close

encrypted_hash = Enigma.new.encrypt(message_to_encrypt)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_hash[:encryption])
writer.close

message = "Created #{ARGV[1]} with the key #{encrypted_hash[:key]} \
and date #{encrypted_hash[:date]}"

puts message
