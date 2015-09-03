require_relative 'deck.rb'

class Hand
  attr_accessor :cards
  #initialize with a 5 card hand
  def initialize(deck)
    @cards = []
    5.times do
      @cards << deck.deal_cards
    end
  end

  def drop_cards(d_cards)
    raise "Can't drop this many cards." if d_cards.length > 3
    raise "" unless d_cards.all? { |d_card| cards.include?(d_card)}
    d_cards.each do |card|
      self.cards.delete(card)
    end
  end

  def take_cards(deck)
    until cards.length >=5
      self.cards << deck.deal_cards
    end
  end

  # calculating poker logic
  # record hand.cards values and suites in an array
  # sort the array based on values
  # initial a score variable to 0
  # iterate through possible cases - pairs, threeofkind, straight,
  # full house, flush, royal flush - assign a number based on rank to a variable
  # return variable number if it's greater than 0, else return the highest card with highest suite
  #
  #
  # logic which hands beat what
  #

end
