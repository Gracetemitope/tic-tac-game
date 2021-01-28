# ./spec/game_spec.rb
require_relative '../lib/game_logic'

describe GameLogic do
  player = GameLogic.new(:current_player, :winner)
  # player.options = [1..9]
  winning_move = [1, 2, 3]
  loss_move = [4, 5, 9]

  describe "#check_winner" do
    it "should return true for any win combo" do
      expect(player.check_winner(winning_move)).to be true
    end
  end
end