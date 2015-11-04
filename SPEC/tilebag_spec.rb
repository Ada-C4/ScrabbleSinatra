require "./lib/scrabble_module"

describe Scrabble::TileBag do
  before :each do
    @tilebag = Scrabble::TileBag.new
  end


  describe "TileBag.new" do
    it "creates a new instance of TileBag" do
      expect(@tilebag).to be_an_instance_of Scrabble::TileBag
    end
  end

  describe "draw_tiles(num)" do
    it "returns 7 random tiles" do
      expect(@tilebag.draw_tiles(7).length).to eq 7
    end

    it "takes away 7 tiles from the tilebag" do
      num_tiles_in_bag = @tilebag.tilebag.length
      @tilebag.draw_tiles(7)
      expect(@tilebag.tilebag.length).to eq (num_tiles_in_bag - 7)
    end
  end

  describe "tiles_remaining" do
    it "returns the remaining number of tiles in the bag at beginning of game" do
      expect(@tilebag.tiles_remaining).to eq 98
    end

    it "returns the remaining number of tiles in the bag after drawing 7" do
      @tilebag.draw_tiles(7)
      expect(@tilebag.tiles_remaining).to eq 91
    end
  end
end
