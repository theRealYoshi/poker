require_relative "card.rb"

class Deck

  attr_accessor :cards

  def initialize
    @cards = Card.all_cards
  end

  def deal_cards
    self.cards.shift
  end

  def cards_shuffle
    self.cards.shuffle
      nil
  end

end
