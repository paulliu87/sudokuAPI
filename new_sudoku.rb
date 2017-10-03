# load "./new_sudoku.rb"
#  0  1  2  3  4  5  6  7  8
#  9 10 11 12 13 14 15 16 17
# 18 19 20 21 22 23 24 25 26
# 27 28 29 30 31 32 33 34 35
# 36 37 38 39 40 41 42 43 44
# 45 46 47 48 49 50 51 52 53
# 54 55 56 57 58 59 60 61 62
# 63 64 65 66 67 68 69 70 71
# 72 73 74 75 76 77 78 79 80

def solve(board)
  solve_with_basic_logic(board)
  solve_with_advanced_logic(board) if !solved?(board)
  solve_with_educated_guessing(board) if !solved?(board)
end
# board = "7591824638163475292345697189672583411487362953259--687582671934493825176671493852"
# board = "123456789123456789123456789123456789123456789123456789123456789123456789123456789"
def solve_with_basic_logic(board)
  initial_board = ""
  while true
    # puts board
    initial_board = board.dup
    board.each_char.with_index(0) do |char, index|
      options = find_available_options_in_all(board, index)
      puts "char is #{char}, index is #{index} and options are #{options}"
      if char == "-" && options.length == 1
        # fill_the_cell(board, index)
        board[index] = options.first.to_s
      elsif char == "-" && options.length == 0
        puts "index is #{index} and options are #{options}"
        break
      else
        next
      end
    end
    break if initial_board == board
  end
end

def solve_with_advanced_logic(board)
  initial_board = ""
  while true
    initial_board = board.dup
    guessed_board = guess(board.dup)
    return guessed_board if initial_board == guessed_board(board)
    solve_with_advanced_logic(initial_board) if !solved?(guessed_board)
    return guessed_board if solved?(guessed_board)
  end
end

def guess(board)
  if solved?(board)
    return board
  end
  best_start_index = find_index_with_least_unknown(board)
  options = find_available_options_in_all(board, best_start_index)
  if !options.empty?
    options.each do |option|
      fill_guess(board, best_start_index, option)
      guessed_board = guess(board.dup)
      return guessed_board if solved?(guessed_board)
      remove_guess(board, best_start_index, option)
    end
  else
    board
  end
end

def find_index_with_least_unknown(board)
  results = []
  index_with_min_options = 0
  least_num_of_options = 9
  board.each_char.with_index(0) do |char, index|
    if char == "-"
      num_of_options = find_available_options_in_all(board, index).length
      results[index] = num_of_options
      least_num_of_options = num_of_options; index_with_min_options = index if num_of_options < least_num_of_options
    end
  end
  index_with_min_options
end

def fill_guess(board, index, guess)
  board(index) = guess
  board
end

def remove_guess(board, index, guess)
  board(index) = "-" if board(index) == guess
  board
end

def try(board, index, option)
  # puts "the board is #{board}, and index is #{index}, option is #{option}"
  result = board.dup
  result[index] = option.to_s
  result
end

def solved?(board)
  return false if !solved_in_all_rows(board)
  return false if !solved_in_all_cols(board)
  return false if !solved_in_all_blocks(board)
  return true
end

def solved_in_all_rows(board)
  return false if !no_empty_cell_in_rows(board)
  return false if !no_duplicates_in_rows(board)
  return true
end

def no_empty_cell_in_rows(board)
  [0,9,18,27,36,45,54,63,72].each do |index|
    return false if find_empty_cell_in_row(board, index)
  end
  return true
end

def find_empty_cell_in_row(board, index)
  get_row_indexes(index).each do |cur_index|
    return true if board[cur_index] == "-"
  end
  return false
end

