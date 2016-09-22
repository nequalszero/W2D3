require 'rspec'
require 'deck'
require 'card'

describe Deck do
  subject (:deck1) { Deck.new }

  describe "#initialize" do

    it 'creates deck of 52 unique cards' do
      expect(deck1.deck.uniq.length).to eq(52)
    end

    it 'creates a deck of card instances' do
      expect(deck1.deck.all? { |card| card.is_a?(Card) }).to be true
    end

  end

  describe "shuffle!" do
    it 'calls #shuffle! on deck' do
      deck1.shuffle!
      expect(deck1.deck).to_not eq(Deck.new.deck)
    end
  end

  describe 'deal_card' do
    it 'returns card from top of the deck' do
      expect(deck1.deal_card.class).to eq(Card)
    end

    it "removes a card from the deck" do
      current_length = deck1.deck.length
      deck1.deal_card
      expect(deck1.deck.length).to eq(current_length - 1)
    end
  end


end
