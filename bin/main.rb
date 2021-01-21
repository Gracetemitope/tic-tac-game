# !/usr/bin/env ruby
require_relative '../lib/game_board'
require '../lib/players'

def play_the_game(player_name, options)
  puts "#{player_name}, Please pick an option"
  display_game_status(options)
  player_option = gets.chomp
  player_option.to_i
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

puts 'Welcome to the tic tac toe game'
puts 'Are you ready to play the game ? Y/N'

user_response = gets.chomp

case user_response.upcase
when 'Y'
  # Play the game
  players = []

  (1..2).each do |i|
    players << ask_the_name("Player number #{i}")
  end
  # puts players.to_s
  player_one = Player.new(players[0], [])
  player_two = Player.new(players[1], [])
  finished = false
  j = 0
  puts j
  until finished
    if j.odd?
      # second player has to play
      player_option = play_the_game(player_two.name, player_one.options_to_display)
      player_two.update_options(player_option, 'o')
      player_one.options_checker = player_two.options_checker
      player_one.options_to_display = player_two.options_to_display
    elsif j.even?
      # it's first player's turn
      player_option = play_the_game(player_one.name, player_one.options_to_display)
      player_one.update_options(player_option, 'x')
      player_two.options_checker = player_one.options_checker
      player_two.options_to_display = player_one.options_to_display
    end
    j += 1
    finished = true if j >= 9
  end
  # if player_option = 1 & player_option = 2 & player_option = 3
  #   puts "#{play}"
  puts "It's a win"
  puts 'Player one win the game'
  display_game_status(player_two.options_to_display)
when 'N'
  # Compute if it is a draw with conditions
  # Close the game
  puts 'Great! You could check later when youre ready'
else
  puts 'Incorrect Option, please enter a valid response'
end
end
