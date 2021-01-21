class GameLogic
  attr_accessor :winner, :current_player
  def initialize (current_player)
    @current_player = current_player
    @winner = "No winner for this game"
  end
  public
  def check_winner (options, options_checker, player)
    # 1,2,3 4,5,6 7,8,9
    end_game = false 
    if ([1,2,3] - options).empty? || ([4,5,6] - options).empty? || ([7,8,9] - options).empty? || ([1,4,7] - options).empty? || ([2,5,8] - options).empty? || ([3,6,9] - options).empty?  || ([1,5,9] - options).empty? || ([3,5,7] - options).empty?
      end_game = true 
    end
    end_game
  end
end