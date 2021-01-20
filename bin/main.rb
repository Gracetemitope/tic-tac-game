# !/usr/bin/env ruby
class Player
  attr_accessor :name, :options, :options_to_display, :options_checker

  def initialize(name, options)
    @name = name
    @options = options
    @options_to_display = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @options_checker = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update_options(player_option, symbol)
    if @options_checker.include?(player_option)
      # update the options_to_display array
      @options_checker.reject { |choice| choice == player_option }
      @options_to_display[player_option - 1] = symbol
    else
      puts 'Please select a correct option'
      update_options(player_option, symbol)
    end
  end
end

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
  display_game_status(player_two.options_to_display)
when 'N'
  # Close the game
  puts 'Great! You could check later when youre ready'
else
  puts 'Incorrect Option, please enter a valid response'
end
