require_relative "lib/connect_tac_toe"



board = Board.new(7, 5)

board.add(:b, 0)
board.add(:b, 0)

board.add(:y, 1)
board.add(:b, 1)
board.add(:y, 1)
board.add(:y, 1)
board.add(:y, 1)
board.add(:y, 1)


board.add(:y, 2)
board.add(:b, 2)
board.add(:y, 2)

board.add(:b, 3)
board.add(:b, 3)

board.add(:b, 4)
board.add(:b, 4)

board.add(:b, 5)
board.add(:b, 5)
board.add(:b, 5)


board.add(:b, 6)
board.add(:b, 6)

p board.horizontal_winner?(:b)

puts "win?"
p board.horizontal_winner?(:O)

board.print
p board.vertical_winner?(:b)
