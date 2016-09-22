require 'card'
require 'rspec'

describe Card do

  describe '::random_card' do
    it 'generates a random card' do
      rand1 = Card.random_card
      rand2 = Card.random_card
      suites = rand1.suit == rand2.suit
      values = rand1.value == rand2.value

      expect([suites, values]).not_to eq([true, true])
    end
  end

  let(:new_card1) { Card.new("A", "S") }
  let(:new_card2) { Card.new("7", "H") }

  describe '#initialize' do
    it 'properly assigns face value' do
      expect(new_card1.face_value).to eq("A")
    end

    it 'properly assigns suit' do
      expect(new_card1.suit).to eq("S")
    end

    it 'raises error if initialized with invalid arguments' do
      expect{ Card.new("25", "C") }.to raise_error(ArgumentError)
      expect{ Card.new("8", "R") }.to raise_error(ArgumentError)
    end
  end

  describe '#compare' do
    it 'compares its value to another card of different value' do
      expect(new_card1.compare(new_card2)).to eq(1)
    end

    it 'compares its value to another card of different value' do
      expect(new_card2.compare(new_card1)).to eq(-1)
    end

    it 'compares its value to another card of same value' do
      expect(new_card2.compare(new_card2)).to eq(0)
    end
  end

end