def no_duplicates_in_rows(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |index|
    return false if find_duplicates_in_row(board, index)
  end
  return true
end

def find_duplicates_in_row(board, index)
  results = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  chars_in_row = get_row_indexes(index).map { |row_index| board[row_index] }
  !(results - chars_in_row).empty?
end

def solved_in_all_cols(board)
  return false if !no_empty_cell_in_cols(board)
  return false if !no_duplicates_in_cols(board)
  return true
end

def no_empty_cell_in_cols(board)
  [0,9,18,27,36,45,54,63,72].each do |index|
    return false if find_empty_cell_in_col(board, index)
  end
  return true
end

def find_empty_cell_in_col(board, index)
  get_col_indexes(index).each do |cur_index|
    return true if board[cur_index] == "-"
  end
  return false
end

def no_duplicates_in_cols(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |index|
    return false if find_duplicates_in_col(board, index)
  end
  return true
end

def find_duplicates_in_col(board, index)
  results = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  chars_in_col = get_col_indexes(index).map { |col_index| board[col_index] }
  !(results - chars_in_col).empty?
end

def solved_in_all_cols(board)
  return false if !no_empty_cell_in_cols(board)
  return false if !no_duplicates_in_cols(board)
  return true
end

def no_empty_cell_in_cols(board)
  [0,9,18,27,36,45,54,63,72].each do |index|
    return false if find_empty_cell_in_col(board, index)
  end
  return true
end

def find_empty_cell_in_col(board, index)
  get_col_indexes(index).each do |cur_index|
    return true if board[cur_index] == "-"
  end
  return false
end

def no_duplicates_in_cols(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |index|
    return false if find_duplicates_in_col(board, index)
  end
  return true
end

def find_duplicates_in_col(board, index)
  results = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  chars_in_col = get_col_indexes(index).map { |col_index| board[col_index] }
  !(results - chars_in_col).empty?
end

def solved_in_all_blocks(board)
  return false if !no_empty_cell_in_blocks(board)
  return false if !no_duplicates_in_blocks(board)
  return true
end

def no_empty_cell_in_blocks(board)
  [0,9,18,27,36,45,54,63,72].each do |index|
    return false if find_empty_cell_in_block(board, index)
  end
  return true
end

def find_empty_cell_in_block(board, index)
  get_block_indexes(index).each do |cur_index|
    return true if board[cur_index] == "-"
  end
  return false
end

def no_duplicates_in_blocks(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |index|
    return false if find_duplicates_in_block(board, index)
  end
  return true
end

def find_duplicates_in_block(board, index)
  results = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  chars_in_block = get_block_indexes(index).map { |block_index| board[block_index] }
  !(results - chars_in_block).empty?
end

def find_available_options_in_all(board, index)
  find_available_options_in_row(board, index) & find_available_options_in_col(board, index) & find_available_options_in_block(board, index)
end

def find_available_options_in_row(board, row_index)
  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  get_row_indexes(row_index).each do |index|
      results.delete_if { |result| result.to_s == board[index] }
  end
  results
end

def find_available_options_in_col(board, col_index)
  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  get_col_indexes(col_index).each do |index|
      results.delete_if {|result| result.to_s == board[index] }
  end
  results
end

def find_available_options_in_block(board, block_index)
  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  get_block_indexes(block_index).each do |index|
    results.delete_if { |result| result.to_s == board[index] }
  end
  results
end

def get_row_indexes(index)
  indexes = []
  start_index = index / 9 * 9
  end_index = start_index + 8
  while start_index <= end_index
    indexes.push(start_index)
    start_index += 1
  end
  indexes
end

def get_col_indexes(index)
  indexes = []
  start_index = 0 * 9 + index % 9
  end_index = 8 * 9 + index % 9
  while end_index >= start_index
    indexes.push(start_index)
    start_index += 9
  end
  indexes
end

def get_block_indexes(index)
  # block_row_index = index / 9 % 3
  # block_col_index = index % 3
  block_base_indexes = [0, 1, 2, 9, 10, 11, 18, 19, 20]
  block_index_offset = index - block_base_indexes[(index / 9 % 3 * 3) + index % 3]
  block_base_indexes.map { |index| index += block_index_offset }
end

def display(array)
  array.each do |index|
    print get_block_indexes(index)
    print "\n"
  end
end
