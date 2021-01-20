# !/usr/bin/env ruby
#!/usr/bin/env ruby

def display_game_status (options_p)
  puts "      *       *      "
  puts "   #{options_p[0]}  *   #{options_p[1]}   *   #{options_p[2]}  "
  puts "      *       *       "
  puts "* * * * * * * * * * * "
  puts "      *       *       "
  puts "   #{options_p[3]}  *   #{options_p[4]}   *   #{options_p[5]}   "
  puts "      *       *       "
  puts "* * * * * * * * * * * "
  puts "      *       *       "
  puts "   #{options_p[6]}  *    #{options_p[7]}  *   #{options_p[8]}   "
  puts "      *       *       "
end

def tic_tac_toe_game (player_one_p, player_two_p)
  options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  options_copy = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
  display_game_status(options)
  player_one_options = []
  player_two_options = []
    puts "#{player_one_p}, please select a number"
    player_one_option = gets.chomp()
    player_one_option = player_one_option.to_i
    if options_copy.include?(player_one_option)
        player_one_options << player_one_option #update the player_one_options array
        options_copy = options_copy.select {|choice| choice != player_one_option}
        options[player_one_option-1] = "x"
        puts "#{player_two_p} Please select a number between #{options_copy}"
        player_two_option = gets.chomp()
        player_two_option = player_two_option.to_i
        if options_copy.include?(player_two_option)
          player_two_options << player_two_option
          options_copy = options_copy.select {|choice| choice != player_two_option}
          options[player_two_option-1] = "o"
          display_game_status(options)
          puts "#{player_one_p} Please select a number between #{options_copy}"
          # puts player_one_options
          # puts player_two_options
          # puts options_copy
        else
          puts "Please put a correct option"
          puts "Option is supposed to be one of #{options_copy}"
        end
    else
        puts "Please put a correct option"
        puts "Option is supposed to be one of #{options_copy}"
    end

end

puts "Welcome to the tic tac toe game"
puts "Are you ready to play the game ? Y/N"

user_response = gets.chomp()

if user_response.upcase == "Y"
    # Play the game
    puts "Player one, please enter name?"
    player_one = gets.chomp()
    if player_one.length >= 2 
      puts "Welcome #{player_one}"
      puts "Player two, Please enter your name"
      player_two = gets.chomp()
      if player_one.length >= 2 
        puts "Welcome #{player_two}"
      else
        puts "Please enter a valid name"
        puts "Name should be atleast two characters"
      end
    else
    puts "Please enter a valid name"
    puts "Name should be atleast two characters"
    end
    # Playing the Game
    tic_tac_toe_game(player_one, player_two)
elsif user_response.upcase == "N"
    # Close the game
    puts "Great! You could check later when you're ready"
else
  puts "Incorrect Option, please enter a valid response"
end


