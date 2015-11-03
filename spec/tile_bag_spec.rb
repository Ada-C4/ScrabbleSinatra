require "spec_helper"
require './lib/tile_bag.rb'

describe TileBag do
  before :each do
    @tile_barf = TileBag.new
  end

  describe "#new" do
    it "create a new instance of Player" do
      expect(@tile_barf).to be_an_instance_of TileBag
    end

    it "expect there to be the correct number of letters" do
      expect(@tile_barf.tile_hash[:J]).to eq 1
    end
  end

  describe "#make_tiles" do
    it "creates and array of tiles with 'A' in the first position" do
      expect(@tile_barf.tile_bag[0]).to eq "A"
    end

    it "ensures the last index of tile_bag is z" do
      expect(@tile_barf.tile_bag[-1]).to eq "Z"
    end

    it "creates an array that is the correct length" do
      count = @tile_barf.tile_hash.values
      sum = 0
      count.each { |item| sum += item }
      expect(@tile_barf.tile_bag.length).to eq sum
    end
  end

  describe "#draw_tiles" do
    it "removes num random tiles from tile bag" do
      expect(@tile_barf.draw_tiles(1).length).to eq 1
    end

    it "removes random tiles from tile bag" do
      expect(@tile_barf.draw_tiles(7)).not_to eq @tile_barf.draw_tiles(7)
    end

    it "does not return nil" do
      expect(@tile_barf.draw_tiles(1)).not_to eq [nil]
    end
  end

  describe "tiles_remaining" do
    it "returns the number of tiles remaining in the tile_bag" do
      @tile_barf.draw_tiles(7)
      expect(@tile_barf.tiles_remaining).to eq 91
    end
  end
end
