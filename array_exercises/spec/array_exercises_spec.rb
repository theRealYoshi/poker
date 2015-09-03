require 'array_exercises'
require 'rspec'

describe "#my_uniq" do
  # subject(:) {Array.new}

  it "should return an unduplicated array" do
    expect([1,1].my_uniq).to eq([1])
  end

  it "should return an unduplicated array with different numbers" do
    expect([3, 1, 2, 1, 2, 3].my_uniq).to eq([1,2,3])
  end

  it "should work for an array with no duplicates" do
    expect([1,2,3].my_uniq).to eq([1,2,3])
  end


end

describe "#two_sum" do

  it "should return indices for basic case" do
    expect([-1,1].two_sum).to eq([[0,1]])
  end

  it "should return indices in order for a multi number array" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
  end

  it "should return nothing if no two_sums" do
    expect([1,2,3].two_sum).to eq([])
  end

  it "should return smaller first element then smaller 2nd element" do
    expect([-1, 1, 1].two_sum).to eq([[0,1], [0,2]])
  end

end

describe "#my_transpose" do
  # subject(:) {Array.new}
  let(:trans_arr) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}
  let(:trans_arr2) {[[5, 1, 2], [3, 4, 5], [2, 7, 3]]}
  let(:trans_arr3) {[[7, 8], [13, 14], [2, 3]]}

  it "should transpose rows to columns of equal row to column length" do
    expect(trans_arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    expect(trans_arr2.my_transpose).to eq([[5, 3, 2], [1, 4, 7], [2, 5, 3]])
  end

  it "should transpose rows to columns of unequal row to column length" do
    expect(trans_arr3.my_transpose).to eq([[7,13,2], [8,14,3]])
  end

end

describe "#stock_picker" do
  # subject(:) {Array.new}
  # before do
  let(:stocks1) {[12, 145, 123, 13, 475, 281, 482]}
  let(:stocks2) {[532, 321, 231, 121, 2]}
  let(:stocks3) {[12, 16, 12 , 16]}
  # end
  #

  it "find most profitable days" do
    expect(stock_picker(stocks1)).to eq([0,6])
  end

  it "should return nothing if all unprofitable days" do
    expect(stock_picker(stocks2)).to eq([])
  end

  it "should return only 1 pair and should be first" do
    expect(stock_picker(stocks3)).to eq([0,1])
  end
  #
  # it "should return smaller first element then smaller 2nd element" do
  #   expect(.two_sum).to eq([[0,1], [0,2]])
  # end

end

describe Tower do
  # subject(:) {Array.new}
  # before do

  subject(:tower) {Tower.new}
  #subject(:Towerstack) {Tower.new(stack)}

  describe "#initialize" do
    context "when passed no arguments" do
      it "uses a default stack" do
        expect(tower.stacks).to eq([[3,2,1], [], []])
      end
    end

    context "when passed with arguements" do
      subject(:tower) { Tower.new(stacks) }
      let(:stacks) {[[4,3,2,1], [], []]}

      it "uses the passed in stack" do
        expect(tower.stacks).to be(stacks)
      end
    end
  end

  describe "#move" do
    before do
      tower.move(0, 1)
    end

    context "legal move" do
      it "moves from stack 1 to stack 2" do
        expect(tower.stacks).to eq([[3,2], [1], []])
      end
    end

    context "illegal move" do
      it "raises error message for an illegal move" do
        expect{tower.move(0,1)}.to raise_error("Illegal move.")
      end
    end
  end

  describe "#game_over?" do
    subject(:v_tower) { Tower.new(victory_stacks) }
    let(:victory_stacks) {[[], [3,2,1], []]}

    context "victory" do
      it "returns true" do
        expect(v_tower).to be_game_over
      end
    end

    context "not victory" do
      it "returns false" do
        expect(tower).not_to be_game_over
      end
    end
  end
end
