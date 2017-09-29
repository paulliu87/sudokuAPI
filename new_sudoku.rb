#find_least_easy_one(board) return index
  #find_lest_u_in_row(board) return index
    #get_numbers_from_row(board, index) return string
  #find_lest_u_in_colboard) return index
    #get_numbers_from_col(board, index) return string
  #find_lest_u_in_block(board) return index
    #get_numbers_from_block(board, index) return string

#find_avalaible_options(board, index, options) return options
  #find_avalaible_optionsin_from_row(board, index, options)
  #find_avalaible_optionsin_from_col(board, index, options)
  # find_avalaible_optionsin_from_block(board, index, options)

#if find_avalaible_options = 1
  #fill_the_u(board, index)
#else
  #guess(board, index, find_avalaible_options)

def solve(board)
  index = find_least_easiest_one(board)
  default_options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  options = find_available_options(board, index, default_options)
  fill_index(board, index, options)
end

def find_eaiest_one(board)
  indexes = []
  row_index = find_row_with_least_unknown(board)
  row_options = find_available_options_in_row(board, row_index)
  col_index = find_col_with_least_unknown(board)
  col_options = find_available_options_in_col(board, col_index)
  block_index = find_block_with_least_unknown(board)
  block_options = find_available_options_in_block(board, block_index)
  indexes[row_options.length] = row_index
  indexes[col_options.length] = col_index
  indexes[block_options.length] = block_index
  indexes.compact.first
end

def find_row_with_least_unknown(board)
  max_unknown = []
  for i in 0..8 do
    num_unknown = 0
    for j in 0..8 do
      num_unknown++ if board[i + j] == '-'
    end
    max_unknown[num_unknown] = i + j
  end
  max_unknown.compact.first
end

def find_col_with_least_unknown(board)
  max_unknown = []
  for i in 0..8 do
    num_unknown = 0
    for j in 0..8 do
      num_unknown++ if board[i + j * 9] == '-'
    end
    max_unknown[num_unknown] = i + j * 9
  end
  max_unknown.compact.first
end

def find_block_with_least_unknown(board)
  max_unknown = []
  for i in 0..8 do
    num_unknown = 0
    index = 0
    for j in 0..2 do
      if i < 3
        if board[(i * 3) + j] == '-'
          index = (i * 3) + j
          num_unknown++
        end
        if board[(i * 3) + j + 9] == '-'
          index = (i * 3) + j + 9
          num_unknown++
        end
        if board[(i * 3) + j + 18] == '-'
          index = (i * 3) + j + 18
          num_unknown++
        end
      elsif i >= 3 && i <= 5
        if board[(i * 3) + j + 27] == '-'
          index = (i * 3) + j + 27
          num_unknown++
        end
        if board[(i * 3) + j + 9 + 27] == '-'
          index = (i * 3) + j + 9 + 27
          num_unknown++
        end
        if board[(i * 3) + j + 18 + 27] == '-'
          index = (i * 3) + j + 18 + 27
          num_unknown++
        end
      else
        if board[(i * 3) + j + 54] == '-'
          index = (i * 3) + j + 54
          num_unknown++
        end
        if board[(i * 3) + j + 9 + 54] == '-'
          index = (i * 3) + j + 9 + 54
          num_unknown++
        end
        if board[(i * 3) + j + 18 + 54] == '-'
          index = (i * 3) + j + 18 + 54
          num_unknown++
        end
      end
    end
    max_unknown[num_unknown] = index
  end
  max_unknown.compact.first
end

def find_available_options_in_row(board, row_index)
  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  start_index = row_index / 9 * 9
  end_index = start_index + 8
  for i in start_index..end_index do
      results.delete_if { |result| results == board[i] }
  end
  results
end

def find_available_options_in_col(board, col_index)
  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  start_index = if col_index / 9 > 0 (col_index / 9 - 1) * 9 + col_index % 9 : col_index / 9 * 9 + col_index % 9
  end_index = if col_index / 9 < 8 (col_index / 9 + 1) * 9 + col_index % 9 : col_index / 9 * 9 + col_index % 9
  while end_index >= start_index
      results.delete_if { |result| results == board[start_index] }
      start_index = start_index + 9
  end
  results
end

def find_available_options_in_block(board, block_index)
  results = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  start_index = if row_index / 9 > 0 (row_index / 9 - 1) * 9 + row_index % 9 : row_index / 9 * 9 + row_index % 9
  end_index = if row_index / 9 < 8 (row_index / 9 + 1) * 9 + row_index % 9 : row_index / 9 * 9 + row_index % 9
  while end_index >= start_index
      results.delete_if { |result| results == board[start_index] }
      start_index = start_index + 9
  end
  results
end
 0  1  2  3  4  5  6  7  8
 9 10 11 12 13 14 15 16 17
18 19 20 21 22 23 24 25 26
27 28 29 30 31 32 33 34 35
36 37 38 39 40 41 42 43 44
45 46 47 48 49 50 51 52 53
54 55 56 57 58 59 60 61 62
63 64 65 66 67 68 69 70 71
72 73 74 75 76 77 78 79 80
