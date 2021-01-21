require_relative '../bin/main'

class Game_board 
    attr_accessor :options
    def initialize (options)
        @options = options
    end
    public 
    def display_game_status(options)
        puts '      *       *      '
        puts "   #{options[0]}  *   #{options[1]}   *   #{options[2]}  "
        puts '      *       *       '
        puts '* * * * * * * * * * * '
        puts '      *       *       '
        puts "   #{options[3]}  *   #{options[4]}   *   #{options[5]}   "
        puts '      *       *       '
        puts '* * * * * * * * * * * '
        puts '      *       *       '
        puts "   #{options[6]}  *    #{options[7]}  *   #{options[8]}   "
        puts '      *       *       '
    end
end 