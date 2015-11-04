require "spec_helper"
require "./lib/tilebag"

describe Scrabble::TileBag do
  before :each do
    @tilebag1 = Scrabble::TileBag.new
    @tilebag2 = Scrabble::TileBag.new
    @tilebag2.draw_tiles(4)
  end

  describe "#initialize" do
    it "sets up an instance of the TileBag class" do
      expect(@tilebag1).to be_an_instance_of Scrabble::TileBag
    end
    it "sets up an instance with a collection of default tiles" do
      expect(@tilebag1.tile_quantities).to_not be_empty
      expect(@tilebag1.tile_quantities.length).to eq 98
    end
  end

  describe "#draw_tiles" do
    it "returns the specifed number of random tiles" do
      expect(@tilebag2.draw_tiles(4).length).to eq 4
    end
    it "Removes the tiles from the default set" do
      expect(@tilebag2.tile_quantities.length).to eq 94
    end
  end

  describe "#tiles_remaining" do
    it " returns the number of tiles remaining in the bag" do
      expect(@tilebag2.tiles_remaining).to eq 94
    end
  end


end
