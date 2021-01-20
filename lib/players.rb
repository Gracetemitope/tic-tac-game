require_relative '../bin/main'

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
    public
    def check_winner_horizontally()
      if player_option.include?([1, 2, 3]) 
        puts "Player wins"
    end
  end