require 'rspec'
require 'deck.rb'

describe Deck do

  subject(:deck) {Deck.new}
  # let(:suit) {:heart}
  # let(:value) {:queen}

  describe "#initialize" do
    context "should check number of cards" do
        it "should have 52 cards in cards array" do
        expect(deck.cards.length).to eq(52)
      end
    end

    context "should check number of cards" do
        it "should have 52 cards in cards array" do
        expect(deck.cards.length).to eq(52)
      end
    end
  end

  describe "#deal_cards" do

      let(:dealt_card) {deck.deal_cards}
      it "compares the classes" do
        expect(dealt_card.class).to be(Card)
      end


      let(:dealt_card) {deck.deal_cards}
      it "should return a deck less card" do
        expect(deck.cards.include?(dealt_card)).to eq(false)
      end


      it "should have one less card" do
        deck.deal_cards
        expect(deck.cards.length).to eq(51)
      end

  end

  # describe "#cards_shuffle" do
  #   let(:first_card) {deck.cards.first}
  #   it "should be different" do
  #     deck.cards_shuffle
  #     x = deck.cards[0]
  #     expect(x).to_not be(first_card)
  #   end
  # end

end
