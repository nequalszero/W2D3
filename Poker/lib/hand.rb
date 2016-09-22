require_relative 'deck'

class HandIsFullError < StandardError
end
class TwoCardError < StandardError
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    if @cards.count == 5
      raise HandIsFullError.new("Hand#add_card error: hand is already full")
    else
      @cards << card
    end
  end

  def remove_card(card)
    if @cards.count == 2
      raise TwoCardError.new("Hand#remove_card error: hand only has 2 cards left")
    else
      @cards.delete(card)
    end
  end
end
