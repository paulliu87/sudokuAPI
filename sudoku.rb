# The input board will be in whatever
 # form `solve` returns.
require_relative 'reset_screen'
def pretty_board(board)
  # reset_screen
    row_index = 0
    while row_index < 9
      column_index = 0
      while column_index < 9
        key = [row_index,column_index]
        if board[key].length > 1
          print " * "
        else
          print " #{board[key][0]} "
        end
        column_index += 1
      end
      print "\n"
      row_index += 1
    end
    sleep(0.5)
end

def updating_hash_map(input_array, coordinate, hash)
  input_array.each do |num|
    if hash[coordinate].length > 1
      hash[coordinate].delete(num)
    end
  end
  hash
end

def get_solution_hash(board_string)
  y = 0
  x = 0
  solution_hash = {}
  board_string.each_char do |position|
    coordinate = [x,y]
    if position == '-'
      solution_hash[coordinate] = [*'1'..'9']
    else
      solution_hash[coordinate] = [position]
    end
    if y == 8
      y = 0
      x += 1
    else
      y += 1
    end
  end
  solution_hash
end

def get_hash_key(hash,index)
 keys = hash.keys
 keys[index]
end


def get_row(hash,row_num)
  row = []
  hash.each do |key_value|
    if key_value[0][0] == row_num && key_value[1].count == 1
      row << key_value[1][0]
    end
  end
  row
end

def get_column(hash,column_num)
  column = []
  hash.each do |key_value|
    if key_value[0][1] == column_num && key_value[1].count == 1
      # puts "#{key_value}"
      column << key_value[1][0]
    end
  end
  column
end

def get_square(hash,coordinate)
  square = []
    if coordinate[0] <= 2 && coordinate[1] <= 2
      square = get_square_array(hash,[1,1])
    elsif coordinate[0] <= 2 && (coordinate[1] > 2 && coordinate[1] <= 5)
      square = get_square_array(hash,[1,4])
    elsif coordinate[0] <= 2 && (coordinate[1] > 5 && coordinate[1] <= 8)
      square = get_square_array(hash,[1,7])
    elsif (coordinate[0]  > 2  && coordinate[0] <= 5) && coordinate[1] <= 2
      square = get_square_array(hash,[4,1])
    elsif (coordinate[0]  > 2  && coordinate[0] <= 5) && (coordinate[1] > 2 && coordinate[1] <= 5)
      square = get_square_array(hash,[4,4])
    elsif (coordinate[0]  > 2  && coordinate[0] <= 5) && coordinate[1] > 5
      square = get_square_array(hash,[4,7])
    elsif coordinate[0] > 5 && coordinate[1] <= 2
      square = get_square_array(hash,[7,1])
    elsif coordinate[0]  > 5 && (coordinate[1] > 2 && coordinate[1] <= 5)
      square = get_square_array(hash,[7,4])
    else
      square = get_square_array(hash,[7,7])
    end
  square
end

def get_square_array(hash,coordinates)
  x = coordinates[0] - 1
  y = coordinates[1] - 1

  square_array = []

  while y < coordinates[1] +2
    key = [x,y]

    if hash[key].count == 1
      square_array << hash[key][0]
    end


    if x == coordinates[0] +1
      x = coordinates[0] - 1
      y += 1
    else
      x += 1
    end
  end
  square_array
end

def update_hash_solutions (hash)
  return_hash = {}
  hash.each do |coordinate|
    # puts "this is coordinate #{coordinate}"
    # puts "this is the count#{coordinate[1].count}"
    if coordinate[1].count > 1
      row = get_row(hash,coordinate[0][0])
      column = get_column(hash,coordinate[0][1])
      square = get_square(hash,coordinate[0])
      row_hash = updating_hash_map(row,coordinate[0],hash)
      column_hash = updating_hash_map(column,coordinate[0],row_hash)
      return_hash = updating_hash_map(square,coordinate[0],column_hash)
    else
      return_hash[coordinate[0]] = coordinate[1]
    end
  end
  return_hash
end

def solved?(sample_hash)
  solved = false
  con_num = 0
  hash_values = sample_hash.values
  hash_values.each do |value|
    con_num += value.count
    if con_num <= 81
      solved = true
    else
      solved = false
    end
  end
  # puts "the count is #{con_num} solved? #{solved}"
  solved
end




sudoku_string = File.readlines('sudoku_puzzles.txt').first.chomp
sudoku = get_solution_hash(sudoku_string)

# sudoku_copy = get_solution_hash(sudoku_string)


#     puts "this is copy"
#     pretty_board(sudoku_copy)
get_column(sudoku,1)


def solve(sample_hash)
  puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  stop_hash = sample_hash.dup
  temp_hash = update_hash_solutions(sample_hash)
  pretty_board(temp_hash)
  puts "puts #{solved?(stop_hash)}"
  return guess_solution(temp_hash) if stop_hash == temp_hash && solved?(stop_hash) != true
  return solve(temp_hash) if solved?(stop_hash) == false
  # return temp_hash if solved?(stop_hash) == true

  #guessing


  temp_hash
end

def guess_solution(sample_hash)
  puts "?????????????????????????????????????????????????????"
  copy_hash = sample_hash.dup
  return_hash = {}
  compare_hash = {}
  sample_hash.each.with_index do |key_value,index|
    if key_value[1].length == 2
      i = 0
      while i < key_value[1].length

        test_hash = sample_hash.dup
        if key_value[1].count == 2
          copy_key = key_value[0]
          copy_hash[copy_key] = [key_value[1][i]]
          compare_hash = solve(copy_hash)
        end
        # if key_value[0] == [3,3]
        #   puts "#{key_value[1]}"
        # end

          if solved?(compare_hash)
            return_hash = compare_hash
          else
            i += 1
          end
        end
      end
    end
  return_hash
end
