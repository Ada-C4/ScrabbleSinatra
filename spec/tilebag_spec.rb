require "spec_helper"
require "./lib/scrabble_master"

describe Scrabble::TileBag do
  before :each do
    @tilebag = Scrabble::TileBag.new
  end
  describe ".new" do
    it "creates a new instance of TileBag using the initialize method" do
      expect(@tilebag).to be_an_instance_of Scrabble::TileBag
    end
  end
  describe "#initialize" do
    it "creates a new tile bag full of 98 tiles" do
      expect(@tilebag.tile_bag.length).to eq 98
    end
  end
  describe "#draw_tiles(num)" do
    it "tests that #draw_tiles(num) actually returns an array" do
      expect(@tilebag.draw_tiles(0)).to eq []
    end
    it "returns 2 random tiles as an array and subtracts those tiles from the tilebag" do
      expect(@tilebag.draw_tiles(2).length).to eq 2
      expect(@tilebag.tile_bag.length).to eq 96
    end
  end
  describe "#tiles_remaining" do
    it "returns 88 of tiles remaining after removing 10 tiles" do
      @tilebag.draw_tiles(10)
      expect(@tilebag.tiles_remaining).to eq 88
    end
  end
end
