# !/usr/bin/env ruby
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
def play_the_game(player_name, options, options_copy)
 puts "#{player_name}, Please pick an option"
display_game_status(options)
player_option = gets.chomp()
player_option = player_option.to_i
if options_copy.include?(player_option)
    options_copy = options_copy.reject { |choice| choice == player_option }
else 
  
end
end

# def tic_tac_toe_game(player_one_p, player_two_p)
#   options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#   options_copy = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#   player_one_options = []
#   player_two_options = []
#   puts "#{player_one_p}, please select a number between these options"
#   display_game_status(options)
#   player_one_option = gets.chomp
#   player_one_option = player_one_option.to_i
#   if options_copy.include?(player_one_option)
#     options_copy = options_copy.reject { |choice| choice == player_one_option }
#     options[player_one_option - 1] = 'x'
#     puts "#{player_two_p} Please select a number between "
#     display_game_status(options)
#     player_two_option = gets.chomp
#     player_two_option = player_two_option.to_i
#     if options_copy.include?(player_two_option)
#       player_two_options << player_two_option
#       options_copy = options_copy.reject { |choice| choice == player_two_option }
#       options[player_two_option - 1] = 'o'
#       puts "#{player_one_p} Please select a number between"
#       display_game_status(options)
#       # puts player_one_options
#       # puts player_two_options
#       # puts options_copy
#     else
#       puts 'Please put a correct option'
#       puts "Option is supposed to be one of #{options_copy}"
#     end
#   else
#     puts 'Please put a correct option'
#     puts "Option is supposed to be one of #{options_copy}"
#   end
# end

def ask_the_name (player)
  puts "#{player}, please put your name"
  player_name = gets.chomp()
  if player_name.length >= 2
    puts "Welcome #{player_name}"
  else
    puts "Please enter a correct name"
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
  2.times do |i|
    players << ask_the_name("Player number #{i+1}")
  end
  puts "#{players}"

  options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  options_copy = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  9.times do |i|
    if i.odd?
      #second player has to play

      play_the_game(players[1], options, options_copy)
    elsif i.even?
      # it's first player's turn
      play_the_game(players[0], options, options_copy)
    else
      #end the game
    end
  end 
  # Playing the Game
  # tic_tac_toe_game(player_one, player_two)
when 'N'
  # Close the game
  puts 'Great! You could check later when youre ready'
else
  puts 'Incorrect Option, please enter a valid response'
end
