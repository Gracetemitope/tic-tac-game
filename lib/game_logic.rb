class GameLogic
  attr_accessor :winner, :current_player

  def initialize(current_player)
    @current_player = current_player
    @winner = 'No winner for this game'
  end

  def check_winner(player)
    # 1,2,3 4,5,6 7,8,9
    if ([1, 2, 3] - player.options).empty? ||
       ([4, 5, 6] - player.options).empty? ||
       ([7, 8, 9] - player.options).empty? ||
       ([1, 4, 7] - player.options).empty? ||
       ([2, 5, 8] - player.options).empty? ||
       ([3, 6, 9] - player.options).empty? ||
       ([1, 5, 9] - player.options).empty? || ([3, 5, 7] - player.options).empty?
      @winner = player.name
    end
  end
end
