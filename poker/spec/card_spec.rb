require 'rspec'
require 'card.rb'

describe Card do

  describe "#initialize" do
    context "should load valid card" do
      subject(:card) {Card.new(suit, value)}
      let(:suit) {:hearts}
      let(:value) {:queen}
      it "should load a new card" do
        expect(card.suit).to eq(suit)
        expect(card.value).to eq(value)
      end
    end

    context "should raise error when loading invalid card" do
      it "should load a new card" do
        expect{card = Card.new(:fifteen, :queen)}.to raise_error("illegal suit (fifteen) or value (queen)")
      end
    end
  end

  describe "#all_cards" do
    subject(:all_cards) {Card.all_cards}

    it "should be 52 cards" do
      expect(Card.all_cards.length).to eq(52)
    end

    it "each card should be uniq" do
      expect(all_cards.uniq).to eq(all_cards)
    end

  end

end
