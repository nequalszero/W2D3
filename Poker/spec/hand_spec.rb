require 'rspec'
require 'hand'

describe Hand do
  subject(:new_hand) {Hand.new}
  let(:h5) { double("h5", :face_value => "5", :suit => "H", :value => 5)}
  let(:c5) { double("c5", :face_value => "5", :suit => "C", :value => 5)}
  let(:s5) { double("s5", :face_value => "5", :suit => "S", :value => 5)}
  let(:d5) { double("d5", :face_value => "5", :suit => "D", :value => 5)}
  let(:d6) { double("d6", :face_value => "6", :suit => "D", :value => 6)}
  let(:d7) { double("d7", :face_value => "7", :suit => "D", :value => 7)}
  let(:d8) { double("d8", :face_value => "8", :suit => "D", :value => 8)}
  let(:d9) { double("d9", :face_value => "9", :suit => "D", :value => 9)}
  let(:dQ) { double("dQ", :face_value => "Q", :suit => "D", :value => 12)}
  let(:sQ) { double("sQ", :face_value => "Q", :suit => "S", :value => 12)}

  describe '#initialize' do
    it 'has a cards variable' do
      expect(new_hand.cards.class).to eq(Array)
      expect(new_hand.cards).to be_empty
    end
  end

  describe '#add_card' do
    it 'adds a card to the cards array' do
      new_hand.add_card(d7)
      expect(new_hand.cards.first).to be(d7)
    end

    it 'adds only one card to the cards array' do
      new_hand.add_card(d7)
      expect(new_hand.cards.count(d7)).to be(1)
      expect(new_hand.cards.count).to be(1)
    end

    it 'raises an error if the hand is already full' do
      5.times { new_hand.add_card(d7) }
      expect{ new_hand.add_card(d8) }.to raise_error(HandIsFullError)
    end

  end

  describe '#remove_card' do
    it 'removes a card from the deck' do
      new_hand.add_card(d7)
      new_hand.add_card(dQ)
      new_hand.add_card(sQ)
      new_hand.add_card(d6)
      new_hand.add_card(d5)
      new_hand.remove_card(d7)
      expect(new_hand.cards.include?(d7)).to be false
    end

    it 'raises an error if you only have 2 cards' do
      new_hand.add_card(d7)
      new_hand.add_card(dQ)
      expect{ new_hand.remove_card(dQ) }.to raise_error(TwoCardError)
    end
  end

end
