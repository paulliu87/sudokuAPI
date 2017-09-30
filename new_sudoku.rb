
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
  puts "this is solve(board) function"

  while fill_the_cell_with_only_option(board)
    fill_the_cell_with_only_option(board)
  end
  guess(board)
end

def guess(board)
  puts "this is guess(board) function"

  best_guess = find_index_with_least_unknown(board)
  index = best_guess.keys.first
  options = best_guess.values.first
  # method = best_guess.values.first[1]
  if !options.empty?
    copy_board = board.dup
    options.each do |option|
      try(copy_board, index, option)
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

def find_index_with_least_unknown(board)
  puts "this is find_index_with_least_unknown(board) function"

  indexes = []
  row_index = find_index_with_least_row_unknown(board)
  row_options = find_available_options_in_row(board, row_index)
  col_index = find_col_with_least_unknown(board)
  col_options = find_available_options_in_col(board, col_index)
  block_index = find_index_with_least_block_unknown(board)
  block_options = find_available_options_in_block(board, block_index)
  indexes[row_options] = row_index
  indexes[col_options] = col_index
  indexes[block_options] = block_index
  # method = find_best_start_method(row_options, col_options, block_options)
  { indexes.compact.first => [row_options | col_options | block_options] }
end

def find_best_start_method(row_options, col_options, block_options)
  puts "this is find_best_start_method(row_options, col_options, block_options) function"

  if row_options.length <= col_options.length && row_options <= block_options
    return "row"
  elsif row_options.length >= col_options.length && col_options <= block_options
    return "col"
  else
    return "block"
  end
end

def fill_the_cell_with_only_option(board)
  puts "this is fill_the_cell_with_only_option(board) function"

  row_index = find_index_with_least_row_unknown(board)
  row_options = find_available_options_in_row(board, row_index)
  col_index = find_col_with_least_unknown(board)
  col_options = find_available_options_in_col(board, col_index)
  block_index = find_index_with_least_block_unknown(board)
  block_options = find_available_options_in_block(board, block_index)
  if row_options.length == 1
    board[row_index] = row_options.first
    return true
  elsif col_options.length == 1
    board[col_index] = col_options.first
    return true
  elsif block_options.length == 1
    board[block_index] = block_options.first
    return true
  else
    return false
  end
end

def find_index_with_least_row_unknown(board)
  puts "this is find_index_with_least_row_unknown(board) function"

  max_unknown = []
  for i in 0..8 do
    num_unknown = 0
    for j in 0..8 do
      num_unknown += 1 if board[i + j] == '-'
    end
    max_unknown[num_unknown] = i + j
  end
  max_unknown.compact.first
end

def find_col_with_least_unknown(board)
  puts "this is find_col_with_least_unknown(board) function"

  max_unknown = []
  for i in 0..8 do
    num_unknown = 0
    for j in 0..8 do
      num_unknown += 1 if board[i + j * 9] == '-'
    end
    max_unknown[num_unknown] = i + j * 9
  end
  max_unknown.compact.first
end

def find_index_with_least_block_unknown(board)
  puts "this is find_index_with_least_block_unknown(board) function"

  max_unknown = []
  for i in 0..8 do
    num_unknown = 0
    index = 0
    for j in 0..2 do
      if i <= 2
        if board[(i * 3) + j] == '-'
          index = (i * 3) + j
          num_unknow += 1
        end
        if board[(i * 3) + j + 9] == '-'
          index = (i * 3) + j + 9
          num_unknow += 1
        end
        if board[(i * 3) + j + 18] == '-'
          index = (i * 3) + j + 18
          num_unknow += 1
        end
      elsif i >= 3 && i <= 5
        if board[(i * 3) + j + 27] == '-'
          index = (i * 3) + j + 27
          num_unknow += 1
        end
        if board[(i * 3) + j + 9 + 27] == '-'
          index = (i * 3) + j + 9 + 27
          num_unknow += 1
        end
        if board[(i * 3) + j + 18 + 27] == '-'
          index = (i * 3) + j + 18 + 27
          num_unknow += 1
        end
      else
        if board[(i * 3) + j + 54] == '-'
          index = (i * 3) + j + 54
          num_unknow += 1
        end
        if board[(i * 3) + j + 9 + 54] == '-'
          index = (i * 3) + j + 9 + 54
          num_unknow += 1
        end
        if board[(i * 3) + j + 18 + 54] == '-'
          index = (i * 3) + j + 18 + 54
          num_unknow += 1
        end
      end
    end
    max_unknown[num_unknown] = index
  end
  max_unknown.compact.first
end

def find_available_options_in_row(board, row_index)
  puts "this is find_available_options_in_row(board, row_index) function"

  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  start_index = row_index / 9 * 9
  end_index = start_index + 8
  for i in start_index..end_index do
      results.delete_if { |result| result.to_s == board[i] }
  end
  results
end

def find_available_options_in_col(board, col_index)
  puts "this is find_available_options_in_col(board, col_index) function"

  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  start_index = ((col_index / 9) > 0) ? ((col_index / 9 - 1) * 9 + col_index % 9) : (col_index / 9 * 9 + col_index % 9)
  end_index = ((col_index / 9) < 8) ? ((col_index / 9 + 1) * 9 + col_index % 9) : (col_index / 9 * 9 + col_index % 9)
  while end_index >= start_index
      results.delete_if { |result| result.to_s == board[start_index] }
      start_index = start_index + 9
  end
  results
end

def find_available_options_in_block(board, block_index)
  puts "this is find_available_options_in_block(board, block_index) function"

  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  block_row_index = block_index / 8
  block_col_index = block_index % 3
  block_index_offset = block_index - (block_row_index * 9) - (block_col_index)
  block_base_indexes = [0, 1, 2, 9, 10, 11, 18, 19, 20]
  block_base_indexes.each do |block_base_index|
    index = block_base_index + block_index_offset
    results.delete_if { |result| result.to_s == board[index] }
  end
  results
end
