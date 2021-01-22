
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
        @options_checker = @options_checker.reject { |choice| choice == player_option }
        @options_to_display[player_option - 1] = symbol
        # @options_to_display
      else
        puts 'Please select a correct option'
        player_option_p = gets.chomp
        player_option_p = player_option_p.to_i
        update_options(player_option_p, symbol)
      end
    end
   end