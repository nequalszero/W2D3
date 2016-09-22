class Card
  attr_reader :face_value, :suit, :value

  VALUES = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13,
    'A' => 14
  }

  SUITS = ["S", "C", "D", "H"]


  def initialize(face_value, suit)
    @face_value = face_value.to_s
    @suit = suit.upcase

    if VALUES.include?(face_value) && SUITS.include?(suit)
      @value = VALUES[@face_value]
    else
      raise ArgumentError.new("Card Initialization Error: " +
                          "not a real card: #{face_value}#{suit}")
    end

  end

  def compare(other_card)
    @value <=> other_card.value
  end

  def self.random_card
    Card.new(VALUES.keys.sample, SUITS.sample)
  end

end
