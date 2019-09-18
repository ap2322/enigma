require_relative './enigma'
require 'pry'

handle = File.open(ARGV[0], "r")
message_to_crack = handle.read.chomp
handle.close

decrypted_hash = Enigma.new.crack(message_to_crack, ARGV[2])

writer = File.open(ARGV[1], "w")
writer.write(decrypted_hash[:decryption])
writer.close

message = "Created #{ARGV[1]} with the key #{decrypted_hash[:key]} \
and date #{decrypted_hash[:date]}"

puts message


# $ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
# Created 'cracked.txt' with the cracked key 82648 and date 240818
