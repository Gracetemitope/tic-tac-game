# ./spec/game_spec.rb
require_relative '../lib/game_logic'
require_relative '../lib/players'

describe GameLogic do
  let(:top_row) { [1, 2, 3] }
  let(:middle_row) { [4, 5, 6] }
  let(:bottom_row) { [7, 8, 9] }
  let(:left_column) { [1, 4, 7] }
  let(:middle_column) { [2, 5, 8] }
  let(:right_column) { [3, 6, 9] }
  let(:diagonal_right) { [1, 5, 9] }
  let(:diagonal_left) { [3, 5, 7] }
  describe '#check_winner' do
    it 'check horizontal row at the top' do
      expect([1, 2, 3] - top_row).to eq([])
    end
    it 'check if it is not horizontal row at the top' do
      expect([1, 4, 3] - top_row).not_to eq([])
    end

    it 'check horizontal row at the middle' do
      expect([4, 5, 6] - middle_row).to eq([])
    end
    it 'check if it is not horizontal row at the middle' do
      expect([4, 1, 6] - middle_row).not_to eq([])
    end
    it 'check horizontal row at the bottom' do
      expect([7, 8, 9] - bottom_row).to eq([])
    end
    it 'check if it not horizontal row at the bottom' do
      expect([7, 1, 9] - bottom_row).not_to eq([])
    end

    it 'check left vertical collumn' do
      expect([1, 4, 7] - left_column).to eq([])
    end
    it 'check if it not left vertical column' do
      expect([1, 9, 7] - left_column).not_to eq([])
    end

    it 'check middle vertical collumn' do
      expect([2, 5, 8] - middle_column).to eq([])
    end

    it 'check if it is not middle vertical collumn' do
      expect([2, 1, 8] - middle_column).not_to eq([])
    end

    it 'check right vertical collumn' do
      expect([3, 6, 9] - right_column).to eq([])
    end

    it 'check if it is not right vertical collumn' do
      expect([3, 4, 9] - right_column).not_to eq([])
    end
    it 'check diagonal values at the right' do
      expect([1, 5, 9] - diagonal_right).to eq([])
    end
    it 'check if it is not diagonal values at the right' do
      expect([1, 3, 9] - diagonal_right).not_to eq([])
    end

    it 'check diagonal values at the left' do
      expect([3, 5, 7] - diagonal_left).to eq([])
    end
    it 'check if it nis not diagonal values at the left' do
      expect([3, 9, 7] - diagonal_left).not_to eq([])
    end
  end
end
