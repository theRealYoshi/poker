class Card

  SUIT_STRINGS = {
      :clubs    => "♣",
      :diamonds => "♦",
      :hearts   => "♥",
      :spades   => "♠"
    }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "11",
    :queen => "12",
    :king  => "13",
    :ace   => "14"
  }

  POKER_HANDS_VALUES = {
    :straight_flush => 1000,
    :four_kind      => 700,
    :full_house     => 500,
    :flush          => 400,
    :straight       => 300,
    :three_kind     => 200,
    :two_pair       => 150,
    :one_pair       => 100,
    :no_hand        => 0,
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  def self.card_values
    VALUE_STRINGS
  end

  def self.poker_hands
    POKER_HANDS_VALUES
  end

  def self.all_cards
    cards = []
    suits.each do |suit|
      values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    unless Card.suits.include?(suit) and Card.values.include?(value)
      raise "illegal suit (#{suit}) or value (#{value})"
    end

    @suit, @value = suit, value
  end

  def ==(other_card)
    return false if other_card.nil?

    [:suit, :value].all? do |attr|
      self.send(attr) == other_card.send(attr)
    end
  end

end
