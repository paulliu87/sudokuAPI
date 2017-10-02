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
  initial_board = ""
  while true
    initial_board = board.dup
    board.each_char.with_index(0) do |char, index|
      options = find_available_options_in_all(board, index)
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
# board = "7591824638163475292345697189672583411487362953259--687582671934493825176671493852"

def guess(board)
  # puts "this is guess(board) function"
  best_guess = find_index_with_least_unknown(board)
  index = best_guess.keys.first
  options = best_guess.values.first
  # method = best_guess.values.first[1]
  if !options.empty?
    copy_board = board.dup
    options.each do |option|
      result = try(copy_board, index, option)
      if solved?(copy_board)
        return copy_board
      else
        return solve(copy_board)
      end
    end
  else
    board
  end
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
    return false if find_empty_cell_in_row(index)
  end
end

def find_empty_cell_in_row(index)
  get_row_indexes(index).each do |cur_index|
    return true if board[cur_index] == "-"
  end
end

def no_duplicates_in_rows(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |index|
    return false if find_duplicates_in_row(index)
  end
end

def find_duplicates_in_row(index)
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
    return false if find_empty_cell_in_col(index)
  end
end

def find_empty_cell_in_col(index)
  get_col_indexes(index).each do |cur_index|
    return true if board[cur_index] == "-"
  end
end

def no_duplicates_in_cols(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |index|
    return false if find_duplicates_in_col(index)
  end
end

def find_duplicates_in_col(index)
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
    return false if find_empty_cell_in_col(index)
  end
end

def find_empty_cell_in_col(index)
  get_col_indexes(index).each do |cur_index|
    return true if board[cur_index] == "-"
  end
end

def no_duplicates_in_cols(board)
  [0, 9, 18, 27, 36, 45, 54, 63, 72].each do |index|
    return false if find_duplicates_in_col(index)
  end
end

def find_duplicates_in_col(index)
  results = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  chars_in_col = get_col_indexes(index).map { |col_index| board[col_index] }
  !(results - chars_in_col).empty?
end

def find_available_options_in_all(board, index)
  find_available_options_in_col(board, index) & find_available_options_in_col(board, index) & find_available_options_in_block(board, index)
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
