def reset_screen
  clear_screen
  move_to_home
end

# Clears the content on the screen. Ah, a fresh canvas.
def clear_screen
  print "\e[2J"
end

# Moves the insert point in the terminal back to the upper left.
def move_to_home
  print "\e[H"
end

def pretty_board(board)
  if board.nil?
    print "there is no board"
  else
    i = 0
    board.each_char do |char|
      print " #{char}"
      if i != 8
        i += 1
      else
        print "\n"
        i = 0
      end
    end
  end
end
