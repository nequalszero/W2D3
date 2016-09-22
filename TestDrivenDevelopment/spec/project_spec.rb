require 'rspec'
require 'project'

describe '#my_uniq' do
  subject(:test_array) {[1, 2, 1, 3, 3]}

  it 'removes duplicates' do
    expect(test_array.my_uniq).to eq([1, 2, 3])
  end

  it 'does not call the built in #uniq' do
    expect(test_array).not_to receive(:uniq)
    test_array.my_uniq
  end

end


describe '#two_sum' do
  subject(:test_array) {[-1, 0, 2, -2, 1]}

  it 'returns pairs of indicies that sum to 0' do
    expect(test_array.two_sum).to eq([[0,4], [2,3]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq([])
  end

end

describe '#my_transpose' do
  let(:grid) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  it 'returns transpose of matrix' do
    expect(grid.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end

  it 'does not call #transpose on square matrix' do
    expect(grid).not_to receive(:transpose)
    grid.my_transpose
  end

  let(:grid2) { [[0, 1, 2, 9], [3, 4, 5, 10], [6, 7, 8, 11]] }

  it 'returns transpose of rectangular matrix' do
    expect(grid2.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8],
                                      [9, 10, 11]])
  end

  it 'does not call #transpose on rectangular matrix' do
    expect(grid2).not_to receive(:transpose)
    grid2.my_transpose
  end
end

describe '#stock_pick' do

  it 'returns the best day to buy and sell' do
    prices = [1, 2, 3]
    expect(stock_pick(prices)).to eq([0, 2])
  end

  it 'returns the best day to buy and sell' do
    prices = [1, 3, 2]
    expect(stock_pick(prices)).to eq([0, 1])
  end

  it 'returns empty array if prices are empty' do
    expect(stock_pick([])).to be_empty
  end

  it 'returns empty array if prices only has one day' do
    expect(stock_pick([1])).to be_empty
  end

  it 'does not pick a day in the past to sell' do
    prices = [4, 1, 2, 3]
    expect(stock_pick(prices)).to eq([1, 3])
  end

  it 'returns the earlist best days to buy and sell' do
    prices = [1, 7, 4, 9, 6, 2, 1, 10, 3]
    expect(stock_pick(prices)).to eq([0, 7])
  end

  it 'returns empty array if profit negative' do
    expect(stock_pick([4, 3, 2, 1])).to be_empty
  end
end

describe Towers do
  let(:new_game) { Towers.new }

  describe "#initialize" do
    it "creates a board with 3 disks correctly ordered" do
      expect(new_game.board).to eq([[3, 2, 1], [], []])
    end
  end

  describe '#move' do
    it 'successfully moves a piece' do
      new_game.move(0,2)
      expect(new_game.board).to eq([[3, 2], [], [1]])
    end

    it 'successfully moves a piece' do
      new_game.move(0,1)
      expect(new_game.board).to eq([[3, 2], [1], []])
    end

    it 'successfully moves a piece' do
      new_game.move(0,2)
      new_game.move(2,0)
      expect(new_game.board).to eq([[3, 2, 1], [], []])
    end

    it 'successfully moves a piece' do
      new_game.move(0,2)
      new_game.move(0,1)
      new_game.move(2,0)
      expect(new_game.board).to eq([[3, 1], [2], []])
    end

    it "raises error when moving larger piece on smaller piece" do
      e = "Not able to move larger disc onto small disc"
      expect{2.times {new_game.move(0,2)}}.to raise_error(e)
    end

    it "raises error when indicies out of bound" do
      e = "Index out of bounds"
      expect{new_game.move(-1,0)}.to raise_error(e)
    end

    it "raises error when indicies out of bound" do
      e = "Index out of bounds"
      expect{new_game.move(0,3)}.to raise_error(e)
    end

    it "raises error if starting position is empty" do
      e = "Start position empty"
      expect{new_game.move(1,2)}.to raise_error(e)
    end
  end

  describe '#won?' do
    let(:test_game) { Towers.new }

    it "returns true when game is won" do
      test_game.board = [[], [3, 2, 1], []]
      expect(test_game.won?).to be true
    end

    it "returns true when game is won" do
      test_game.board = [[], [], [3, 2, 1]]
      expect(test_game.won?).to be true
    end

    it "returns false when game is not finished" do
      expect(new_game.won?).to be false
    end

    it "returns false when game is not finished" do
      test_game.board = [[], [1], [3, 2]]
      expect(test_game.won?).to be false
    end
  end

end
