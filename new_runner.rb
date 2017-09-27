require_relative 'new_sudoku'
require_relative 'screen_setup'

board_string = File.readlines('sudoku_puzzles.txt').first.chomp
# hash_borad = get_solution_hash(board_string)
#
reset_screen
#
pretty_board(board_string)
sleep(1)
#
solved_board = solve(hash_borad)


if solved?(solved_board)
  puts "The board was solved!"
  # puts pretty_board(solved_board)
else
  puts "The board wasn't solved :("
end
