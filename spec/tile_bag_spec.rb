require "spec_helper"
require "./lib/tile_bag"

describe TileBag do
  before :each do
    @tile_bag = Scrabble::Scrabble::TileBag.new
  end

  describe '@default_tiles' do
    it "selects 7 random tiles" do
      expect(@tile_bag).to eq ['b', "b", "a"]
    end
  end

  describe "gives us 3 tiles" do
    it "returns random tiles" do
      expect(@tile_bag.draw_tiles(3)).to eq ['b', "b", "a"]
    end
  end

  describe "subtracts tiles from our bag" do
    it "subtracts tiles" do
      expect(@tile_bag).to eq ['b', "b", "a"]
    end
  end

  describe 'tiles_remaining' do
    it "tells us how many tiles left in bag" do
      expect(@tile_bag.tiles_remaining).to eq 6
    end
  end


end
