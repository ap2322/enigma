require_relative './enigma'

handle = File.open(ARGV[0], "r")
message_to_decrypt = handle.read
handle.close

decrypted_hash = Enigma.new.decrypt(message_to_decrypt, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted_hash[:decryption])
writer.close

message = "Created #{ARGV[1]} with the key #{decrypted_hash[:key]} \
and date #{decrypted_hash[:date]}"

puts message
