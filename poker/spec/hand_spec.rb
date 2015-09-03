require 'rspec'
require 'byebug'
require 'hand.rb'
require 'deck.rb'

describe Hand do
  subject(:deck) {Deck.new}
  subject(:hand) {Hand.new(deck)}

  describe "#initialize" do
    it "should have 5 cards in hand" do
      expect(hand.cards.length).to eq(5)
    end

    it "should have card objects in hand" do
      expect(hand.cards[0].class).to be(Card)
    end
  end

  describe "#drop_cards" do
    let(:cards) {[hand.cards[0]]}
    it "should drop up cards" do
      hand.drop_cards(cards)
      expect(hand.cards.length).to eq(4)
    end

    let(:cards2) {hand.cards[0..3]}
    it "should not drop more than 3 cards" do
      expect{hand.drop_cards(cards2)}.to raise_error("Can't drop this many cards.")
    end
  end

  describe "#take_cards" do
    let(:cards2) {hand.cards[0..2]}
    it "should take cards until hand has 5 cards after dropping cards" do
      hand.drop_cards(cards2)
      hand.take_cards(deck)
      expect(hand.cards.length).to eq(5)
    end
  end

  describe "#eval_hand" do
    subject(:royal_flush) {[ace, king, queen, jack, ten]}
    subject(:straight_flush) {[king, queen, jack, ten, nine]}
    subject(:four_kind) {[ace, ace, ace, ace, nine]}
    let(:ace) {Card.new(:spades, :ace)}
    let(:king) {Card.new(:spades, :king)}
    let(:queen) {Card.new(:spades, :queen)}
    let(:jack) {Card.new(:spades, :jack)}
    let(:ten) {Card.new(:spades, :ten)}
    let(:nine) {Card.new(:spades, :nine)}

    it "should evaluate a royal flush" do
      hand.eval_hand(royal_flush)
      expect(hand.value).to eq(1000)
    end

    it "should evaluate a straight flush" do
      hand.eval_hand(straight_flush)
      expect(hand.value).to eq(1000)
    end

    it "should evaluate a four of a kind" do
      hand.eval_hand(four_kind)
      expect(hand.value).to eq(700)
    end

  end

end
