# !/usr/bin/env ruby
require_relative '../lib/game_board'
require_relative '../lib/game_logic'
require_relative '../lib/players'

options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
options_checker = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def display_game_status(options_p)
  puts '      *       *      '
  puts "   #{options_p[0]}  *   #{options_p[1]}   *   #{options_p[2]}  "
  puts '      *       *       '
  puts '* * * * * * * * * * * '
  puts '      *       *       '
  puts "   #{options_p[3]}  *   #{options_p[4]}   *   #{options_p[5]}   "
  puts '      *       *       '
  puts '* * * * * * * * * * * '
  puts '      *       *       '
  puts "   #{options_p[6]}  *    #{options_p[7]}  *   #{options_p[8]}   "
  puts '      *       *       '
end

def ask_the_name(player)
  puts "#{player}, please put your name"
  player_name = gets.chomp
  if player_name.length >= 2
    puts "Welcome #{player_name}"
  else
    puts 'Please enter a correct name'
    puts 'Name should be atleast two characters'
    ask_the_name(player)
  end
  player_name
end

# def play_the_game(player_name, options)
#   puts "#{player_name}, Please pick an option"
#   display_game_status(options)
#   player_option = gets.chomp
#   player_option.to_i
# end

puts 'Welcome to the TIC TAC TOE game'
puts '-------------------------------'
puts 'Are you ready to play the game ? Y/N'

user_response = gets.chomp

case user_response.upcase
when 'Y'
  # Play the game
  players = []

  (1..2).each do |i|
    players << ask_the_name("Player number #{i}")
  end
  player_one = Player.new(players[0], 'X', [])
  player_two = Player.new(players[1], 'O', [])
  board = Board.new(options, options_checker)
  logic = GameLogic.new(player_one)
  finished = false
  j = 0

  until finished
    puts "#{logic.current_player.name}, please enter a move"
    display_game_status(board.options)
    player_option = gets.chomp
    player_option = player_option.to_i
    if j.odd?
      # second player has to play
      player_two.options << player_option
      updated = board.update_board(player_two.symbol, player_option)
      logic.check_winner(player_two)
      logic.current_player = player_one
    elsif j.even?
      # it's first player's turn
      player_one.options << player_option
      updated = board.update_board(player_one.symbol, player_option)
      puts board.options
      puts updated
      logic.check_winner(player_one)
      logic.current_player = player_two
    end
    j += 1
    finished = true if j >= 9 || logic.winner != "It's a draw, No winner for this game"
  end
  # puts "It's a drawing move, #{player_one.name} wins the game"
  if logic.winner != 'No winner for this game'
    puts "It's a winning move, #{logic.winner} wins the game"
  else
    puts logic.winner
  end

  display_game_status(board.options)
when 'N'
  # Compute if it is a draw with conditions
  # Close the game
  puts 'Great! You could check later when youre ready'
else
  puts 'Incorrect Option, please enter a valid response'
end
