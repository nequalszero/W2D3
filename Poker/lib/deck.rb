require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = new_deck
  end

  def new_deck
    deck = []
    "CSDH".each_char do |suit|
      "2,3,4,5,6,7,8,9,10,J,Q,K,A".split(",").each do |face_value|
        deck << Card.new(face_value, suit)
      end
    end
    deck
  end

  def shuffle!
    @deck.shuffle!
  end

  def deal_card
    @deck.pop
  end
end
