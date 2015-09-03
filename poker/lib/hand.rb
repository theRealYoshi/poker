require 'byebug'
require_relative 'deck.rb'
require_relative 'card.rb'

class Hand
  attr_accessor :cards, :value
  #initialize with a 5 card hand
  def initialize(deck)
    @value = 0
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


  def eval_hand(hand)
    suits = hand.map{ |h| h.suit}
    values = hand.map{ |h| Card.card_values[h.value].to_i}
    case
      debugger
    when suits.all?{ |suit| Card.suits.any? {|card_suit| suit == card_suit}} && ((values.max - values.min) == 4) && values.uniq.count == values.count
      @value = Card.poker_hands[:straight_flush]
    when values.uniq == 2 && values.uniq.any? {|value| values.count(value) == 4 } #four of a kind
      @value = Card.poker_hands[:four_kind]
    # # when hand (# 3 and 2)
    # # when hand #same suit
    # # when hand #cascading order
    # # when hand #3 of a kind
    # # when hand #two pairs
    # # when hand #one pair
    else
      hand_value = 0
    end
    # hand_value
  end

end
