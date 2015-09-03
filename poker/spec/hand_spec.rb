require 'rspec'
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

end
