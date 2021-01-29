# ./spec/board_spec.rb
require_relative '../lib/game_board'
require_relative '../bin/main'
require_relative '../lib/players'

describe Board do
  let(:board_display) { Board.new }
  let(:options_checker) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  describe '#update_board' do
    it 'returns true if options is contained in option_checker' do
      expect(options_checker).to include(1, 2, 3)
    end
    it 'returns false if options is not contained in option_checker' do
      expect(options_checker).not_to include(10, 12, 14)
    end
  end
  describe '#reject' do
    it 'remove element that match the option' do
      option = 1
      expect(options_checker.reject { |choice| choice == option }).to eq([2, 3, 4, 5, 6, 7, 8, 9])
    end
    it 'return the same array if selected option is not contained in options_checker' do
      option = 10
      expect(options_checker.reject { |choice| choice == option }).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
