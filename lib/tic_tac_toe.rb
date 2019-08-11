WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(marks)
  puts " #{marks[0]} | #{marks[1]} | #{marks[2]} "
  puts "-----------"
  puts " #{marks[3]} | #{marks[4]} | #{marks[5]} "
  puts "-----------"
  puts " #{marks[6]} | #{marks[7]} | #{marks[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, value)
  board[index] = value
  board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move? (board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  else
    false
  end
end

def turn_count(board)
  counter = 0
  board.each do |pos|
    if !(pos === " ")
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 === 0
    "X"
  else
    "O"
  end
end

def turn (board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    value = current_player(board)
    move(board, index, value)
    display_board(board)
  else
    turn (board)
  end
end
