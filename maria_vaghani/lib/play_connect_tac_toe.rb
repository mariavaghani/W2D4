# execute this file to play your game once all specs are completed
# no code needs to be written in this file

require_relative "connect_tac_toe"

puts "++++++++++++ Welcome to Connect Tac TOe +++++++++++++++"
puts "How many stacks would you like to play?"
num_of_stacks = gets.chomp.to_i
puts "What the maximum stack should be?"
max_height = gets.chomp.to_i

puts "Awesome, let's play!"

ConnectTacToe.new(num_of_stacks, max_height).play
