# ./spec/board_spec.rb
require_relative '../lib/game_board'
require_relative '../bin/main'


describe Board do
  describe '#update_board' do
    board_display = Board.new(:options, :options_checker)
    board_display.options = [1, 2, 3]
    board_display.options_checker = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    it 'returns true if options is contained in option_checker' do
      expect(board_display.update_board).to be true

    end
  end
end

